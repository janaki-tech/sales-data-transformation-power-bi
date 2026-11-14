# Power BI report guide

## Suggested page: Sales Overview

### KPI cards
- Total Sales
- Total Orders
- Total Quantity
- Average Order Value

### Charts
1. **Sales by Region** — clustered bar chart; Axis: Region; Values: Total Sales.
2. **Sales by Category** — clustered column chart; Axis: Category; Values: Total Sales.
3. **Monthly Sales Trend** — line chart; X-axis: OrderDate (Month); Y-axis: Total Sales.
4. **Top Products** — bar chart; Axis: Product; Values: Total Sales; sort descending.
5. **Order Details** — table with OrderID, OrderDate, Region, Category, Product, Quantity, Sales.

## Formatting suggestions
- Use a consistent blue-and-white theme.
- Format Sales and Average Order Value as currency.
- Add slicers for OrderDate, Region, and Category.
- Give the page a clear title: **Sales Performance Dashboard**.

## Validation checklist
- Confirm the cleaned table has unique OrderID values.
- Check that Quantity and UnitPrice contain no conversion errors.
- Confirm Sales equals Quantity multiplied by UnitPrice.
- Compare the KPI total with the sum of the Sales column.
