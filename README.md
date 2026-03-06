# Global Logistics & Sales Performance  
Leveraging delivery analytics & human-centred insight for supply chain optimisation

---

## 🔧 Tech Stack

| Component                  | Tool                 |
|---------------------------|----------------------|
| Cloud Data Warehouse      | Google BigQuery (SQL)|
| Data Visualisation & BI   | Tableau Public       |
| Version Control           | GitHub               |
| Documentation             | GitHub README.md     |

---

## 📌 KPIs Displayed in the Dashboard

- **Total Orders** – overall demand volume across the network  
- **Total Sales** – commercial performance, by country, segment and time  
- **Total Profit** – profitability signal, not just top-line revenue  
- **Late Delivery %** – core service metric impacting customer experience and retention  

These KPIs anchor the analysis in both **operational performance** and **commercial impact**.

---

## 🧭 Project Overview (Service Performance Analyst / BA reporting lens)

This portfolio piece is written from a **Service Performance & Reporting (BA-style)** lens, inspired by the kind of global shipment performance work I supported as a **Logistics & Customer Experience Analyst** at Pfizer (on-time delivery, late orders, escalations, customer impact).

> **Note:** This project uses a **simulated dataset** designed to mirror global shipping performance scenarios. **No confidential Pfizer data** is used.

### Business context
Global logistics leaders need a single, trusted view that links **service performance, cost-to-serve, and customer value** — so they can prioritise improvement efforts where they matter most.

### Primary users
- **Global Logistics Lead**
- **Customer Experience Lead**

### 5-minute decision this dashboard supports
> **Which countries should we prioritise for on-time delivery (OTD) improvement — and what levers (segment, shipping class) will move the KPI fastest?**

### Scope & grain
- **Grain:** Order-level (modelled from order-level records; dashboard uses aggregated summaries for performance)
- **Required filters:** **Country**, **Customer Segment**, **Shipping Class**

### Core KPI definition (service)
- **Late Delivery % = % of orders delivered after the promised date**
- **OTD % = 100% − Late Delivery %** *(derived for readability)*

### Why this matters (real-world challenges reflected in the design)
- Delivery performance varies widely across countries  
- Shipping modes differ in cost and reliability  
- High-volume customers are not always the most profitable  
- Late deliveries cluster in specific lanes and periods  

> **Core Question:**  
> *Which countries, customer segments and shipping classes are driving late-delivery performance and cost variability — and how can leaders improve service using a single performance view?*

📌 Example: Regions experiencing late shipments  
*(red = higher delays, larger bubbles = higher order volume)*

![Global_Logistics_Map](Images/Global_logistics_map.jpeg)

---

## 🧱 Delivery Approach (Requirements → KPI rules → validated model → dashboard)

This project is structured like a **reporting delivery**: define the decision need, confirm KPI rules, validate data quality, then build a dashboard that meets the reporting requirements.

### 1) Reporting requirements (what the business needs)

#### User stories + acceptance criteria (sample)
**User story 1 — Prioritisation**
- *As a Global Logistics Lead, I need a ranked view of countries by Late Delivery % and order volume so I can prioritise OTD improvement initiatives.*
  - **Acceptance criteria**
    - Ranking updates based on selected filters (Country, Segment, Shipping Class)
    - Late Delivery % excludes orders with invalid/null promised or delivered dates (flagged transparently)
    - Visual includes the **order count base (N)** to avoid misinterpretation

**User story 2 — Targeted intervention**
- *As a CX Lead, I need to cut late deliveries by Customer Segment and Shipping Class so I can target actions that reduce escalations for high-value customers.*
  - **Acceptance criteria**
    - Segment and Shipping Class breakdowns are consistent with KPI glossary definitions
    - “Unknown” shipping class is retained and visible for transparency (not silently dropped)

**User story 3 — Early warning**
- *As a Logistics Lead, I need a trend view of Late Delivery % to distinguish temporary spikes from sustained deterioration.*
  - **Acceptance criteria**
    - Trend reflects the same KPI rules as the prioritisation view
    - Users can filter to a country/segment and see whether issues are **spike-based** or **structural**

