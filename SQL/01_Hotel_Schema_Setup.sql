-- Create A Database
Create Database Hotel_Schema_Setup;
Use Hotel_Schema_Setup;

-- Create a users Table 
Create  Table users(
    user_id       varchar(50) primary Key,
    name          varchar(100),
    phone_number  varchar(20),
    mail_id       varchar(100),
    billing_address Text
);

-- Create a Booking Table
Create  Table bookings (
    booking_id    varchar(50) primary key,
    booking_date  datetime,
    room_no       varchar(50),
    user_id       varchar(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create a Items table
Create Table items (
    item_id    varchar(50) primary key,
    item_name  varchar(100),
    item_rate  decimal(10,2)
);

-- create a Booking commercials
Create Table booking_commercials (
    id            varchar(50) primary key,
    booking_id    varchar(50),
    bill_id       varchar(50),
    bill_date     datetime,
    item_id       varchar(50),
    item_quantity decimal(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id)    REFERENCES items(item_id)
);


-- ------- Sample Data for tables -------
-- Insert data into users tabel
Insert Into users Values
('usr-001', 'John Doe',   '9700000001', 'john@example.com',  '10, MG Road, Delhi'),
('usr-002', 'Jane Smith', '9700000002', 'jane@example.com',  '22, Park St, Mumbai'),
('usr-003', 'Ravi Kumar', '9700000003', 'ravi@example.com',  '5, Anna Salai, Chennai'),
('usr-004', 'Priya Sen',  '9700000004', 'priya@example.com', '8, Salt Lake, Kolkata');

-- Insert data into items Tables
Insert Into items Values
('itm-001', 'Tawa Paratha',  18.00),
('itm-002', 'Mix Veg',       89.00),
('itm-003', 'Paneer Butter', 150.00),
('itm-004', 'Cold Coffee',   60.00),
('itm-005', 'Masala Chai',   25.00),
('itm-006', 'Veg Biryani',   120.00);

-- Insert data into Booking Table
Insert Into bookings Values
('bk-001', '2021-09-10 10:00:00', 'rm-101', 'usr-001'),
('bk-002', '2021-10-05 14:00:00', 'rm-202', 'usr-001'),
('bk-003', '2021-10-15 09:30:00', 'rm-303', 'usr-002'),
('bk-004', '2021-11-01 11:00:00', 'rm-404', 'usr-003'),
('bk-005', '2021-11-20 08:00:00', 'rm-101', 'usr-004'),
('bk-006', '2021-11-25 16:00:00', 'rm-202', 'usr-001'),
('bk-007', '2021-12-01 12:00:00', 'rm-505', 'usr-002');

-- Insert data into booking commercials Table
INSERT INTO booking_commercials VALUES
('bc-001', 'bk-001', 'bl-001', '2021-09-10 12:00:00', 'itm-001', 3),
('bc-002', 'bk-001', 'bl-001', '2021-09-10 12:00:00', 'itm-002', 2),
('bc-003', 'bk-002', 'bl-002', '2021-10-05 18:00:00', 'itm-003', 4),
('bc-004', 'bk-002', 'bl-002', '2021-10-05 18:00:00', 'itm-004', 2),
('bc-005', 'bk-003', 'bl-003', '2021-10-15 11:00:00', 'itm-001', 10),
('bc-006', 'bk-003', 'bl-003', '2021-10-15 11:00:00', 'itm-006', 8),
('bc-007', 'bk-003', 'bl-004', '2021-10-16 09:00:00', 'itm-005', 5),
('bc-008', 'bk-004', 'bl-005', '2021-11-01 13:00:00', 'itm-002', 5),
('bc-009', 'bk-004', 'bl-005', '2021-11-01 13:00:00', 'itm-003', 3),
('bc-010', 'bk-005', 'bl-006', '2021-11-20 10:00:00', 'itm-006', 7),
('bc-011', 'bk-005', 'bl-006', '2021-11-20 10:00:00', 'itm-001', 6),
('bc-012', 'bk-006', 'bl-007', '2021-11-25 17:00:00', 'itm-004', 3),
('bc-013', 'bk-006', 'bl-007', '2021-11-25 17:00:00', 'itm-003', 2),
('bc-014', 'bk-007', 'bl-008', '2021-12-01 14:00:00', 'itm-002', 4),
('bc-015', 'bk-007', 'bl-008', '2021-12-01 14:00:00', 'itm-005', 6);
  
-- Retrieva data using a Select
Select * From users;
Select * From bookings;
Select * From items;
Select * From booking_commercials;