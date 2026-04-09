# 📊 PlatinumRx Data Analyst Assignment

## 📌 Project Overview

This project demonstrates core **Data Analyst skills** across three major areas:

* **SQL**
* **Excel**
* **Python**

The assignment simulates real-world scenarios including **Hotel Management** and **Clinic Management Systems**, along with **ticket analysis** and **string processing tasks**.

---

## 🛠 Tools & Technologies Used

* **SQL:** MySQL Workbench
* **Spreadsheet:** Microsoft Excel
* **Programming:** Python (Jupyter Notebook )

---

## 📂 Project Structure

```
PlatinumRx_Assignment/
│
├── SQL/
│   ├── Hotel_Schema_Setup.sql
│   ├── Hotel_Queries.sql
│   ├── Clinic_Schema_Setup.sql
│   └── Clinic_Queries.sql
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
├── Python/
│   ├── 01_Time_Converter.ipynb
│   └── 02_Remove_Duplicates.ipynb
│
└── README.md
```

---

# 🔹 SQL Analysis

## 🏨 Hotel Management System

### ✔ Key Tasks Performed:

1. Retrieved **last booked room per user**
2. Calculated **total billing for November 2021**
3. Filtered **bills > 1000 in October 2021**
4. Identified **most & least ordered items per month**
5. Found **2nd highest bill customers per month**

### 🧠 Concepts Used:

* `JOIN`
* `GROUP BY`
* `HAVING`
* `WINDOW FUNCTIONS (RANK, DENSE_RANK)`
* `SUBQUERIES`
* `CTE (WITH clause)`

---

## 🏥 Clinic Management System

### ✔ Key Tasks Performed:

1. Revenue analysis by **sales channel**
2. Identified **top 10 customers**
3. Monthly **Revenue, Expense, Profit, Status**
4. Most profitable clinic per **city**
5. Second least profitable clinic per **state**

### 🧠 Concepts Used:

* Aggregations (`SUM`)
* Conditional logic (`CASE`)
* Window functions
* CTEs
* Date functions (`MONTH`, `YEAR`)

---

# 🔹 Excel Analysis

## 📊 Ticket & Feedback Analysis

### ✔ Tasks Performed:

### 1. Data Lookup

* Populated `ticket_created_at` in feedbacks sheet using:

```excel
==INDEX(ticket!$B:$B, MATCH(A2, ticket!$E:$E, 0))
```

### 2. Same Day Analysis

```excel
==IF(INT(B2)=INT(C2),"Yes","No")
```

### 3. Same Hour Analysis

```excel
==IF(AND(INT(B2)=INT(C2), HOUR(B2)=HOUR(C2)), "Yes", "No")
```

### 4. Outlet-wise Count

```excel
=Used Pivot table Rows: outlet_id, Values: Count of same_day (filter "Yes"), Count of same_hour (filter "Yes").
```

### 📈 Outcome:

* Identified tickets closed within **same day**
* Identified tickets resolved within **same hour**
* Generated outlet-level insights

---

# 🔹 Python Implementation

## 🧮 1. Time Converter

### ✔ Objective:

Convert minutes into human-readable format

### ✔ Logic:

* Hours = minutes // 60
* Remaining minutes = minutes % 60

### ✔ Example:

```
Input: 130  
Output: 2 hrs 10 minutes
```

---

## 🔤 2. Remove Duplicates from String

### ✔ Objective:

Remove duplicate characters using loop

### ✔ Logic:

* Traverse string
* Add character only if not already present

### ✔ Example:

```
Input:  programming  
Output: progamin
```

---

# 🔗 Submission Links

* **GitHub Repository:** (https://github.com/lalithkk/PlatinumRx_Assignment_DataAnalyst/tree/main)
* **Spreadsheet Link:** (https://docs.google.com/spreadsheets/d/1WHVcaHpuUoqjI30HLIAjDzkclWWe0V9O/edit?usp=sharing&ouid=115348834355226085315&rtpof=true&sd=true)
* **Screen Recording:** (https://drive.google.com/file/d/1if_zUdAgOFbT2t3eGLNijjBStPm-HRvl/view?usp=drive_link)

---

# 🙌 Author

**Lalith Kumar Kaicharla**


---
