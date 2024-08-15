drop database if exists on_tap;

Create database on_tap;

use on_tap;

Create table categories
(
    id int primary key identity,
    name varchar(100) NOT NULL UNIQUE,
    status tinyint DEFAULT '0',
    created_at date ,
    updated_at date null
);

Create table products
(
    id int primary key identity,
    name varchar(100) NOT NULL UNIQUE,
    image varchar(100) NOT NULL,
    price float NOT NULL,
    sale_price float NOT NULL,
    category_id int NOT NULL,
    description text NOT NULL,
    status tinyint,
    created_at date ,
    updated_at date null,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

Create table product_images
(
    id int primary key identity,
    image varchar(100) NOT NULL,
    product_id int NOT NULL,
    status tinyint ,
    created_at date ,
    updated_at date null,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

Create table users
(
    id int primary key identity,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(200) NOT NULL,
    created_at date ,
    updated_at date null
);

Create table personal_access_tokens
(
    id int primary key identity,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(200) NOT NULL,
    created_at date ,
    updated_at date null
);


Create table banners
(
    id int primary key identity,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    prioty tinyint,
    status tinyint,
    created_at date ,
    updated_at date null
);


Create table blogs
(
    id int primary key identity,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    status tinyint,
    created_at date ,
    updated_at date null
);

Create table services
(
    id int primary key identity,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    status tinyint,
    created_at date ,
    updated_at date null
);


Create table customers
(
    id int primary key identity,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    phone varchar(100) NOT NULL UNIQUE,
    address varchar(100) NULL,
    gender tinyint NOT NULL DEFAULT '0',
    password varchar(200) NOT NULL,
    email_verified_at date null,
    created_at date ,
    updated_at date null
);

Create table customer_reset_tokens
(
    email varchar(100) primary key,
    token varchar(100) NOT NULL UNIQUE,
    created_at date ,
    updated_at date null
);

Create table comments
(
    id int primary key identity,
    customer_id int NOT NULL,
    product_id int NOT NULL,
    comment text,
    created_at date ,
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

Create table contacts
(
    id int primary key identity,
    comment text,
    created_at date ,
    updated_at date null,
);

Create table favorites
(
    id int primary key identity,
    customer_id int NOT NULL,
    product_id int NOT NULL,
    created_at date ,
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

Create table carts
(
    customer_id int NOT NULL,
    product_id int NOT NULL,
    price float not null,
    quantity int not null,
    primary key (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


Create table orders
(
    id int primary key identity,
    name varchar(100) NULL,
    email varchar(100) NULL,
    phone varchar(100) NULL,
    address varchar(100) NULL,
    token varchar(50) NULL,
    customer_id int NOT NULL,
    status tinyint DEFAULT '0',
    created_at date ,
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

Create table order_details
(
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity tinyint NOT NULL,
    price float NOT NULL,
    primary key (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE rating
 (
id INT NOT NULL identity,
product_id INT NOT NULL,
customer_id INT NOT NULL,
rate INT NOT NULL DEFAULT '5',
content text NULL,
date date ,
status tinyint DEFAULT '1',
PRIMARY KEY (id),
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);
