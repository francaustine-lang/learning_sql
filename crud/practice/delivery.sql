CREATE TYPE gender AS ENUM(
    'Male', 'Female'
);

CREATE TABLE office (
    name VARCHAR(50),
    address TEXT,
    phone TEXT,
    e-mail TEXT,
    created_by VARCHAR(15)
    created_at DATE,
    updated_by VARCHAR(15),
    updated_at DATE,
    id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE personnel (
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    gender gender DEFAULT 'Male' NOT NULL,
    residential_address TEXT,
    phone_number INT,
    e-mail TEXT,
    qualification VARCHAR(15)
    hash_password TEXT,
    created_by VARCHAR(15),
    created_at DATE,
    updated_by VARCHAR(15),
    updated_at DATE,
    id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE product (
    product_name TEXT,
    product_id BIGINT PRIMARY KEY NOT NULL,
    product_feature TEXT, //pick or walk-in, deliver or walk-in
    product_type ENUM, //local or international
    product_cost NUMERIC(12, 2),
    created_by VARCHAR(15),
    created_at DATE,
    updated_by VARCHAR(15),
    updated_at DATE
);

CREATE TABLE package (
    title TEXT,
    id BIGINT PRIMARY KEY NOT NULL,
    description TEXT,
    
)
