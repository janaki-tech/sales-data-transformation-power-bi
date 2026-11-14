let
    // Update this path to where you saved sales_raw.csv
    Source = Csv.Document(
        File.Contents("C:\YOUR_FOLDER\Sales_Data_Analysis_PowerBI\data\sales_raw.csv"),
        [Delimiter=",", Columns=9, Encoding=65001, QuoteStyle=QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),

    // Clean whitespace and non-printable characters in text columns
    CleanText = Table.TransformColumns(
        PromotedHeaders,
        {
            {"OrderID", each if _ = null then null else Text.Trim(Text.Clean(Text.From(_))), type text},
            {"CustomerID", each if _ = null then null else Text.Trim(Text.Clean(Text.From(_))), type text},
            {"Region", each if _ = null then null else Text.Trim(Text.Clean(Text.From(_))), type text},
            {"Category", each if _ = null then null else Text.Trim(Text.Clean(Text.From(_))), type text},
            {"Product", each if _ = null then null else Text.Trim(Text.Clean(Text.From(_))), type text}
        }
    ),

    // Replace blank text values with Unknown
    ReplaceBlankText = Table.TransformColumns(
        CleanText,
        {
            {"CustomerID", each if _ = null or _ = "" then "Unknown" else _, type text},
            {"Region", each if _ = null or _ = "" then "Unknown" else _, type text},
            {"Category", each if _ = null or _ = "" then "Unknown" else _, type text},
            {"Product", each if _ = null or _ = "" then "Unknown" else _, type text}
        }
    ),

    // Parse types safely; invalid values become null
    ParseDate = Table.TransformColumns(
        ReplaceBlankText,
        {{"OrderDate", each try Date.From(_) otherwise null, type date}}
    ),
    ParseNumbers = Table.TransformColumns(
        ParseDate,
        {
            {"Quantity", each try Int64.From(_) otherwise null, Int64.Type},
            {"UnitPrice", each try Number.From(_) otherwise null, Currency.Type},
            {"Sales", each try Number.From(_) otherwise null, Currency.Type}
        }
    ),

    // Remove rows without a usable order ID and remove duplicate orders
    ValidOrderIDs = Table.SelectRows(ParseNumbers, each [OrderID] <> null and [OrderID] <> ""),
    UniqueOrders = Table.Distinct(ValidOrderIDs, {"OrderID"}),

    // Keep rows with valid quantity and unit price; calculate a consistent sales value
    ValidSalesRows = Table.SelectRows(
        UniqueOrders,
        each [Quantity] <> null and [UnitPrice] <> null
    ),
    RecalculatedSales = Table.AddColumn(
        ValidSalesRows,
        "CalculatedSales",
        each [Quantity] * [UnitPrice],
        Currency.Type
    ),
    RemoveOldSales = Table.RemoveColumns(RecalculatedSales, {"Sales"}),
    Final = Table.RenameColumns(RemoveOldSales, {{"CalculatedSales", "Sales"}})
in
    Final
