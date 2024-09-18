# **database**

## **Database Schema**


#### **Tables**
1. category: Contains product categories.
2. user: Contains user information.
3. shipping_address: Contains shipping addresses.
4. orders: Contains orders placed by users.
5. product: Contains information about products.
6. payments: Contains information about payments made for orders.


## **Table Relationships**

### 1. **`user` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`orders`**: Each order is associated with a user. (`user_id` in `orders` references `id` in `user`)

### 2. **`category` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`product`**: Each product belongs to a category. (`category_id` in `product` references `id` in `category`)
  - **`orders`**: Each order is linked to a category. (`category_id` in `orders` references `id` in `category`)
  - **`payments`**: Each payment may be associated with a category. (`category_id` in `payments` references `id` in `category`)

### 3. **`shipping_address` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`orders`**: Each order has a shipping address. (`shipping_address_id` in `orders` references `id` in `shipping_address`)

### 4. **`orders` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`user`**: Each order is placed by a user. (`user_id` in `orders` references `id` in `user`)
  - **`shipping_address`**: Each order has a shipping address. (`shipping_address_id` in `orders` references `id` in `shipping_address`)
  - **`category`**: Each order may be associated with a category. (`category_id` in `orders` references `id` in `category`)
  - **`payments`**: Each order can have multiple payments. (`order_id` in `payments` references `id` in `orders`)

### 5. **`product` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`category`**: Each product belongs to a category. (`category_id` in `product` references `id` in `category`)

### 6. **`payments` Table**
- **Primary Key:** `id`
- **Relationships:**
  - **`orders`**: Each payment is related to an order. (`order_id` in `payments` references `id` in `orders`)
  - **`category`**: Each payment can be associated with a category. (`category_id` in `payments` references `id` in `category`)


## Key Points
- **Foreign Key Relationships**: The foreign keys in each table link to the primary keys of other tables, establishing relationships.
- **One-to-Many Relationships**: For instance, one user can place many orders (`user` to `orders`), one category can include many products (`category` to `product`), and one order can have multiple payments (`orders` to `payments`).


## **SQL QUERIES**
### **SQL Creation**

```python 
CREATE TABLE "category" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT
);
````
```python 
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) UNIQUE NOT NULL,
    "phone" VARCHAR(30),
    "address" VARCHAR(300),
    "country" VARCHAR(50)
);
````
```python 
CREATE TABLE "shipping_address" (
    "id" SERIAL PRIMARY KEY,
    "address_line_1" VARCHAR(255) NOT NULL,
    "address_line_2" VARCHAR(255),
    "city" VARCHAR(100) NOT NULL,
    "postal_code" VARCHAR(20) NOT NULL,
    "country" VARCHAR(100) NOT NULL
);
````
```python 
CREATE TABLE "orders" ( 
    "id" SERIAL PRIMARY KEY,
    "order_date" DATE NOT NULL,
    "shipping_date" DATE,
    "status" VARCHAR(50) NOT NULL,
    "total_amount" DECIMAL(10, 2) NOT NULL,
    "user_id" INT REFERENCES "user"("id"),
    "shipping_address_id" INT REFERENCES "shipping_address"("id"),
    "category_id" INT REFERENCES "category"("id")
);
````
```python 
CREATE TABLE "product" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "description" TEXT,
    "price" DECIMAL(10, 2) NOT NULL,
    "stock" INT NOT NULL,
    "category_id" INT REFERENCES "category"("id")
);
````
```python 
CREATE TABLE "payments" (
    "id" SERIAL PRIMARY KEY,
    "payment_date" DATE NOT NULL,
    "amount" DECIMAL(10, 2) NOT NULL,
    "payment_method" VARCHAR(50) NOT NULL,
    "order_id" INT REFERENCES "orders"("id")
);
````
### insertion
```python 
INSERT INTO "category" ("name", "description") VALUES
('Electronics', 'Devices and gadgets including phones, laptops, etc.'),
('Books', 'A wide range of books including fiction, non-fiction, and academic.'),
('Clothing', 'Apparel for men, women, and children.'),
('Home Goods', 'Furniture, kitchenware, and other household items.');
````
```python 
-- Inserting data into the "user" table
INSERT INTO "user" ("username", "email", "phone", "address", "country") VALUES
('john_doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street', 'USA'),
('jane_smith', 'jane.smith@example.com', '098-765-4321', '456 Oak Avenue', 'Canada'),
('alice_jones', 'alice.jones@example.com', '555-123-4567', '789 Pine Road', 'UK'),
('bob_brown', 'bob.brown@example.com', '555-987-6543', '321 Maple Lane', 'Australia');
````
```python 
-- Inserting data into the "shipping_address" table
INSERT INTO "shipping_address" ("address_line_1", "address_line_2", "city", "postal_code", "country") VALUES
('123 Elm Street', 'Apt 1', 'Springfield', '62701', 'USA'),
('456 Oak Avenue', NULL, 'Toronto', 'M5A 1A1', 'Canada'),
('789 Pine Road', 'Suite 300', 'London', 'W1A 1AA', 'UK'),
('321 Maple Lane', NULL, 'Sydney', '2000', 'Australia');
````
```python 
-- Inserting data into the "orders" table
INSERT INTO "orders" ("order_date", "shipping_date", "status", "total_amount", "user_id", "shipping_address_id", "category_id") VALUES
('2024-09-01', '2024-09-03', 'Shipped', 199.99, 1, 1, 1),
('2024-09-02', '2024-09-05', 'Pending', 25.50, 2, 2, 2),
('2024-09-03', '2024-09-06', 'Delivered', 89.00, 3, 3, 3),
('2024-09-04', '2024-09-07', 'Cancelled', 45.75, 4, 4, 4);
````
```python 
-- Inserting data into the "product" table
INSERT INTO "product" ("name", "description", "price", "stock", "category_id") VALUES
('Smartphone', 'Latest model with 5G capability', 699.99, 50, 1),
('Science Fiction Novel', 'A gripping science fiction story.', 15.99, 100, 2),
('Leather Jacket', 'Stylish leather jacket for all seasons.', 120.00, 30, 3),
('Coffee Maker', 'Automatic coffee maker with programmable settings.', 85.00, 20, 4);
````
```python 
-- Inserting data into the "payments" table
INSERT INTO "payments" ("payment_date", "amount", "payment_method", "order_id") VALUES
('2024-09-01', 199.99, 'Credit Card', 1),
('2024-09-02', 25.50, 'PayPal', 2),
('2024-09-03', 89.00, 'Debit Card', 3),
('2024-09-04', 45.75, 'Credit Card', 4);
````
