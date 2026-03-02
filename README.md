# Pricing Strategy A/B Test Analysis

## Overview

This project evaluates the impact of a 5% pricing reduction on conversion rate and overall revenue per user in an e-commerce environment.

The objective was to determine whether increased purchase conversion offsets lower average order value and improves overall revenue performance.

---

## Experiment Design

- Total Users: 80,000  
- Traffic Split: 50% Control / 50% Treatment  
- Duration: 30 days  
- Pricing Change: 5% reduction in treatment group  

### Primary Metrics
- Conversion Rate
- Average Order Value (AOV)
- Revenue per User (RPU) ← Primary Decision Metric

### Statistical Tests
- Two-Proportion Z-Test (Conversion Rate)
- Independent Two-Sample T-Test (Revenue per User)
- Confidence Level: 95%

---

## Key Results

- Conversion Rate increased by ~2% absolute (~11% relative lift)
- Revenue per User increased by ~₹12
- Estimated Monthly Revenue Lift: ~₹6 million
- Estimated Annual Revenue Impact: ~₹7.2 crore
- Both improvements statistically significant (p < 0.001)

---

## Business Interpretation

Although the pricing strategy slightly reduced Average Order Value, the higher conversion rate led to an overall increase in revenue per user.

Based on statistical significance and projected financial impact, the revised pricing strategy is recommended for full rollout.

---

## Project Components

### 1. Dataset Generation
Synthetic dataset generated using Python to simulate user behavior under control and treatment pricing conditions.

File:
```
src/generate_dataset.py
```

---

### 2. SQL Analysis
SQL queries used to compute:
- Traffic validation
- Conversion rate
- AOV
- Revenue per user
- Conversion lift
- Segmentation analysis
- Cumulative revenue (window function)

File:
```
sql/analysis_queries.sql
```

---

### 3. Statistical Testing & Visualization
Jupyter Notebook includes:
- Metric computation
- Hypothesis testing
- Revenue impact modeling
- Visualization of key results

File:
```
notebooks/pricing_ab_analysis.ipynb
```

---

## Repository Structure

```
Pricing-A-B-Test-Experiment
│
├── data/
│   └── pricing_ab_test_sample.csv
│
├── notebooks/
│   └── pricing_ab_analysis.ipynb
│
├── sql/
│   └── analysis_queries.sql
│
├── src/
│   └── generate_dataset.py
│
├── requirements.txt
└── README.md
```

---

## Reproducibility

To regenerate the dataset locally:

```
python src/generate_dataset.py
```

Dependencies:

```
pip install -r requirements.txt
```

---

## Tools Used

- Python (pandas, numpy, scipy, statsmodels)
- SQL
- Matplotlib
- Google Colab
- GitHub

---

## Key Skills Demonstrated

- Experimental Design
- A/B Testing
- Statistical Inference
- Business Impact Modeling
- SQL Analytics
- Data Visualization
- Revenue Optimization Strategy
