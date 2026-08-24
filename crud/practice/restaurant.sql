// CREATING FOR A RESTAURANT
CREATE TYPE menu AS ENUM (
    'Rice', 'Yam', 'Oath', 'Beans', 'Potato', 'Noodles', 'Macaroni', 'Spaghetti', 'Cassava'
);

CREATE TYPE menu_style AS ENUM (
    'Fried', 'Roasted', 'Grilled', 'Smoked', 'Boiled'
);

CREATE TYPE available AS ENUM (
    'Yes', 'No'
);

CREATE TYPE protein AS ENUM (
    'Fish', 'Chicken', 'Goat', 'Cow', 'Bush Meat'
);

CREATE TYPE texture AS ENUM (
    'Soft', 'Hard'
);

CREATE TYPE level AS ENUM(
    '0', '1', '2', '3' 
);

CREATE TYPE specie AS ENUM (
    'Soft', 'Cream', 'Gin', 'Mild Alcohol', 'Brandy' 'Whisky'
);

CREATE TYPE gender AS ENUM(
    'Male', 'Female'
);

CREATE TYPE grade AS ENUM (
    'A', 'B', 'C'
);

CREATE TYPE ride AS ENUM (
    'Bicycle', 'Motorbyke', 'Car', 'Bus', 'Lorry'
);

CREATE TYPE what AS ENUM (
    'Foods', 'Proteins', 'Drinks'
);

CREATE TYPE pay_style AS ENUM (
    'Cash', 'Cheque', 'Transfer', 'ATM/POS'
);

CREATE TYPE situation AS ENUM (
    'Part Payment', 'Full Payment'
);

CREATE TABLE restaurants (
    title VARCHAR(50) NOT NULL,
    describe TEXT,
    id BIGINIT PRIMARY KEY NOT NULL,
    office_address TEXT,
    phone TEXT, // CORRECTION
    e-mail VARCHAR(50), // CORRECTION
    created_at DATE,
    created_by TEXT, // CORRECTION
    updated_at DATE,
    updated_by TEXT // CORRECTION
);	

CREATE TABLE foods (
    menu menu DEFAULT 'Rice' NOT NULL,  //(Rice, Yam, Oath, Beans, Potato, Noodles, Macaroni, Spaghetti, Cassava) 
    style menu_style DEFAULT 'Boiled' NOT NULL, //(Fried, Roasted, Grilled, Smoked, Boiled)
    id BIGINT PRIMARY KEY NOT NULL,
    available available DEFAULT 'Yes' NOT NULL, //(Yes, No)
    cost NUMERIC(9, 2), 
    created_at TEXT, // CORRECTION
    created_by TEXT,
    updated_at TEXT,
    updated_by TEXT
);

CREATE TABLE proteins (
    protein protein DEFAULT 'Fish' NOT NULL, //(Fish, Chicken, Goat, Cow, Bush) // CORRECTION (CHANGE THE MAME TO BE protein_type)
    id BIGINT PRIMARY KEY NOT NULL,
    style menu_style DEFAULT 'Roasted' NOT NULL, (Boiled, Fried, Roasted, Grilled)
    pepper level DEFAULT '0' NOT NULL, //(0 - 3)
    texture texture DEFAULT 'Soft' NOT NULL, //(Soft, Hard)
    status available DEFAULT 'Yes' NOT NULL,
    created_at DATE,
    created_by TEXT,
    updated_at DATE,
    updated_by TEXT
);

CREATE TABLE drinks (
    specie specie DEFAULT 'Soft' NOT NULL, //(Soft, Cream, Hard) // CORRECTION (CHANGE THE MAME TO BE protein_type)
    title TEXT,
    id BIGINT PRIMARY KEY NOT NULL,
    cost INT, // CORRECTION (CHANGE THE MAME TO BE protein_type)
    available available DEFAULT 'Yes' NOT NULL,
    created_at DATE,
    reated_by TEXT,
    updated_at DATE,
    updated_by TEXT
);

