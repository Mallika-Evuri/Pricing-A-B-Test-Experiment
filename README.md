# 📊 Pricing Strategy A/B Test Analysis

## Overview

This project evaluates the impact of a **5% pricing reduction** on user conversion and overall revenue performance in an e-commerce environment.

The objective was to determine whether increased purchase conversion offsets lower average order value and leads to higher **Revenue per User (RPU)**.

---

## 🧪 Experiment Design

- **Total Users:** 80,000  
- **Traffic Split:** 50% Control / 50% Treatment  
- **Duration:** 30 days  
- **Treatment:** 5% price reduction  
- **Primary Decision Metric:** Revenue per User (RPU)

---

## 📈 Core Metrics

- Conversion Rate  
- Average Order Value (AOV)  
- Revenue per User (RPU)

> RPU was selected as the primary metric because it captures the combined impact of conversion behavior and pricing changes.

---

## 📊 Statistical Testing

- **Two-Proportion Z-Test** → Conversion Rate  
- **Independent Two-Sample T-Test** → Revenue per User  
- **Confidence Level:** 95%

Both improvements were statistically validated.

---

## 🚀 Key Results

- Conversion Rate increased by **~2% absolute (~11% relative lift)**  
- Revenue per User increased by **~₹12**  
- Estimated Monthly Revenue Lift: **~₹6M**  
- Estimated Annual Revenue Impact: **~₹7.2 crore**  
- Results statistically significant (**p < 0.001**)

---

## 💼 Business Interpretation

Although the pricing strategy reduced Average Order Value, the increase in conversion rate more than compensated for the lower price, resulting in a net increase in revenue per user.

Based on statistical validation and projected financial impact, the treatment pricing strategy is recommended for rollout, with ongoing margin monitoring.

---

## 📊 Power BI Dashboard

The project includes an executive-style Power BI dashboard visualizing:

- Conversion comparison  
- Revenue per user comparison  
- Pricing tradeoff (AOV impact)  
- Device-level segmentation  
- Financial impact projection  

### Dashboard Preview

![A/B Test Dashboard](dashboard/ab_pricing_experiment_dashboard.png)

Power BI file available in:
