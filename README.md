# Monthly Operations Analytics | Power BI Portfolio

**Independent demonstration project using 100% synthetic data.** Not a company report. No real names, credentials, customer records, internal connections, or proprietary measures are included.

## What this demonstrates
- Multi-page monthly reporting: executive summary, operational details, and quality/exception monitoring
- KPI design and matrix/table visualizations
- Power Query data ingestion and type validation
- DAX measures for completion rate, backlog, overdue rate, quality flags, and month-over-month change
- Slicers for month/year, region, and team

## Files
- `data/synthetic_monthly_operations.csv`: self-contained, fictional dataset (1,440 rows, 2025–2026)
- `powerbi/load_data.m`: optional Power Query import script (update the local file path first)
- `powerbi/measures.dax`: ready-to-copy DAX measures
- `powerbi/calendar.dax`: calendar table and date helper columns
- `dashboard.html`: interactive browser-based preview of the proposed report; **this is not a Power BI file**
- `powerbi/BUILD_IN_POWER_BI.md`: exact steps to construct the `.pbix` report in Power BI Desktop

## Build the Power BI report
1. Open Power BI Desktop > **Get data > Text/CSV** and select `data/synthetic_monthly_operations.csv`.
2. Rename the imported table `MonthlyOperations`; verify column data types, especially `MonthStart` (Date).
3. Create the Calendar table, relationship, and measures using the files in `powerbi/`.
4. Build the three report pages described in `BUILD_IN_POWER_BI.md`.
5. Save as `Monthly_Operations_Analytics.pbix` and optionally add it to this repository if the resulting file contains **only** the provided synthetic dataset.

The browser preview is a standalone interactive demonstration. The included source files can be used to build a native editable Power BI report.

## Data notes
All data was generated programmatically for this portfolio. `RequestsPending = RequestsReceived - RequestsCompleted`. `RequestsOverdue` is a subset of pending requests. `QualityFlags` is a subset of completed requests. `AvgResolutionDays` is a synthetic monthly metric and is weighted by completed volume in the DAX measure.

## Privacy
This is a newly created generic portfolio example. It is not derived by extracting, redacting, or republishing production report data or formulas.
