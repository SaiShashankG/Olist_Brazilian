# 🛒 Olist E-Commerce Analytics — SQL & Python Project

## 📌 Project Overview
End-to-end data analytics project on 100,000+ real orders from 
**Olist**, a Brazilian e-commerce marketplace. This project 
demonstrates a complete analytics workflow — from relational 
database querying in MySQL to statistical analysis and time 
series forecasting in Python.

This project was built independently to demonstrate real-world 
data analyst skills including MySQL, Python, statistics, 
regression analysis, and forecasting.

---

## 📊 Dataset
- **Source:** [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)
- **Size:** 100,000+ orders across 9 relational tables
- **Period:** September 2016 — August 2018 (23 months)
- **Tables Used:**
  - olist_orders
  - olist_order_items
  - olist_customers
  - olist_products
  - olist_order_payments
  - olist_order_reviews
  - olist_sellers
  - product_category_name_translation

---

## 🗂️ Project Structure

```
olist-ecommerce-analytics
Olist Brazilian
│
├── sql
│   └── primary.sql
│
├── notebooks
│   └── visualization.ipynb
│
├── plots
│   ├── ACF and PACF - Monthly Revenue.png
│   ├── Delivery Days Vs Review Score.png
│   ├── Distribution of Order Counts (Sellers with < 100 Orders).png
│   ├── Distribution of Orders per Seller-II.png
│   ├── Distribution of Orders per Seller.png
│   ├── Distribution of Residuals.png
│   ├── Late Delivery Rate vs Order Count.png
│   ├── Olist Monthly Revenue Forecast(Additive).png
│   ├── Olist Monthly Revenue Forecast(Multiplicative).png
│   ├── Prophet Revenue Forecast — Train vs Test Evaluation.png
│   ├── Residuals Vs Fitted.png
│   └── Revenue Forecast Comparison — Prophet vs ARIMA.png
│
├── data
│   ├── olist_customers_dataset.csv
│   ├── olist_geolocation_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_payments_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_sellers_dataset.csv
│   └── product_category_name_translation.csv
│
├── requirements.txt
└── README.md
```

---

## 🔍 Key Findings

### Phase 1 — Business Questions (MySQL)
| Question | Finding |
|----------|---------|
| Top revenue category | [health_beauty] |
| Highest late delivery rate | [2709af9587499e95e803a6498a5a56e9] at 48.94% |
| Customer repeat purchase rate | **3.11%** |
| Revenue trend | Strong upward growth 2016→2018 |

> **Key Insight:** Only 3.11% of customers placed more than 
> one order — indicating a major customer retention opportunity 
> for the platform.

### Phase 2 & 3 — Regression Analysis
| Metric | Value | Interpretation |
|--------|-------|----------------|
| Pearson Correlation | -0.334 | Moderate negative |
| Spearman Correlation | -0.235 | Weak negative |
| $R^2$ | 0.111 | Delivery explains 11.1% of satisfaction |
| $\beta_1$ | -0.045 | Each extra day → -0.045 review score |
| p-value | < 0.001 | Statistically significant |

> **Key Insight:** Despite being statistically significant, 
> delivery time explains only **11.1% of customer satisfaction 
> variance**. Businesses should focus on multiple satisfaction 
> drivers simultaneously.

> **Statistical Note:** Linear regression assumptions are 
> violated by the discrete ordinal nature of review scores (1-5). 
> Log transformation worsened R² (0.111→0.079), confirming the 
> issue is the response variable structure, not predictor 
> non-linearity. Ordinal Logistic Regression is recommended 
> for future work.

### Phase 4 — Revenue Forecasting
| Model | Test WAPE | Notes |
|-------|-----------|-------|
| Prophet (with seasonality) | 39.7% | Overfits with limited data |
| Prophet (no seasonality) | 37.8% | Slightly better |
| **ARIMA(1,1,0)** | **30.4%** | **Winner** |

> **Key Insight:** ARIMA outperformed Prophet with only 23 months 
> of data. Prophet requires 2+ full seasonal cycles for reliable 
> yearly seasonality estimation. Both models over-predicted the 
> test period as Olist's rapid growth plateaued in mid-2018.

---

## 💡 Recommendations
1. **Loyalty Program** — 3.11% repeat purchase rate indicates 
   major retention opportunity; implement post-purchase 
   engagement campaigns
2. **Multi-factor Satisfaction** — delivery time alone explains 
   only 11.1% of review variance; focus on product quality and 
   seller behavior
3. **Seller Quality Control** — flag sellers with >30% late 
   delivery rate for review
4. **Data Collection** — collect 3+ years of data for reliable 
   seasonal revenue forecasting
5. **Investigate 2018 Plateau** — mid-2018 revenue plateau may 
   signal market saturation or competitive pressure

---

## 🛠️ Tools & Technologies
| Tool | Purpose |
|------|---------|
| **MySQL** | Relational database, complex multi-table queries |
| **SQLAlchemy** | MySQL → Python pipeline |
| **pandas** | Data manipulation and analysis |
| **statsmodels** | OLS regression, ARIMA, ADF test, ACF/PACF |
| **scipy** | Pearson and Spearman correlation |
| **Prophet** | Time series forecasting |
| **pmdarima** | Auto ARIMA with AIC selection |
| **matplotlib/seaborn** | Data visualization |

---

## 📐 Statistical Techniques Used
- Pearson & Spearman Correlation
- Simple Linear Regression (OLS)
- Residual Analysis & Model Diagnostics (Montgomery approach)
- Log Transformation
- Augmented Dickey-Fuller (ADF) Stationarity Test
- ACF & PACF Analysis
- Auto ARIMA with AIC criterion
- Prophet Additive & Multiplicative Seasonality
- Train/Test Split Evaluation (80/20)
- WAPE metric for forecast accuracy

---

## ⚙️ How to Run

### Prerequisites
```bash
pip install pandas numpy matplotlib seaborn sqlalchemy 
pip install statsmodels scipy prophet pmdarima
pip install mysql-connector-python
```

### Setup
1. Download the Olist dataset from Kaggle
2. Load all CSV files into MySQL database named `olist`
3. Update database credentials in the notebook:
```python
engine = create_engine(
    "mysql+mysqlconnector://username:password@localhost/olist"
)
```
4. Run `notebooks/visualization.ipynb` end to end

---

## 📋 Assumptions
1. Revenue = `SUM(price)` excluding freight (product revenue only)
2. Cancelled orders excluded from all revenue calculations
3. Repeat purchase = `customer_unique_id` placing 2+ orders
4. Late delivery = `delivered_date > estimated_delivery_date`
5. Sellers with <20 orders excluded from late delivery analysis
6. Payment aggregated at order level to avoid double-counting
7. September 2018 excluded (only 3 days of data)
8. Minimum sample size of n≥20 orders for reliable rate estimates

---

## 🔗 Related Projects
- [Teleflex Medical Devices Forecast Accuracy Assessment](https://github.com/SaiShashankG/Forecast-Accuracy-Assessment) 
  > Supply chain forecasting project (Real Industry data)

---