#### What the dashboard must answer
- Country ranking for service improvement focus (Late % + volume + value context)
- Segment and shipping-class cut views to support targeted actions
- Trend view to spot sustained deterioration or peak-period risk

---

### 2) KPI definitions & business rules (how metrics are calculated)

A KPI glossary is used to ensure consistent interpretation across stakeholders.

| KPI | Definition | Grain | Caveats / rules |
|---|---|---:|---|
| Late Delivery % | % orders delivered after promised date | Order | Excludes invalid/null promised or delivered dates (flagged) |
| OTD % | 100% − Late Delivery % | Order | Derived KPI |
| Total Orders | Count of orders | Order | Includes “Unknown” shipping class |
| Sales | Total revenue | Order | Depends on dataset assumptions |
| Profit | Sales − cost | Order | Cost/profit anomalies flagged for review |
| Cost-to-Serve | Logistics/service cost per order | Order | Used for shipping-class efficiency comparisons |

---

### 3) Data validation & quality handling (trust in the numbers)

Because leadership decisions depend on reliable metrics, the model includes explicit handling for:
- Null/invalid delivery dates (flagged/excluded from SLA calculations)
- Inconsistent country naming (normalised using mapping tables)
- Missing shipping class (retained as “Unknown” for transparency)
- Cost/profit anomalies (flagged for review)

---

### 4) Build & implementation (BigQuery → Tableau)

- Loaded shipment, order, customer and product tables into **BigQuery**
- Created staging tables to handle nulls, invalid dates, and inconsistent country names
- Built curated summary tables to keep Tableau performant while preserving order-level logic:
  - `summary_customer_segment`
  - `summary_late_deliveries`
  - `summary_orders_overtime`
  - `summary_shipping_efficiency`
  - `summary_country_mapping`

📌 Summary outputs are exported to `/data_summary` for transparency and reproducibility.

---

### 5) Dashboard (Tableau)

**Executive layer (fast scan)**
- KPI banner: **Total Orders, Sales, Profit, Late Delivery %, OTD %**

**Prioritisation layer (where to act)**
- Country-level prioritisation view (order volume + Late Delivery %)

**Diagnostics layer (why / which lever)**
- Shipping-class efficiency comparison (cost vs service trade-offs)
- Segment distribution (value + service exposure)
- Trend views (spikes vs sustained deterioration)

The design balances **executive visibility** with drill-down via **Country, Segment and Shipping Class**.

---

## 📌 Key insights + recommended actions (Performance Review Pack)

### Executive summary (what matters this period)
- **Service risk is concentrated, not widespread:** Late deliveries are driven by a small set of **countries + lanes** with both **high Late Delivery % and meaningful order volume**, making them the highest-impact targets for intervention.
- **Cost-to-serve is not always buying reliability:** Some **higher-cost shipping classes** do not consistently deliver better on-time outcomes, suggesting opportunities to **rebalance mode selection rules**.
- **Value is exposed in specific segments:** A subset of **high-value customer segments** experience disproportionate delay rates, increasing churn/escalation risk and justifying **priority service protection**.
- **Late deliveries show repeatable patterns:** Delays **cluster by period** (spikes or sustained deterioration), indicating issues that can be addressed through **capacity planning, cut-off adherence, and carrier performance management**.

---

### What we’re seeing (signal from the dashboard)

#### 1) Country prioritisation: where to focus first
- Countries fall into three practical buckets:
  - **Priority 1 — High Late % + High Volume:** largest service impact; immediate intervention recommended.
  - **Priority 2 — High Late % + Lower Volume:** investigate root causes; targeted fixes can be quick wins.
  - **Priority 3 — Low Late % + High Volume:** protect performance; monitor for early warning signals.

#### 2) Segment exposure: who is most affected
- Late Delivery % is not uniform across segments:
  - Some segments show **higher delays despite moderate volume**, implying process or promise-date issues.
  - High-value segments with rising late rates represent **commercial risk** and should be **shielded** through prioritisation rules.

