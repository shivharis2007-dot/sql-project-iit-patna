# Dashboard Specification (Part C): Tableau Public

## 1. Data source

Connect to `data/orders_clean.csv` (text file connector, first row as header). Keep `order_month` as a string (text).

| # | Column | Classification |
|---|---|---|
| 1 | order_id | Dimension |
| 2 | order_month | Dimension |
| 3 | clean_first_name | Dimension |
| 4 | clean_last_name | Dimension |
| 5 | region | Dimension |
| 6 | rep_name | Dimension |
| 7 | item | Dimension |
| 8 | category | Dimension |
| 9 | unit_price | Measure |
| 10 | quantity | Measure |
| 11 | amount | Measure |
| 12 | revenue_calc | Measure |
| 13 | status | Dimension |

Total: 13 columns, 9 Dimensions and 4 Measures. The source has 63 rows, all `completed`.

## 2. KPI cards

| Card | Definition | Value shown |
|---|---|---|
| Total Revenue | SUM(amount) | INR 346,200 |
| Total Units Sold | SUM(quantity) | 106 units |

The Total Revenue card equals Part A's q05 `total_revenue` (346200).

## 3. Chart sheets

### Sheet 1: Revenue by Region (bar chart)
- Rows: `region` (sorted descending by SUM(amount)). Columns: SUM(amount). Colour: none (single colour); labels on.
- Why: a bar chart compares one measure across a few categories by length, which is the easiest comparison to read.

| region | Revenue (INR) |
|---|---:|
| North | 119300 |
| South | 82500 |
| West | 74900 |
| East | 69500 |
| **Total** | **346200** |

### Sheet 2: Revenue by Category (bar chart)
- Rows: `category` (sorted descending). Columns: SUM(amount). Colour: `category`; labels on.
- Why: three categories compare cleanly as bars, and the lengths show the share each carries.

| category | Revenue (INR) |
|---|---:|
| Electronics | 142300 |
| Home | 126400 |
| Apparel | 77500 |
| **Total** | **346200** |

### Sheet 3: Revenue Trend by Month and Category (line chart)
- Columns: `order_month` (discrete). Rows: SUM(amount). Colour: `category` (one line per category); markers and labels on.
- Why: a line chart shows direction and change across ordered time points, and separate lines let categories be compared month by month.

| order_month | Apparel | Electronics | Home | Month total |
|---|---:|---:|---:|---:|
| 2026-09 | 24700 | 43000 | 30600 | 98300 |
| 2026-10 | 30600 | 49900 | 12600 | 93100 |
| 2026-11 | 22200 | 49400 | 83200 | 154800 |
| **Total** | **77500** | **142300** | **126400** | **346200** |

### Sheet 4: Region x Category Detail (text table)
- Rows: `category`. Columns: `region`. Text (Marks card): SUM(amount); Totals on (row and column grand totals). Colour: none.
- Why: a text table gives the exact value of every region and category pair, which charts only approximate.

| category | East | North | South | West | Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

## 4. Dashboard layout

Top to bottom:
1. **KPI band**: horizontal container with the two KPI cards (Total Revenue, Total Units Sold) side by side.
2. **Filter band**: directly below the KPI cards, a horizontal container holding the `category` filter (multi-value dropdown, all selected by default). Set it to *Apply to Worksheets > Selected Worksheets*, ticking all four worksheets that use this data source (it shares the one source, so it is applied to all four).
3. **Trend chart**: Revenue Trend by Month and Category, full width.
4. **Comparison charts**: a horizontal container with Revenue by Region on the left and Revenue by Category on the right, equal width.
5. **Detail table**: Region x Category Detail, full width at the bottom.

Containers: one outer vertical container (fit width, fixed size 1200 x 1000) holding the five bands; horizontal containers for the KPI band, the filter band and the comparison charts.

**Use as Filter.** With Use as Filter switched on for Revenue by Region, clicking a region bar (for example North) filters the other sheets to that region: Revenue by Category, the trend lines and the detail table all show only North's rows, and the KPI cards update to North's figures (119300 and its units). Clicking the bar again, or the blank space, clears it.

## 5. Insight and recommendations

### Visualization summary
The dashboard shows completed-order revenue of INR 346,200 from 106 units across four regions, three categories and three months (2026-09 to 2026-11). The KPI cards give the headline, the filter slices everything by category, the trend line shows the monthly movement per category, the two bars rank regions and categories, and the detail table gives the exact region-by-category figures.

### Summary analysis
1. **Region comparison.** North leads with 119300 (34.5% of revenue), 1.7 times East, the smallest at 69500. South (82500) and West (74900) sit in between.
2. **Category mix and its regional skew.** Electronics is the largest category at 142300 (41.1%), and 73400 of it comes from North, which is 61.5% of North's own revenue. West Electronics is only 18800, about a quarter of North's figure.
3. **Change across months.** Revenue fell from 98300 in 2026-09 to 93100 in 2026-10, then jumped to 154800 in 2026-11, up 61700 (+66.3%) on October.
4. **Home drives the November jump.** Home revenue went from 12600 in 2026-10 to 83200 in 2026-11 (6.6 times), while Apparel fell from 30600 to 22200 (-27.5%) and Electronics held at about 49400 to 49900.
5. **Apparel concentration.** West contributes 37500 of Apparel's 77500 (48.4%), while South (10000) and East (10600) are the weakest region-category pairs on the table.

### Recommendations
1. **West, Electronics: promotional push.** West Electronics earned only 18800 against 73400 in North. Run a bundle offer on Smart Watch plus Wireless Earbuds for West customers through the West rep. Watch: West Electronics monthly revenue, targeting more than 9400 a month (a 50% lift on the current 18800 over three months, about 6267 a month).
2. **Home, South and East: stock decision.** Home revenue reached 83200 in 2026-11, led by South (43800 across the period) and East (37500). Raise Air Fryer stock for South and East before the next peak, since Air Fryer orders of three units produced the 15600 maximum. Watch: Home sell-through rate and stock-out days in South and East.
3. **South and East, Apparel: promotion.** South Apparel (10000) and East Apparel (10600) are the lowest cells in the table, and Apparel fell 27.5% in November. Run a discount on Running Shoes and Denim Jacket in those two regions. Watch: Apparel revenue in South and East per month, targeting above 5000 a month each, against the current 3333 and 3533 a month.

## 6. Reconciliation

| Source | Value (INR) |
|---|---:|
| Total Revenue KPI | 346200 |
| Sum of Revenue by Region | 346200 |
| Sum of Revenue by Category | 346200 |
| Part B pivot (i) grand total | 346200 |

All four values are equal.
