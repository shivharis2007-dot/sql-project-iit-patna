# sql-project-iit-patna
# Sales Data Analysis Using SQL, Spreadsheets, and Tableau

## 1. Project Title

**Sales Data Analysis and Reporting Using SQL, Spreadsheets, and Tableau Public**

## 2. Tools Used

- **SQL compiler:** DB Fiddle *(if this is the compiler you used; otherwise replace it with your actual compiler).*
- **SQL dialect:** MySQL *(confirm this matches your selected compiler dialect).*
- **Spreadsheet tool:** Microsoft Excel *(replace if you used Google Sheets or another spreadsheet tool).*
- **Dashboard tool:** Tableau Public.
- **Data validation:** Python and pandas.

## 3. Tableau Public Dashboard

**Status:** Not built or published yet.

The Tableau Public dashboard link will be added here after the dashboard is created and published.

## 4. Three Most Important Findings

The SQL and spreadsheet analysis identified 63 completed orders with a total order amount of 346,200 and an average order amount of approximately 5,495.24. The largest order amount was 15,600, shared by order IDs 1061, 1065, 1069, and 1077. Three orders—1001, 1010, and 1064—contain missing amount values; these are pending orders, so the missing values are preserved as blanks rather than incorrectly replaced with zero. The spreadsheet workflow also cleans customer names, enriches orders with product categories and unit prices, calculates revenue using unit price multiplied by quantity, and summarizes sales by category, region, and month.

## 5. File Index

### Part A — SQL Queries and Results

| File | Description |
|---|---|
| `sql/00_schema_and_seed.sql` | Creates and populates the database tables. |
| `sql/q01.sql` to `sql/q13.sql` | Contains the 13 SQL queries, with one business question per file. |
| `results/query_results.md` | Records query outputs and seed-validation row counts. |

### Part B — Spreadsheet Cleaning and Enrichment

| File | Description |
|---|---|
| `data/orders_enriched.csv` | Input dataset for spreadsheet processing. |
| `data/orders_clean.csv` | Final cleaned dataset with 63 completed orders and 13 required columns. |
| `docs/spreadsheet_notes.md` | Documents formulas, aggregate statistics, pivot summaries, validation, reconciliation, and spreadsheet setup. |

### Part C — Dashboard Visualization

| File or resource | Description |
|---|---|
| Tableau Public dashboard | Interactive visualization of sales findings and summary metrics. |
| Published dashboard URL | To be added after the dashboard is built and published. |

## 6. Assumptions and Decisions

1. The `order_month` column is preserved as text in `YYYY-MM` format.
2. Customer names are cleaned by trimming whitespace and applying proper capitalization.
3. Product lookups use exact matching. An unmatched product returns `UNKNOWN_ITEM`.
4. `revenue_calc` is calculated as `unit_price × quantity`.
5. Only rows with `status = completed` are included in the completed-order output.
6. Missing amounts are preserved as blanks, not replaced with zero.
7. The three known missing-amount records are pending and are excluded from completed-order aggregate calculations.
8. The category-by-region summary uses the sum of `amount`; the monthly summary reports the sum of `amount` and the count of `order_id`.
9. The completed-order CSV contains 63 data rows, excluding the header, and uses the 13 columns specified in the assignment.
10. The Tableau Public dashboard is not claimed as completed until it has actually been created and published.

## 7. Validation Summary

The completed-order output is expected to contain these columns in the specified order:

`order_id`, `order_month`, `clean_first_name`, `clean_last_name`, `region`, `rep_name`, `item`, `category`, `unit_price`, `quantity`, `amount`, `revenue_calc`, `status`

The key aggregate checks are:

- **Completed-order count:** 63
- **Total amount:** 346,200
- **Average amount:** 5,495.24

These figures should be reconciled with the Part A SQL results before final submission.
