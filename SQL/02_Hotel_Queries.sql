-- 1. For every user in the system, get the user_id and last booked room_no
SELECT
    u.user_id,
    u.name,
    b.room_no   AS last_booked_room
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b2.user_id = u.user_id
);

-- 2. Get booking_id and total billing amount of every booking created in November, 2021
Select
    bc.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_billing_amount
From booking_commercials bc
Join items i On bc.item_id = i.item_id
Where Year(bc.bill_date) = 2021
  And Month(bc.bill_date) = 11
Group by bc.booking_id;

-- 3. Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000
Select
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
From booking_commercials bc
Join items i On bc.item_id = i.item_id
Where Year(bc.bill_date) = 2021
  And Month(bc.bill_date) = 10
Group by bc.bill_id
Having SUM(bc.item_quantity * i.item_rate) > 1000; 

-- 4. Determine the most ordered and least ordered item of each month of year 2021
With monthly_item_totals AS (
    Select
        Month(bc.bill_date) AS bill_month,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,
        Rank()Over (
            partition by Month(bc.bill_date)
            order by SUM(bc.item_quantity) DESC
        )AS rk_most,
        Rank() Over (
            partition by month(bc.bill_date)
            order by SUM(bc.item_quantity) ASC
        )AS rk_least
    From booking_commercials bc
    Join items i On bc.item_id = i.item_id
    Where Year(bc.bill_date) = 2021
    group by month(bc.bill_date), i.item_name
)
select
    bill_month,
    MAX(CASE WHEN rk_most  = 1 THEN item_name END) AS most_ordered_item,
    MAX(CASE WHEN rk_least = 1 THEN item_name END) AS least_ordered_item
From monthly_item_totals
group by  bill_month
order by bill_month;

-- 5. Find the customers with the second highest bill value of each month of year 2021
With customer_bill AS (
    Select
        Month(bc.bill_date)AS bill_month,
        b.user_id,
        u.name,
        SUM(bc.item_quantity * i.item_rate) AS total_bill,
        DENSE_RANK() OVER (
            partition by Month(bc.bill_date)
            order by SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    From booking_commercials bc
    Join bookings b  On bc.booking_id = b.booking_id
    Join users u     On b.user_id = u.user_id
    Join items i     On bc.item_id = i.item_id
    Where Year(bc.bill_date) = 2021
    group by month(bc.bill_date), b.user_id, u.name
)
Select
    bill_month,
    user_id,
    name,
    total_bill AS second_highest_bill
From customer_bill
Where rnk = 2
order by bill_month;