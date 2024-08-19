drop database if exists on_tap;

Create database on_tap;

use on_tap;

Create table categories
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table products
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    image varchar(100) NOT NULL,
    price float(10,2) NOT NULL,
    sale_price float(10,2) NOT NULL,
    category_id int NOT NULL,
    description text NOT NULL,
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

Create table product_images
(
    id int primary key auto_increment,
    image varchar(100) NOT NULL,
    product_id int NOT NULL,
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

Create table users
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(200) NOT NULL,
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table personal_access_tokens
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(200) NOT NULL,
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);


Create table banners
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    prioty tinyint DEFAULT '0',
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);


Create table blogs
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table services
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    link varchar(100) NOT NULL DEFAULT '#',
    image varchar(100) NOT NULL,
    description varchar(255) NOT NULL,
    position varchar(100) DEFAULT 'top-banner',
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);


Create table customers
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    phone varchar(100) NOT NULL UNIQUE,
    address varchar(100) NULL,
    gender tinyint NOT NULL DEFAULT '0',
    password varchar(200) NOT NULL,
    email_verified_at date null,
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table customer_reset_tokens
(
    email varchar(100) primary key,
    token varchar(100) NOT NULL UNIQUE,
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table comments
(
    id int primary key auto_increment,
    customer_id int NOT NULL,
    blog_id int NOT NULL,
    comment text,
    created_at date DEFAULT current_timestamp(),
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (blog_id) REFERENCES blogs(id)
);

Create table contacts
(
    id int primary key auto_increment,
    comment text,
    created_at date DEFAULT current_timestamp(),
    updated_at date null
);

Create table favorites
(
    id int primary key auto_increment,
    customer_id int NOT NULL,
    product_id int NOT NULL,
    created_at date DEFAULT current_timestamp(),
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

Create table carts
(
    customer_id int NOT NULL,
    product_id int NOT NULL,
    price float(10,2) not null,
    quantity int not null,
    primary key (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


Create table orders
(
    id int primary key auto_increment,
    name varchar(100) NULL,
    email varchar(100) NULL,
    phone varchar(100) NULL,
    address varchar(100) NULL,
    token varchar(50) NULL,
    customer_id int NOT NULL,
    status tinyint(1) DEFAULT '0',
    created_at date DEFAULT current_timestamp(),
    updated_at date null,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

Create table order_details
(
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity tinyint NOT NULL,
    price float(10,3) NOT NULL,
    primary key (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);



INSERT INTO banners(name, image, link, status) VALUES
('My shop', 'banner_bg.png', '#', 1) ;

INSERT INTO banners(name, image, position, status) VALUES
('gallery 1', 'gallery_img01.png', 'gallery', 1) ,
('gallery 2', 'gallery_img02.png', 'gallery', 1) ,
('gallery 3', 'gallery_img03.png', 'gallery', 1) ;

INSERT INTO `users` (`name`, `email`, `password`, `created_at`, `updated_at`) VALUES
('Trần Gia Thế', 'thetg.22ba13293@usth.edu.vn', '$2y$12$u7YvHMORtXORaF4vlOeqIulZflCinU7EART7Bzsdt/1wMownAnE9e', '2024-08-13', '2024-08-13');

INSERT INTO categories(name, status) VALUES
('Dưa hấu', 1) ,
('Cà chua', 1) ,
('Chuối tiến vua', 1) ,
('Nho mỹ', 1);

INSERT INTO `products` (`name`, `image`, `price`, `sale_price`, `category_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
('Product 2', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 2, 'sasas', 1, '2023-12-06', '2023-12-06'),
('Product 3', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 2, 'sasas', 1, '2023-12-06', '2023-12-06'),
('Product 4', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 2, 'sasas', 1, '2023-12-06', '2023-12-06'),
('Product 5', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 3, 'sasas', 1, '2023-12-06', '2023-12-06'),
('Product 6', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 3, 'sasas', 1, '2023-12-06', '2023-12-06'),
('Product 7', 'TdBYSppJ7t4hlK8b79FjDtXhOKRvdusqKcnqxLwL.png', 500000.00, 250000.00, 3, 'sasas', 1, '2023-12-06', '2023-12-06');



INSERT INTO `product_images` (`id`, `image`, `product_id`, `status`, `created_at`, `updated_at`) VALUES
(17, 'mrppO4Xk0YexKFRgwtJJdKGJm9naIJ0DryeDth4z.png', 1, 0, '2023-12-06', '2023-12-06'),
(18, 'pXLHEmW0mvjohEMtaD7NK8CET50RskXehfOgG8em.png', 1, 0, '2023-12-06', '2023-12-06'),
(19, 'rb8sk4CthFqNmyrdEE2bvBU8OOeWelxpuGcq1Coa.png', 1, 0, '2023-12-06', '2023-12-06'),
(20, 'lP4RQq0nehFTxGrnI0mVMJJOBKqlh2ziyt21m4Hd.png', 1, 0, '2023-12-06', '2023-12-06');

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `gender`, `password`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'Trần Gia Thế', 'thetg.22ba13293@usth.edu.vn', '0394631391', 'ssssssss', 0, '$2y$12$u7YvHMORtXORaF4vlOeqIulZflCinU7EART7Bzsdt/1wMownAnE9e', '2024-08-13', '2024-08-13', '2024-08-13');

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `address`, `token`, `customer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trần Gia Thế', 'thetg.22ba13293@usth.edu.vn', '0394631391', 'ssssssss', NULL, 1, 1, '2024-08-13', '2024-08-13'),
(2, 'Trần Gia Thế', 'thetg.22ba13293@usth.edu.vn', '0394631391', 'ssssssss', NULL, 1, 2, '2024-08-13', '2024-08-13'),
(3, 'Trần Gia Thế', 'thetg.22ba13293@usth.edu.vn', '0394631391', 'ssssssss', NULL, 1, 3, '2024-08-13', '2024-08-13');

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 3, 250000.000),
(1, 2, 2, 250000.000),
(1, 3, 2, 250000.000),
(2, 1, 3, 250000.000),
(2, 2, 4, 250000.000),
(3, 1, 3, 250000.000),
(3, 2, 4, 250000.000),
(3, 3, 1, 250000.000);

INSERT INTO `blogs` (`id`, `name`, `link`, `image`, `description`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hamburg Meat is Animal Flesh Food', '#', 'blog_post01.jpg', 'Meat provide well shapd fresh and organic meat well animals is Humans', 'top-banner', 1, '2024-08-13', '2024-08-13'),
(2, 'Good Source of Iron And Flesh Food', '#', 'blog_post02.jpg', 'Meat provide well shapd fresh and organic meat well animals is Humans', 'top-banner', 2, '2024-08-13', '2024-08-13'),
(3, 'Chicken Sausage For Sale Humanely Raised', '#', 'blog_post03.jpg', 'Meat provide well shapd fresh and organic meat well animals is Humans', 'top-banner', 3, '2024-08-13', '2024-08-13');