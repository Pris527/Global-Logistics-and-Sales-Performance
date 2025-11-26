# Global-Logistics-and-Sales-Performance
Leveraging Delivery Analytics & Human-Centred Insight for Supply Chain Optimisation

**Tech Stack**

| Component | Tool| 
| :--- | :--- |
| Cloud Data Warehouse | Google BigQuery (SQL) |
| Data Viz + Business Insights | Tableau Public |
| Version Control | Github |
| Documentation | Github README.md|


**KPIs Displayed**

- **Total Orders** – reflects global demand

- **Total Sales** – operational performance metric

- **Total Profit** – emphasises margin as well as volume

- **Late Delivery %**– critical service metric (mind your social science: perception matters)



**Overview**

In my role as a **Logistics & Customer Experience Analyst**, I oversaw global shipments, tracked key service metrics (on-time delivery, transit delays, late orders, customer escalations), and worked with cross-functional teams to resolve performance gaps.

Inspired by that experience, I built this analytics solution to simulate real supply chain conditions — turning raw operational data into insights leaders can act on. My social science background influenced the approach: **understanding not only where delays happen, but why** — and how customers feel the impact.

Common operational challenges informed this analysis:

- Delivery performance varies widely across countries

- Shipping modes differ in speed and reliability

- Customer profitability is not always aligned with volume

- Late shipments cluster in specific parts of the network

To explore these themes, I built a full analytics pipeline using SQL (BigQuery) and Tableau to answer the key question:

**Which countries, customer segments, and shipping modes are driving late-delivery performance and cost variability — and how can we improve service through data?**

📌 Below: Regions experiencing late shipments (Red = higher delays)

![Global_Logistics](Images/Global_logistics_map.jpeg)

**Methodology (Data Pipeline & Processing)**

1. **Raw Data Import & Staging** – Loaded shipment, order, customer and product tables into BigQuery; created staging layer for nulls, invalid dates, and mapping country names.

2. **Cleaning & Feature Engineering** – Standardised country names; corrected nulls (e.g., shipping mode, cost); created key supply-chain metrics:

- On-Time Delivery (OTD) %

- Late Delivery % by country/segment

- Cost per Unit Shipped

- Profit per Order

- Customer Segment Value

3. Summary Tables for Dashboard – Built aggregated tables for mapping and time-trend visualisation (due to Tableau Public size constraints), e.g.:

- summary_customer_segment

- summary_late_deliveries

- summary_orders_overtime

- summary_shipping_efficiency

- summary_country_mapping


4. **Dashboard Build** – Incorporated KPIs, world map with dual layering (order volume + late %), shipping-mode efficiency bar chart, time-trend dual-axis chart, and customer-segment donut chart. Used consistent colours and mobile layout.


**Key Insights & Visualisations**

📍 View Interactive Dashboard on Tableau Public
[https://public.tableau.com/app/profile/presca.evans/viz/GlobalLogisticsandSalesPerformance/GlobalLogisticsDashboard]



1. **Global Order Volume and Late-Delivery Performance**
**Visual: Dual-Layer World Map** — ✔ Order volume bubbles + ✔ Late % color scale

- Late delivery rates are consistently **above target** across most of the network — a systemic supply chain issue rather than isolated hotspots.

- High-volume countries with **higher delay risk** represent the biggest operational improvement opportunities.

- A human-centred lens suggests delays may be influenced by regional realities — **infrastructure, local regulations, labour constraints**, and customer density.


2. **Shipping Class Efficiency- Cost vs Service Trade-off**
**Visual: Shipping Class Bar Chart** — First Class, Same Day, Standard, Second Class

- Faster shipping classes (e.g., **Same Day**) incur **higher cost per order** without always delivering better delivery performance.

- More economical classes (e.g., Standard) perform competitively in several regions — **efficiency gains** may be possible by shifting customers where speed isn’t critical.

- Supports re-thinking the **service level strategy** by customer type.


3. **Customer Segment Value — Share of Orders & Profit**
**Visual: Customer Segment Donut Chart** — Consumer, Corporate, Home Office

- A few **customer segments (Corporate, Consumer)** generate a disproportionate share of total value.

- Higher delays in top segments pose greater retention and brand risk

- Concentrated customer bases may yield operational risk if delay rates in those segments rise.


4. **Time-Trend Analysis: Sales & Profit Performance**  
**Visual: Dual-Axis Line Chart (Sales vs Profit per Month)**

- Sales and profit generally move together, but **not always at the same pace**.

- Some months (e.g., **January**) show high order volume but **weaker profit** — indicating:
    ▫ Increased delivery cost
    ▫ A higher share of late deliveries
    ▫ Less efficient shipping class or customer mix

- Other months (e.g., **March and October**) show **steady sales but stronger profit**, suggesting:
    ▫ A more efficient delivery network
    ▫ A more profitable segment mix
    ▫ Better cost control measures

Leadership can use this to understand **profit quality**, not just volume.
More orders ≠ better performance if margins are shrinking.



**Key Recommendations for Leadership**

| Business Finding | Recommended Action| Expected Outcome | Metric Impact| 
| :--- | :--- | :--- | :--- |
| High sales months show **profit erosion** | Investigate shipping class mix and renegotiate high-cost carriers | Reduce delivery costs in peak seasons | ↑ Profit Margin |
| High volume countries also show **high late %** | Prioritise operational fixes in high-impact geographies| Improve customer satisfaction where it matters most | ↓ Late Delivery %   |
| Profit concentrated in a few **high-value segments** | Provide faster fulfilment & service guarantees for key accounts | Protect revenue from loyalty-sensitive segments| ↑ Repeat Orders |
| Most shipments use faster classes but with poor ROI | Expand **Standard** fulfilment for low-urgency customers| Cost optimisation without experience loss| ↓ Avg Cost per Unit |
| Peaks in late deliveries align with spikes in orders | Strengthen demand forecasting ahead of peak months| Prevent service degradation during busy periods | ↑ On-Time Delivery |


**Future Enhancements**

To continue strengthening the operational insight this dashboard provides, the following improvements are planned:

- **Incorporate More Service-Level Context**
Add features such as shipping guarantees, premium handling, or customer escalation flags to better understand when faster or more personalised service drives outcomes.

- **Benchmark Against Market Alternatives**
Introduce data about third-party logistics competitors in specific regions to support carrier selection and commercial strategy.

- **Enable Geographic Drill-Downs**
Expand regional pages (Country → City → Distribution Zone) allowing local teams to diagnose bottlenecks in more detail.

- **Refine Customer Segmentation**
Enhance customer grouping using behavioural signals (e.g., reorder frequency, sensitivity to delay) alongside existing business categories.

- **Improve Data Refresh & Automation**
Schedule periodic updates from BigQuery into Tableau so operational leaders can monitor performance changes over time — not just in a static snapshot.


