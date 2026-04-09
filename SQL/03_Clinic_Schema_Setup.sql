-- Clinic_Schema_Setup

-- Create a clinics table 
CREATE TABLE clinics (
    cid          VARCHAR(50) PRIMARY KEY,
    clinic_name  VARCHAR(100),
    city         VARCHAR(100),
    state        VARCHAR(100),
    country      VARCHAR(100)
);

-- create a customer table
CREATE TABLE customer (
    uid     VARCHAR(50) PRIMARY KEY,
    name    VARCHAR(100),
    mobile  VARCHAR(20)
); 

-- Create a clinic sales table
CREATE TABLE clinic_sales (
    oid           VARCHAR(50) PRIMARY KEY,
    uid           VARCHAR(50),
    cid           VARCHAR(50),
    amount        DECIMAL(10,2),
    datetime      DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
); 

-- Create a expenses table
CREATE TABLE expenses (
    eid         VARCHAR(50) PRIMARY KEY,
    cid         VARCHAR(50),
    description VARCHAR(200),
    amount      DECIMAL(10,2),
    datetime    DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
); 

-- ------------- Sample data ------

-- Insert data into Clinics table
INSERT INTO clinics VALUES
('cnc-001', 'Apollo Clinic',    'Hyderabad', 'Telangana',      'India'),
('cnc-002', 'HealthFirst',      'Mumbai',    'Maharashtra',    'India'),
('cnc-003', 'CureWell',         'Chennai',   'Tamil Nadu',     'India'),
('cnc-004', 'MediCare Plus',    'Hyderabad', 'Telangana',      'India'),
('cnc-005', 'City Health',      'Mumbai',    'Maharashtra',    'India');  
 
-- Insert data into customer table 
INSERT INTO customer VALUES
('cst-001', 'Arjun Rao',   '9800000001'),
('cst-002', 'Meena Patel', '9800000002'),
('cst-003', 'Suresh Kumar','9800000003'),
('cst-004', 'Divya Nair',  '9800000004'),
('cst-005', 'Kiran Reddy', '9800000005');

-- Insert data into clinic sales table
Insert Into clinic_sales Values
('ord-001', 'cst-001', 'cnc-001', 24999, '2021-01-10 10:00:00', 'online'),
('ord-002', 'cst-002', 'cnc-001', 15000, '2021-01-15 11:00:00', 'walk-in'),
('ord-003', 'cst-003', 'cnc-002', 30000, '2021-02-05 09:00:00', 'online'),
('ord-004', 'cst-001', 'cnc-002', 12000, '2021-02-20 14:00:00', 'referral'),
('ord-005', 'cst-004', 'cnc-003', 18000, '2021-03-10 10:00:00', 'walk-in'),
('ord-006', 'cst-005', 'cnc-003', 22000, '2021-03-25 15:00:00', 'online'),
('ord-007', 'cst-002', 'cnc-004', 45000, '2021-04-05 11:00:00', 'referral'),
('ord-008', 'cst-003', 'cnc-004', 11000, '2021-04-18 13:00:00', 'walk-in'),
('ord-009', 'cst-001', 'cnc-005', 32000, '2021-05-02 09:00:00', 'online'),
('ord-010', 'cst-004', 'cnc-001', 27000, '2021-06-10 10:00:00', 'online'),
('ord-011', 'cst-005', 'cnc-002', 19000, '2021-07-15 12:00:00', 'walk-in'),
('ord-012', 'cst-001', 'cnc-003', 25000, '2021-08-20 14:00:00', 'referral'),
('ord-013', 'cst-002', 'cnc-004', 38000, '2021-09-10 10:00:00', 'online'),
('ord-014', 'cst-003', 'cnc-005', 15000, '2021-10-05 11:00:00', 'walk-in'),
('ord-015', 'cst-004', 'cnc-001', 20000, '2021-11-12 09:00:00', 'online'),
('ord-016', 'cst-005', 'cnc-002', 42000, '2021-12-22 10:00:00', 'referral'); 

-- Insert data into expenses tables 
INSERT INTO expenses VALUES
('exp-001', 'cnc-001', 'Medicines stock',     8000,  '2021-01-05 08:00:00'),
('exp-002', 'cnc-001', 'Staff salary',        12000, '2021-01-31 08:00:00'),
('exp-003', 'cnc-002', 'Equipment repair',    5000,  '2021-02-10 08:00:00'),
('exp-004', 'cnc-002', 'Rent',                15000, '2021-02-28 08:00:00'),
('exp-005', 'cnc-003', 'First-aid supplies',  3000,  '2021-03-15 08:00:00'),
('exp-006', 'cnc-003', 'Utility bills',       4000,  '2021-03-31 08:00:00'),
('exp-007', 'cnc-004', 'Staff salary',        18000, '2021-04-30 08:00:00'),
('exp-008', 'cnc-004', 'Medicines stock',     9000,  '2021-04-10 08:00:00'),
('exp-009', 'cnc-005', 'Rent',                20000, '2021-05-31 08:00:00'),
('exp-010', 'cnc-001', 'Medicines stock',     6000,  '2021-06-10 08:00:00'),
('exp-011', 'cnc-002', 'Equipment repair',    7000,  '2021-07-20 08:00:00'),
('exp-012', 'cnc-003', 'Staff salary',        10000, '2021-08-31 08:00:00'),
('exp-013', 'cnc-004', 'Rent',                16000, '2021-09-30 08:00:00'),
('exp-014', 'cnc-005', 'Utility bills',       5000,  '2021-10-31 08:00:00'),
('exp-015', 'cnc-001', 'Staff salary',        13000, '2021-11-30 08:00:00'),
('exp-016', 'cnc-002', 'Medicines stock',     8000,  '2021-12-15 08:00:00'); 

-- Retrieva data using a Select
Select * From clinics;
Select * From customer;
Select * From clinic_sales;
Select * From expenses;