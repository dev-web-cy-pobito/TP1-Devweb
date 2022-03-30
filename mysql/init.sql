create database if not exists Puffles;

use Puffles;

create table if not exists users (
    -- User id
    id int not null auto_increment,

    -- User email
    email varchar(64) not null,

    -- User password encrypted with hash_password()
    password_hash varchar(255) not null,

    -- User permission level (0 = visitor, 1 = user, 2 = admin)
    permission int not null default 1,

    primary key (id)
);

create table if not exists puffles (
    -- Puffle id
    id int not null auto_increment,

    -- Puffle name
    name varchar(64) not null,

    -- Puffle description
    description varchar(255),

    -- Whenever it first appeared
    apparition_date date not null,

    -- Current stock
    stock int not null default 0,

    -- Current price
    price int not null default 0,

    -- Puffle image relative asset link
    pic_url varchar(255) not null default "assets/images/default.png",

    primary key (id)
);

create table if not exists categories(
    -- Category id
    id int not null auto_increment,

    -- Category name
    name varchar(64) not null,

    primary key (id)
);

create table if not exists categorized_puffles(
    -- Puffle id
    puffle_id int not null,

    -- Category id
    category_id int not null,

    primary key (puffle_id, category_id),

    foreign key (puffle_id) references puffles(id),
    foreign key (category_id) references categories(id)
);

create table if not exists orders (
    -- Order id
    id int not null auto_increment,

    -- User id
    user_id int not null,

    -- Billing first name
    first_name varchar(64) not null,

    -- Billing last name
    last_name varchar(64) not null,

    -- Billing address
    address varchar(255) not null,

    -- Billing city
    city varchar(64) not null,

    -- Billing zip code
    zip_code varchar(5) not null,

    -- Billing country
    country varchar(64) not null,

    -- Billing phone number
    phone varchar(16) not null,

    -- Order status (0 = pending, 1 = paid, 2 = confirmed, 3 = shipped, 4 = completed, 5 = canceled)
    status int not null default 0,

    -- Order date
    order_date date not null,


    primary key (id),
    foreign key(user_id) references users(id)
);

create table if not exists coupons (
    -- Coupon id
    id int not null auto_increment,

    -- Coupon code
    code varchar(64) not null,

    -- Coupon value
    discount int not null default 0,

    -- Coupon uses
    uses int not null default 0,

    -- Coupon maximum uses
    max_uses int not null default 1,

    primary key (id)
);

create table if not exists ordered_puffles (
    -- Order id
    order_id int not null,

    -- User id
    user_id int not null,

    -- Puffle id
    puffle_id int not null,

    -- Quantity
    quantity int not null default 1,

    -- Unity price
    price int not null default 0,

    foreign key(user_id) references users(id),
    foreign key(puffle_id) references puffles(id),
    foreign key(order_id) references orders(id)
);

create table if not exists used_coupons (
    -- Order id
    order_id int not null,

    -- Coupon id
    coupon_id int not null,
    
    foreign key(order_id) references orders(id),
    foreign key(coupon_id) references coupons(id)
);