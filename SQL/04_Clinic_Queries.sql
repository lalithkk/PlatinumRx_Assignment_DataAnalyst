-- 1. Find the revenue we got from each sales channel in a given year
SELECT
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel
ORDER BY total_revenue DESC; 

-- 2. Find top 10 the most valuable customers for a given year
Select
    c.uid,
    c.name,
    SUM(cs.amount) AS total_spent
From clinic_sales cs
Join customer c On cs.uid = c.uid
Where  Year(cs.datetime) = 2021
group by c.uid, c.name
order by total_spent DESC
limit 10;

-- 3. Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year
With monthly_revenue AS (
    Select
        Month(datetime) AS mnth,
        SUM(amount) AS revenue
    From clinic_sales
    Where Year(datetime) = 2021
    group by MONTH(datetime)
),
monthly_expense AS (
    Select
        Month(datetime) AS mnth,
        SUM(amount) AS expense
    From expenses
    Where Year(datetime) = 2021
    group by Month(datetime)
)
Select
    r.mnth AS month,
    COALESCE(r.revenue, 0) AS revenue,
    COALESCE(e.expense, 0) AS expense,
    COALESCE(r.revenue, 0) - COALESCE(e.expense, 0)   AS profit,
    CASE
        When COALESCE(r.revenue, 0) - COALESCE(e.expense, 0) > 0
        Then 'Profitable'
        Else 'Not Profitable'
    End AS status
From monthly_revenue r
Left Join monthly_expense e On r.mnth = e.mnth
order by r.mnth; 

-- 4. For each city find the most profitable clinic for a given month
With clinic_profit AS (
    Select
        cl.cid,
        cl.clinic_name,
        cl.city,
        COALESCE(SUM(cs.amount), 0) AS revenue,
        COALESCE((
            Select SUM(e.amount)
            From expenses e
            Where e.cid = cl.cid
              And Month(e.datetime) = 1
              And Year(e.datetime)  = 2021
        ), 0)AS expense,
        COALESCE(SUM(cs.amount), 0) - COALESCE((
            Select SUM(e.amount)
            From expenses e
            Where e.cid = cl.cid
              And Month(e.datetime) = 1
              And Year(e.datetime)  = 2021
        ), 0) AS profit,
        RANK() OVER (
            Partition by  cl.city
            order by
                COALESCE(SUM(cs.amount), 0) - COALESCE((
                    Select SUM(e.amount)
                    From expenses e
                    Where e.cid = cl.cid
                      And Month(e.datetime) = 1
                      And Year(e.datetime)  = 2021
                ), 0)
            DESC
        ) AS rnk
    From clinics cl
    Left Join clinic_sales cs
           On cl.cid = cs.cid
          And Month(cs.datetime) = 1
          And Year(cs.datetime)  = 2021
    group by cl.cid, cl.clinic_name, cl.city
)
select city, cid, clinic_name, revenue, expense, profit
From clinic_profit
Where rnk = 1
order by city;

-- 5. For each state find the second least profitable clinic for a given month 
With clinic_profit AS (
    Select
        cl.cid,
        cl.clinic_name,
        cl.state,
        COALESCE(SUM(cs.amount), 0) - COALESCE((
            Select SUM(e.amount) From expenses e
            Where e.cid = cl.cid
              And Month(e.datetime) = 1 And Year(e.datetime) = 2021
        ), 0)AS profit,
        DENSE_RANK() OVER (
            partition by cl.state
            order by
                COALESCE(SUM(cs.amount), 0) - COALESCE((
                    Select SUM(e.amount) From expenses e
                    Where e.cid = cl.cid
                      And Month(e.datetime) = 1 And Year(e.datetime) = 2021
                ), 0)
            ASC 
        )AS rnk
    From clinics cl
    Left Join clinic_sales cs
           On cl.cid = cs.cid
          And Month(cs.datetime) = 1
          And Year(cs.datetime)  = 2021
    Group by cl.cid, cl.clinic_name, cl.state
)
Select state, cid, clinic_name, profit AS second_least_profit
From clinic_profit
Where rnk = 2
Order by state;
 