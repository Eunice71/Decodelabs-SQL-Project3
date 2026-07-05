# Project 3: SQL Data Analysis
DecodeLabs Data Analytics Internship, Batch 2026

## Overview
This project used SQL queries in MySQL Workbench to extract specific, actionable answers from a 1,200-row e-commerce sales dataset. Rather than exploring data visually like in Project 2, this phase asked precise business questions and let structured queries return exact answers.

## Dataset
1,200 orders, 14 columns: OrderID, Date, CustomerID, Product, Quantity, UnitPrice, ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber, ItemsInCart, CouponCode, ReferralSource, TotalPrice.

## Key Queries & Findings
### 1. Filtering with WHERE
Out of 1,200 total orders, exactly 250 were Cancelled; roughly 1 in every 5 orders placed never completed. This confirmed and gave a precise number to a pattern first spotted during the EDA phase in Project 2.
###2. Sorting with ORDER BY
The top 10 highest value orders in the entire dataset all shared one thing in common, every single one had the maximum possible quantity of 5 units. The highest individual order came to $3,456.40. This ruled out data error and confirmed these were genuine bulk purchases.
### 3. Aggregating with GROUP BY
Breaking revenue down by product revealed that Chair and Printer each generated just over $195,000 in total revenue, the highest of all seven products. However, Laptop had the highest average order value at $1,110.56 per order, meaning it earns more per sale even though it sells less overall. Phone had the lowest average order value at $972.58. Total revenue and average sale value told two completely different stories about which product was "best."
### 4. Combining WHERE and GROUP BY
Filtering only the 250 cancelled orders and then grouping by payment method showed that cancellations were spread almost evenly across all five payment methods, Credit Card was slightly highest at 54 cancelled orders, while Debit Card was lowest at 44. No single payment method stood out as the main driver of cancellations, which ruled out payment issues as the root cause.
### 5. Filtering groups with HAVING
When filtering to only show products whose average order value exceeded $1,000, two products dropped off the list entirely, Desk ($985.06 average) and Phone ($972.58 average) fell below the threshold. The remaining five products which are Laptop, Chair, Printer, Monitor, and Tablet all cleared the $1,000 mark, suggesting Desk and Phone may need a pricing or bundling review.
### 6. Percentage contribution (subquery)
Calculating each order status as a share of all 1,200 orders showed a clear problem: Cancelled orders made up 20.83% of all orders, making it the single largest status category, ahead of even Delivered orders at 19.25%. The five statuses were otherwise very evenly distributed, which made the cancellation rate stand out even more sharply.

## Something to Note:
Across all six queries, one finding kept surfacing: the business has a cancellation problem that its overall order volume is masking. Monthly totals look stable, but more than 1 in 5 orders is quietly dying before it completes. Payment method is not the cause. Product type has not been ruled out yet, that would be the logical next query to write.

## Tools Used
MySQL Workbench: SELECT, WHERE, ORDER BY, GROUP BY, HAVING, COUNT, SUM, AVG, ROUND, subqueries

## Key Takeaways
Precise numbers matter more than general observations. "a lot of cancellations" becomes actionable when it becomes "20.83%."
Aggregation can reveal contradictions: the best-selling product by total revenue is not the same as the most valuable product per sale.
SQL does not just answer questions, it eliminates wrong answers, which is equally valuable.
