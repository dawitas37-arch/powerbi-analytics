# Create the native Power BI report (.pbix)

## 1. Load data
In Power BI Desktop choose **Get Data → Text/CSV** and import `data/synthetic_monthly_operations.csv`. Rename the table to `MonthlyOperations`, set `MonthStart` to Date, numeric counts to Whole number, and `AvgResolutionDays` to Decimal number. Alternatively paste `load_data.m` into Power Query after fixing `FilePath`.

## 2. Date and measures
Create the calculated `Calendar` table in `calendar.dax`. Create a relationship from `Calendar[Date]` (one) to `MonthlyOperations[MonthStart]` (many). Mark `Calendar` as the date table. Create measures from `measures.dax`. Format Completion Rate, Overdue Rate, Quality Flag Rate and Completed MoM % as Percentage.

## 3. Page 1: Monthly Overview
- Page title: **Monthly Operations Overview**
- Slicers: `Calendar[Year]`, `MonthlyOperations[Region]`, `MonthlyOperations[Team]`
- Cards: Total Requests, Completed Requests, Completion Rate, Pending Requests
- Matrix: Rows = Team, Columns = ServiceCategory, Values = Completed Requests
- Matrix: Rows = Region, Values = Total Requests, Completed Requests, Pending Requests, Completion Rate
- Optional line chart: Axis = `Calendar[Date]` (Month), Value = Completed Requests

## 4. Page 2: Operational Detail
- Table visual: MonthStart, Region, Team, ServiceCategory, RequestsReceived, RequestsCompleted, RequestsPending, RequestsOverdue
- Table visual: Region, Team, Total Requests, Completed Requests, Completion Rate
- Table visual: ServiceCategory, Total Requests, Pending Requests, Overdue Requests
- Slicers synchronized across pages

## 5. Page 3: Quality & Exceptions
- Cards: Overdue Requests, Overdue Rate, Quality Flags, Weighted Avg Resolution Days
- Table visual: Region, Team, ServiceCategory, Overdue Requests, Quality Flags
- Matrix: Rows = Team, Columns = Region, Values = Overdue Requests
- Optional clustered bar chart: Axis = ServiceCategory, Values = Overdue Requests, Quality Flags

## 6. Styling and finish
Use a professional navy/teal palette; align cards, reduce gridline clutter, format thousands separators, label rates clearly, and add a footer: **Portfolio demonstration | Synthetic data only**. Use View → Sync slicers across pages. Validate totals by comparing to the CSV. Save as `Monthly_Operations_Analytics.pbix`.

Important: This is a **new** report. Do not paste original employer report queries, metadata, measures, layouts, images, or connection strings into it.
