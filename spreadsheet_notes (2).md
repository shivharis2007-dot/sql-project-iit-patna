# Spreadsheet Documentation & Audit Notes (Part B)

---

## 1. Overview & Setup

* **Sheet Architecture:** The workbook consists of three primary tabs:
  * `orders`: Main repository holding all raw and computed order details.
  * `products`: Reference mapping table containing product metadata.
  * `completed_orders`: Cleaned, filtered, and sorted extract dedicated exclusively to completed transactions.
* **Volume:** `orders` contains 90 rows of records (spanning rows 2 to 91). `products` covers range `A1:C10` (header + 9 item records).
* **Import Rules:** Automatic text-to-date conversion was intentionally turned off during CSV import. `order_month` is strictly maintained as plain text (e.g., `2026-09`, `2026-10`, `2026-11`) to prevent unwanted date formatting shifts.

---

## 2. Calculated Columns & Formulas (`orders` Tab)

All calculated fields were applied starting at row 2 and dragged down through row 91. Range references across lookup formulas are fully absolute (`$`) to guarantee stability.

| Column | Name | Formula (Row 2) | Purpose & Notes |
| :--- | :--- | :--- | :--- |
| **K** | `clean_first_name` | `=PROPER(TRIM(C2))` | Strips excess whitespace and standardizes casing. |
| **L** | `clean_last_name` | `=PROPER(TRIM(D2))` | Strips excess whitespace and standardizes casing. |
| **M** | `category` | `=VLOOKUP(G2,products!$A$2:$C$10,2,FALSE)` | Fetches category matching the item name. |
| **N** | `unit_price` | `=XLOOKUP(G2,products!$A$2:$A$10,products!$C$2:$C$10,"UNKNOWN_ITEM")` | Modern lookup for item prices; returns `"UNKNOWN_ITEM"` if missing. |
| **O** | `revenue_calc` | `=N2*J2` | Calculates order value (`unit_price * quantity`). |

---

## 3. Data Integrity Checks & Business Logic

* **Handling Missing Values:** Orders `1001`, `1010`, and `1064` have empty `amount` cells because their status is `pending`. They were left blank intentionally rather than backfilled with calculated values ($5,600, $3,200, and $2,800). Unconfirmed orders must not be booked as realized revenue. However, `revenue_calc` still calculates their potential value for tracking purposes.
* **Data Types & Uniqueness:** 
  * All 90 `order_id` entries are unique.
  * Numeric validation (`ISNUMBER`) confirmed that all non-blank cells in `amount`, `quantity`, `unit_price`, and `revenue_calc` are formatted properly.
* **Outlier Verification:** The maximum completed transaction value is **$15,600** (3 Air Fryers at $5,200 each), shared across four orders (`1061`, `1065`, `1069`, `1077`). This reflects valid orders with the maximum item quantity (3).

---

## 4. Completed Orders Summary & Reconciliation

`completed_orders` was populated by filtering `orders` where `status = completed` (resulting in 63 records) and sorting by `amount` descending.

### Aggregate Metrics (`amount` Column - Range `K2:K64`)

* **Order Count:** 63
* **Total Revenue (SUM):** $346,200
* **Average Order Value:** $5,495.24
* **Minimum Order Value:** $1,100
* **Maximum Order Value:** $15,600

> **Reconciliation:** All three core metrics (`COUNT`, `SUM`, `AVERAGE`) match Part A (q05) benchmarks exactly with zero discrepancy.

---

## 5. Summary Pivot Tables

### (i) Category Revenue by Region

| Category | East | North | South | West | Grand Total |
| :--- | ---: | ---: | ---: | ---: | ---: |
| **Apparel** | $10,600 | $19,400 | $10,000 | $37,500 | **$77,500** |
| **Electronics** | $21,400 | $73,400 | $28,700 | $18,800 | **$142,300** |
| **Home** | $37,500 | $26,500 | $43,800 | $18,600 | **$126,400** |
| **Grand Total** | **$69,500** | **$119,300** | **$82,500** | **$74,900** | **$346,200** |

### (ii) Monthly Performance Overview

| Order Month | Total Revenue (Sum of amount) | Total Orders (Count of order_id) |
| :--- | ---: | ---: |
| **2026-09** | $98,300 | 19 |
| **2026-10** | $93,100 | 20 |
| **2026-11** | $154,800 | 24 |
| **Grand Total** | **$346,200** | **63** |

---

## 📌 Handoff Checklist for Team Members

1. **Static Data Warning:** The `completed_orders` sheet contains **pasted values**, not live dynamic formulas.
2. **Exclusions:** Pending and disputed orders are intentionally omitted from `completed_orders`.
3. **Data Refresh Procedure:** If underlying source rows are modified:
   - Re-apply the filter (`status = completed`) on `orders`.
   - Copy and paste updated rows into `completed_orders`.
   - Re-verify that `COUNT = 63` and `SUM = 346,200` prior to exporting or sharing final figures.