# Pricing Strategy A/B Test Analysis

## Overview

This project evaluates the impact of a revised pricing strategy (5% price reduction) on purchase conversion and overall revenue for an e-commerce platform.

The objective was to determine whether increased conversion rate offsets the reduction in average order value and improves overall revenue per user.

---

## Experiment Design

**Total Users:** 80,000  
**Traffic Split:** 50% Control / 50% Treatment  
**Experiment Duration:** 30 Days  

### Groups

| Group      | Pricing Strategy     |
|------------|----------------------|
| Control    | Original Pricing     |
| Treatment  | 5% Price Reduction   |

### Primary Metrics

- Conversion Rate  
- Average Order Value (AOV)  
- Revenue per User (RPU)

### Statistical Testing

- Two-Proportion Z-Test (Conversion Rate)  
- Independent Two-Sample T-Test (Revenue per User)  
- Confidence Level: 95%

---

## Dataset Description

The dataset simulates realistic e-commerce session behavior.

### Key Columns

- `user_id` — Unique user identifier  
- `group` — Control or Treatment  
- `device_type` — Mobile or Desktop  
- `region` — Geographic segment  
- `purchased` — Binary purchase indicator (0/1)  
- `order_value` — Revenue generated per purchase  

**Baseline Conversion (Control):** ~18%  
**Treatment Conversion:** ~20%  

---

## SQL Analysis

Core metrics were calculated using SQL aggregation and segmentation.

### Conversion Rate by Group

```sql
SELECT
    group,
    COUNT(*) AS users,
    SUM(purchased) AS purchases,
    ROUND(SUM(purchased) * 1.0 / COUNT(*), 4) AS conversion_rate
FROM pricing_ab_test
GROUP BY group;
```

### Revenue per User

```sql
SELECT
    group,
    ROUND(SUM(order_value) / COUNT(*), 2) AS revenue_per_user
FROM pricing_ab_test
GROUP BY group;
```

Additional analysis included:

- Average Order Value (AOV)
- Revenue segmentation by device and region
- Group-level revenue comparison

---

## Statistical Testing (Python)

### Conversion Rate Test

- Two-proportion Z-test  
- Result: Statistically significant (p < 0.05)

### Revenue per User Test

- Independent T-test  
- Result: Statistically significant (p < 0.05)

These results confirm the pricing change had measurable impact beyond random variation.

---

## Key Findings

- ~2% absolute lift in conversion rate  
- Slight decrease in AOV due to pricing reduction  
- Revenue per user increased overall  
- Statistically significant at 95% confidence level  

---

## Business Impact Estimation

Assuming 500,000 monthly users:

- Incremental revenue per user ≈ ₹X  
- Estimated monthly uplift ≈ ₹X million  
- Estimated annual impact ≈ ₹X crore  

The revised pricing strategy demonstrates scalable revenue improvement despite lower per-order pricing.

---

## Final Recommendation

Roll out the revised pricing strategy to all users while monitoring:

- Contribution margin impact  
- Regional performance variation  
- Long-term customer retention  

Further experimentation can refine pricing elasticity across segments.

---

## Tools & Technologies

- SQL  
- Python (pandas, numpy, scipy, statsmodels)  
- Power BI  
- Jupyter Notebook  

---

## Project Structure

```
pricing-ab-test-experiment/
│
├── data/
├── sql/
├── notebooks/
├── dashboard/
├── requirements.txt
└── README.md
```

---

## Author

Data Analyst focused on growth, retention, and experimentation analytics using SQL and Python.