#### 3) Shipping class trade-offs: cost vs service reality
- Shipping classes show clear efficiency differences:
  - Some modes deliver **acceptable service at lower cost** (good default candidates).
  - Some modes show **high cost without proportional service benefit** (candidates for rule change or carrier review).
  - “Unknown”/missing shipping class may hide operational issues and should be reduced through upstream data fixes.

#### 4) Trend patterns: temporary spike or structural issue?
- Late Delivery % trends show:
  - **Spike periods** consistent with seasonal demand/capacity strain or cut-off breaches.
  - **Sustained deterioration** consistent with structural carrier performance or lane/process constraints.
- Identifying whether the issue is spiky vs sustained determines whether the fix is **capacity planning** vs **structural redesign**.

---

### Recommended actions (what to do next)

#### A) Focus list: fix the top drivers first (2-week sprint)
**Action**
- Create a “Top Priority Countries” backlog using:
  - **Late Delivery % (primary) + Order Volume (weighting) + Customer Value (tie-breaker)**
- Select the top **[X]** countries/lane combinations as sprint items.

**Owner**
- Global Logistics Lead + CX Lead (with analyst support)

**Success metrics**
- Late Delivery % reduction in Priority 1 countries
- Fewer repeat late lanes / exception recurrence
- Reduced escalations for impacted customers

---

#### B) Shipping class decision rules: rebalance cost vs service (2–4 weeks)
**Action**
- For each Priority 1 country, compare shipping classes using:
  - Late Delivery % vs Cost-to-Serve vs Profit impact
- Update decision rules:
  - Promote “efficient” modes (good service at lower cost)
  - Restrict “expensive underperformers” to exception cases only
- Add guardrails: when Late Delivery % exceeds **[threshold]**, trigger a mode review.

**Owner**
- Ops Excellence / Continuous Improvement + Procurement/Carrier Management

**Success metrics**
- Improved service at equal or lower cost (cost/service efficiency)
- Reduced profit leakage from high-cost modes without service benefit

---

#### C) Protect high-value segments: service prioritisation logic (4 weeks)
**Action**
- Identify segments with:
  - High profit contribution AND above-average Late Delivery %
- Implement prioritisation rules:
  - Priority handling for **[Segment A/B]** during peak periods
  - Escalation triggers and proactive customer comms for at-risk orders

**Owner**
- Customer Experience Lead + Planning/Allocation

**Success metrics**
- Late Delivery % improvement for high-value segments
- Reduced customer-impact incidents (complaints/escalations)

---

#### D) Root-cause drill-down: turn “where” into “why” (2–6 weeks, parallel)
**Action**
- For each Priority 1 country/lane, run a structured root-cause review:
  - Promise-date accuracy (lead times / cut-off adherence)
  - Carrier OT performance and exception reasons
  - Warehouse dispatch timing / handoff delays
  - Customs or lane constraints (if applicable)
- Produce a one-page “Lane Fix Sheet” per country with:
  - Root-cause hypothesis
  - Fix owner
  - Expected impact
  - Verification metric

**Owner**
- Cross-functional: Warehouse + Carrier Mgmt + CX + Finance (as needed)

**Success metrics**
- Sustained improvement over **[N]** weeks post-fix
- Reduced repeat exceptions in the same lanes

---

### Controls & governance (so leadership trusts the numbers)
- **Data quality exclusions are explicit:** invalid/null promised or delivered dates are flagged and excluded from SLA calculations.
- **Country naming is standardised:** mapping rules prevent double counting and inconsistent rollups.
- **Unknown shipping class is retained:** reported transparently to avoid hiding issues; tracked for reduction upstream.

---

### KPIs to monitor weekly (leading + lagging)

**Service**
- Late Delivery % (overall + Priority 1 countries)
- Late Delivery % by segment and shipping class
- On-time trend stability (spikes vs sustained)

**Operational**
- Orders volume in Priority 1 lanes
- Escalation volume / repeat late lanes

**Commercial**
- Profit / cost-to-serve movement by shipping class
- High-value segment service protection outcomes