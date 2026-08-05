CREATE TYPE gender AS ENUM (
    'Male', 'Female'
);

CREATE TYPE status AS ENUM (
    'Active', 'Inactive'
);

CREATE TYPE priority AS ENUM (
    '0', '1', '2', '3', '4', '5'
);

CREATE TYPE permit AS ENUM (
    'Yes', 'No'
);

CREATE TABLE personnels (
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    gender gender DEFAULT 'Male' NOT NULL,
    harsh_password TEXT,
    age INT,
    origin VARCHAR(20) NOT NULL,
    qualification VARCHAR(20) NOT NULL,
    created_at DATE,
    updated_at DATE,
    id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE roles (
    role_name VARCHAR(20) NOT NULL,
    role_description TEXT,
    role_priority priority DEFAULT '0' NOT NULL,
    role_status status DEFAULT 'Active' NOT NULL,
    created_at DATE,
    updated_at DATE,
    created_by TEXT,
    updated_by TEXT,
    id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE permissions (
    permission_name VARCHAR(20) NOT NULL,
    permission_resource TEXT,
    permissiom_action TEXT,
    permission_description TEXT,
    permission_status status DEFAULT 'Active' NOT NULL,
    created_at DATE,
    updated_at DATE,
    created_by TEXT,
    updated_by TEXT,
    is_granted permit DEFAULT 'Yes' NOT NULL,
    id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE roles_permission (
    id BIGINT PRIMARY KEY NOT NULL,
    role_id BIGINT REFERENCES roles(id) NOT NULL,
    permission_id BIGINT REFERENCES permissions(id) NOT NULL,
    is_active status DEFAULT 'Active' NOT NULL,
    created_at DATE,
    updated_at DATE,
    created_by TEXT,
    updated_by TEXT
);

CREATE TABLE user_role (
    id BIGINT PRIMARY KEY NOT NULL,
    user_id BIGINT REFERENCES personnels(id) NOT NULL,
    role_id BIGINT REFERENCES roles(id) NOT NULL,
    is_active status DEFAULT 'Active' NOT NULL,
    created_at DATE,
    updated_at DATE,
    created_by TEXT,
    updated_by TEXT
);