CREATE TABLE dispatcher (
    full_name TEXT,
    phone_number INT,
    dispatcher_address TEXT,
    date_of_birth DATE,
    gender gender DEFAULT 'Male' NOT NULL,
    id: BIGINT PRIMARY KEY NOT NULL,
    hashed_password TEXT,
    dispatcher_qualification TEXT,
    grade grade DEFAULT 'A' NOT NULL, //(A, B, C)
    ride ride DEFAULT 'Bicycle' NOT NULL //(Motorbyke, Car, Bus, Lorry)
    created_at DATE,
    created_by TEXT,
    updated_at DATE,
    updated_by TEXT
);

CREATE TABLE personnels (                               //for all staff records excluding Riders
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    gender gender DEFAULT 'Male' NOT NULL,
    _address TEXT,
    origin TEXT,
    phone INT,
    qualification TEXT,
    id BIGINT PRIMARY KEY NOT NULL,
    hash_Password TEXT,    
);
	
CREATE TABLE orders (
    created_by BIGINT REFERENCES customers(id) NOT NULL,
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    _address TEXT REFERENCES customers(full_address),
    id BIGINT PRIMARY KEY NOT NULL,
    modified_by TEXT,
    modified_at DATE,
    what what DEFAULT 'Foods' NOT NULL, //(Food, Protein, Drinks)
    quantity INT,
    cost INT,
    modes modes DEFAULT 'Offline' NOT NULL, //(Online, Offline)
);

CREATE TABLE customers (
    first_name TEXT,
    last_name TEXT,
    full_address TEXT,
    phone INT,
    email TEXT,
    harsh_password TEXT,
    id BIGINT PRIMARY KEY NOT NULL,
    created_by TEXT,
    created_at DATE,
    updated_by TYPE,
    updated_at DATE
);

CREATE TABLE order_tracking (
    id BIGINT PRIMARY KEY NOT NULL
    order_id BIGINT REFERENCES orders(id) NOT NULL,
    narration TEXT REFERENCES orders(type) NOT NULL,
    cost INT REFERANCES orders(cost) NOT NULL,
    created_by TEXT REFERENCES orders(created_by) NOT NULL,
    created_at DATE REFERENCES orders(created_at) NOT NULL,
    order_status TEXT REFERENCES //(logged,  Paid, Received, Assembling, Packed, Dispatched, In_Transit, Delivered, Acknowledged)
);	

CREATE TABLE payments (
    id BIGINT PRIMARY KEY NOT NULL,
    order_id BIGINT REFERENCES orders(id) UNIQUE NOT NULL,
    order_by TEXT REFERENCES customers('first_name', 'last_name'),
    order_type TEXT REFERENCES orders(what) NOT NULL,
    order_quantity INT REFERENCES order(quantity) NOT NULL,
    order_cost INT REFERENCES orders(cost) NOT NULL,
    amount_due INT,
    pay_type pay_style DEFAULT 'Cash' NOT NULL, //(Cash, Cheque, Transfer, ATM/POS)
    _description pay_style DEFAULT 'Part Payment' NOT NULL, //(Part, Full)
    balance: 
    tatus: (Failed, Successful)
•	
Updated_by:
•	Updated_at:
•	:

)

CREATE TABLE invoice (
    id BIGINT PRIMARY KEY NOT NULL,
    order_id BIGINT REFERENCES orders(id) UNIQUE NOT NULL,
    order_name TEXT REFERENCES orders(what) NOT NULL,
    customer_name TEXT REFERENCES customers('first_name', 'last_name') NOT NULL,
    customer_address TEXT REFERENCES customers(full_address) NOT NULL,
    order_qunatity INT REFERENCES orders(quantity) NOT NULL
    order_unit_cost INT REFERENCES food(cost) NOT NULL,
    order_final_cost INT REFERENCES orders(cost) NOT NULL,
    payment_by TEXT REFERENCES customers('first_name', 'last_name') 
    payment INT REFERENCES payment(amount_due) NOT NULL, 
    payment_style pay_style DEFAULT 'Cash' NOT NULL,
    payment_description situation DEFAUL 'Part Payment' NOT NULL,
    balance_due INT
);


AUDIT LOG
PERMISSIONS
ROLE 
