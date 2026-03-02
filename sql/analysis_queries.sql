/* ============================================================================
   📊 PRICING STRATEGY A/B TEST ANALYSIS
   ----------------------------------------------------------------------------
   Objective:
   Evaluate whether a 5% pricing reduction improves conversion rate
   and overall revenue per user in an e-commerce environment.
   ============================================================================ */



/* ============================================================================
   1️⃣ SAMPLE SIZE VALIDATION
   ----------------------------------------------------------------------------
   WHY:
   Ensure traffic is evenly split between control and treatment.
   Uneven allocation can bias experiment results.
   ============================================================================ */

SELECT
    group,
    COUNT(*) AS total_users
FROM pricing_ab_test
GROUP BY group;



/* ============================================================================
   2️⃣ CONVERSION RATE
   ----------------------------------------------------------------------------
   WHAT:
   Conversion Rate = Total Purchases / Total Users

   WHY:
   Pricing changes primarily influence purchase probability.
   This metric measures behavioral response to pricing.
   ============================================================================ */

SELECT
    group,
    COUNT(*) AS users,
    SUM(purchased) AS total_purchases,
    ROUND(SUM(purchased) * 1.0 / COUNT(*), 4) AS conversion_rate
FROM pricing_ab_test
GROUP BY group;



/* ============================================================================
   3️⃣ AVERAGE ORDER VALUE (AOV)
   ----------------------------------------------------------------------------
   WHAT:
   AOV = Total Revenue / Total Purchases

   WHY:
   Since treatment reduces price by 5%, AOV is expected to decrease.
   This quantifies the pricing tradeoff.
   ============================================================================ */

SELECT
    group,
    ROUND(SUM(order_value) / SUM(purchased), 2) AS average_order_value
FROM pricing_ab_test
WHERE purchased = 1
GROUP BY group;



/* ============================================================================
   4️⃣ REVENUE PER USER (RPU)  ← PRIMARY DECISION METRIC
   ----------------------------------------------------------------------------
   WHAT:
   RPU = Total Revenue / Total Users

   WHY:
   Captures combined impact of:
      - Conversion Rate
      - Average Order Value

   Final pricing decisions should be based on RPU,
   not conversion rate alone.
   ============================================================================ */

SELECT
    group,
    ROUND(SUM(order_value) / COUNT(*), 2) AS revenue_per_user
FROM pricing_ab_test
GROUP BY group;



/* ============================================================================
   5️⃣ CONVERSION LIFT CALCULATION
   ----------------------------------------------------------------------------
   WHAT:
   Absolute Lift   = Treatment CR − Control CR
   Percentage Lift = Relative improvement vs Control

   WHY:
   Makes experiment impact easy to communicate in business terms.
   ============================================================================ */

WITH conversion AS (
    SELECT
        group,
        SUM(purchased) * 1.0 / COUNT(*) AS conversion_rate
    FROM pricing_ab_test
    GROUP BY group
)

SELECT
    t.conversion_rate - c.conversion_rate AS absolute_lift,
    ROUND(
        (t.conversion_rate - c.conversion_rate) / c.conversion_rate * 100,
        2
    ) AS percent_lift
FROM conversion c
JOIN conversion t
    ON c.group = 'control'
   AND t.group = 'treatment';



/* ============================================================================
   6️⃣ DEVICE SEGMENTATION
   ----------------------------------------------------------------------------
   WHAT:
   Conversion and Revenue segmented by device type.

   WHY:
   Pricing sensitivity may vary between mobile and desktop users.
   Identifies where treatment performs strongest.
   ============================================================================ */

SELECT
    group,
    device_type,
    COUNT(*) AS users,
    SUM(purchased) AS purchases,
    ROUND(SUM(purchased) * 1.0 / COUNT(*), 4) AS conversion_rate,
    ROUND(SUM(order_value) / COUNT(*), 2) AS revenue_per_user
FROM pricing_ab_test
GROUP BY group, device_type
ORDER BY group, device_type;



/* ============================================================================
   7️⃣ REGION SEGMENTATION
   ----------------------------------------------------------------------------
   WHAT:
   Revenue and performance across geographic regions.

   WHY:
   Pricing elasticity can differ by region.
   Helps identify high-growth or underperforming segments.
   ============================================================================ */

SELECT
    group,
    region,
    COUNT(*) AS users,
    ROUND(SUM(order_value), 2) AS total_revenue,
    ROUND(SUM(order_value) / COUNT(*), 2) AS revenue_per_user
FROM pricing_ab_test
GROUP BY group, region
ORDER BY group, region;



/* ============================================================================
   8️⃣ CUMULATIVE REVENUE (WINDOW FUNCTION)
   ----------------------------------------------------------------------------
   WHAT:
   Running total revenue over time per group.

   WHY:
   Validates whether treatment consistently outperforms control.
   Also demonstrates advanced SQL (window functions).
   ============================================================================ */

SELECT
    group,
    session_date,
    SUM(order_value) OVER (
        PARTITION BY group
        ORDER BY session_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM pricing_ab_test
ORDER BY group, session_date;
