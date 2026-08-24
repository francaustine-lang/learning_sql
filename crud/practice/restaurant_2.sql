CREATE FILE avail AS ENUM (
    'Yes', 'No'
);

CREATE FILE sex AS ENUM (
    'Male', 'Female'
);

CREATE TABLE office (
    name VARCHAR(50),
    id BIGINT PRIMARY KEY NOT NULL,
    address TEXT,
    phone INT,
    email VARCHAR(50),
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR(50) REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by VARCHAR(50) REFERENCES personnel(official_name)
); **********(The Business itself)

CREATE TABLE menu (
    serial_no INT,
    id BIGINT PRIMARY KEY NOT NULL,
    name VARCHAR(50),
    description TEXT,
    available avail DEFAULT 'Yes' NOT NULL,
    available_quantity/ration: INT,
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated _by VARCHAR REFERENCES personnel(official_name)
); **********(Their products/Items on their sales shelve)

CREATE TABLE inventory (
    serial_number INT,
    id BIGINT PRIMARY KEY NOT NULL,
    description TEXT,
    quantity_stored INT,
    quantity_used INT,
    quantity_remaining INT,
    used_by VARCHAR(50),
    used_at DATE DEFAULT 'TODAY' NOT NULL, 
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR(50) REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by VARCHAR(50) REFERENCES personnel(official_name)
); **********(Their Resources/Ingredients/production materials)

CREATE TABLE cart-basket (
    serial_no INT,
    id BIGINT PRIMARY KEY NOT NULL,
    item VARCHAR(50) REFERENCES menu(id),
    description TEXT REFERENCES menu(description),
    quantity/ration INT,
    unit_cost NUMERIC(9, 2),
    total_cost NUMERIC(9, 2),
    buyer VARCHAR(50) REFERENCES customer(name) NOT NULL,
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR(50) REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by VARCHAR(50) REFERENCES personnel(official_name),
); **********(Catalogue of items selected by Customer)

CREATE TABLE personnel (
    id BIGINT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    official_name VARCHAR(15),
    gender sex DEFAULT 'Male' NOT NULL,
    phone INT,
    email TEXT,
    address TEXT,
    qualification VARCHAR(50),
    age INT,
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR(50) REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by VARCHAR(50) REFERENCES personnel(official_name)
); ********** (their Workers Manager, Supervisor, Sales rep, Driver, cleaner, Cashier, Security)

CREATE TABLE rider (
    id BIGINT PRIMARY KEY NOT NULL,
    name VARCHAR REFERENCES personnel(official_name),
    gender REFERENCES personnel(gender),
    phone INT REFERENCES personnel(phone),
    email TEXT REFERENCES personnel(email),
    address TEXT REFERENCES personnel(address),
    qualification VARCHAR(50) REFERENCES personnel(qualification),
    age INT REFERENCES personnel(age),
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by REFERENCES personnel(official_name)
);	

CREATE TABLE customer (
    id BIGINT PRIMARY KEY NOT NULL UNIQUE,
    fullname TEXT,
    phone INT,
    email TEXT,
    address TEXT,
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by VARCHAR(50) DEFAULT 'Self',
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by VARCHAR(50) DEFAULT 'Self',
);	

CREATE TABLE campaign (
    id BIGINT PRIMARY KEY NOT NULL,
    topic VARCHAR(50),
    description TEXT,
    design **********
    created_at DATE DEFAULT 'TODAY' NOT NULL,
    created_by REFERENCES personnel(official_name),
    updated_at DATE DEFAULT 'TODAY' NOT NULL,
    updated_by:REFERENCES personnel(official_name)
); **********(Adverts, Circulars, Promotions, etc.)
	
CREATE TABLE payment (
    id BIGINT PRIMARY KEy NOT NULL,
    item VARCHAR REFERENCES menu(name),
    description TEXT REFERENCES menu(description),
    cart_id BIGINT REFERENCES cart(id),
•	amount NUMERIC(9, 2)
•	paid_by
•	paid_at DATE DEFAULT 'TODAY' NOT NULL
•	created_at DATE DEFAULT 'TODAY' NOT NULL:
•	created_by REFERENCES personnel(official_name)
•	updated_at DATE DEFAULT 'TODAY' NOT NULL
•	updated_by REFERENCES personnel(official_name)
);


INVOICE
•	id
•	customer_name
•	customer_address
•	item_description
•	quantity
•	unit_cost 
•	bulk_cost
•	total_cost
•	amount_due
•	amount_paid  NUMERIC(9, 2)
•	balance
•	seller_id
•	created_at DATE DEFAULT 'TODAY' NOT NULL
•	created_by REFERENCES personnel(official_name)
•	updated_at DATE DEFAULT 'TODAY' NOT NULL
•	updated_by REFERENCES personnel(official_name)

AUDIT LOG
•	id
•	item
•	description
•	
•	created_at DATE DEFAULT 'TODAY' NOT NULL
•	created_by REFERENCES personnel(official_name)
•	updated_at DATE DEFAULT 'TODAY' NOT NULL
•	updated_by REFERENCES personnel(official_name)

•	
NOTIFICATION (Information update on Transactions)
•	id
•	subject
•	message
•	
•	created at DATE DEFAULT 'TODAY' NOT NULL
•	created by REFERENCES personnel(official_name)
•	updated at DATE DEFAULT 'TODAY' NOT NULL
•	updated by REFERENCES personnel(official_name)



