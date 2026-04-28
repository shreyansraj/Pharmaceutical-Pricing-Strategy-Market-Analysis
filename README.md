# 💊 Pharmaceutical Pricing Strategy & Market Analysis

## 📌 Overview

This project analyzes pricing inefficiencies in the Indian pharmaceutical market using a dataset of **250K+ products across 11K+ drug compositions**.

The objective was to uncover pricing patterns, identify market structure, and recommend an optimal market entry strategy.

---

## 🎯 Problem Statement

Why do drugs with identical compositions have massive price differences?

---

## 🧠 Approach

### 1. Data Preparation

* Created a `composition_key` using ingredient + strength
* Ensured apples-to-apples comparison across drugs

### 2. Price Dispersion Analysis

* Compared min vs max price for identical compositions

### 3. Market Segmentation

* Segmented products into Low, Mid, Premium tiers

### 4. Competitor Benchmarking

* Identified top manufacturers across segments

---

## 📊 Key Insights

### 🔥 1. Extreme Price Dispersion

* Found up to **1600x price variation** for identical compositions
* Example: ₹1.25 vs ₹2100 for the same drug formulation

👉 Indicates pricing driven by **branding, perception, and positioning**

---

### 📊 2. Market Segmentation

| Segment | % of Products |
| ------- | ------------- |
| Low     | 26.88%        |
| Mid     | 59.14%        |
| Premium | 13.97%        |

👉 The market is heavily concentrated in the **mid-price segment**

---

### 🏢 3. Competitive Landscape

* Large pharma companies operate across all segments
* Premium segment is **less crowded but brand-dominated**
* Mid segment is **highly competitive but largest opportunity pool**

---

## 💡 Strategic Recommendation

👉 **Enter in Mid-Tier Segment**

**Why?**

* Largest market share (~59%)
* Balance between affordability & margins
* Scalable with competitive positioning

---

## 🛠️ Tools Used

* SQL (data analysis, aggregation, segmentation)
* Excel (validation & exploration)

---

## 📂 Key SQL Analyses

### Price Dispersion

```sql
SELECT 
    CONCAT(primary_ingredient, ' ', primary_strength) AS composition_key,
    MIN(price_inr) AS min_price,
    MAX(price_inr) AS max_price,
    MAX(price_inr) * 1.0 / MIN(price_inr) AS price_ratio
FROM pharma_data
GROUP BY composition_key;
```

---

### Segmentation

```sql
CASE 
    WHEN price_inr < 50 THEN 'Low'
    WHEN price_inr BETWEEN 50 AND 200 THEN 'Mid'
    ELSE 'Premium'
END
```

---

### Competitor Ranking

```sql
ROW_NUMBER() OVER (
    PARTITION BY price_segment 
    ORDER BY COUNT(*) DESC
)
```

---

## 🚀 Key Learnings

* Real-world pricing is often **not cost-driven**
* Market segmentation is critical for strategy
* Data → Insight → Strategy is the core consulting workflow

---

## 👤 Author

Shreyans Raj
