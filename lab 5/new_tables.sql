CREATE TABLE IF NOT EXISTS Users
(
    user_id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    phone_number VARCHAR(13) UNIQUE,
    address VARCHAR(255) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Category
(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Product
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    info TEXT NOT NULL,
    price NUMERIC(10,2)
);

CREATE TABLE ProductCategoryConnection (
    product_id INT NOT NULL REFERENCES Product(product_id)
        ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES Category(category_id)
        ON DELETE CASCADE,
    PRIMARY KEY (product_id, category_id)
);

CREATE TABLE IF NOT EXISTS Review
(
    review_id SERIAL PRIMARY KEY,
    review_text TEXT NOT NULL,
    rating INTEGER NOT NULL,
    date_creation TIMESTAMP NOT NULL,
    redaction_time TIMESTAMP NOT NULL,

    user_id INTEGER NOT NULL REFERENCES Users(user_id)
        ON DELETE CASCADE,

    product_id INTEGER NOT NULL REFERENCES Product(product_id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cart
(
    cart_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES Users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CartItems (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL REFERENCES Cart(cart_id)
        ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES Product(product_id)
        ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0)
);

CREATE TABLE IF NOT EXISTS Orders
(
    order_id SERIAL PRIMARY KEY,

    cart_id INTEGER NOT NULL REFERENCES Cart(cart_id)
        ON DELETE CASCADE,

    delivery_date DATE NOT NULL,
    total_price NUMERIC(10,2) NOT NULL,
    order_status VARCHAR(50) NOT NULL,

    delivery_id INTEGER NOT NULL REFERENCES Delivery(delivery_id)
        ON DELETE RESTRICT,

    payment_id INTEGER NOT NULL REFERENCES Payment(payment_id)
        ON DELETE RESTRICT
);