INSERT INTO "category" ("name", "description") VALUES
('Electronics', 'Devices and gadgets including phones, laptops, etc.'),
('Books', 'A wide range of books including fiction, non-fiction, and academic.'),
('Clothing', 'Apparel for men, women, and children.'),
('Home Goods', 'Furniture, kitchenware, and other household items.');

INSERT INTO "user" ("username", "email", "phone", "address", "country") VALUES
('john_doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street', 'USA'),
('jane_smith', 'jane.smith@example.com', '098-765-4321', '456 Oak Avenue', 'Canada'),
('alice_jones', 'alice.jones@example.com', '555-123-4567', '789 Pine Road', 'UK'),
('bob_brown', 'bob.brown@example.com', '555-987-6543', '321 Maple Lane', 'Australia');

INSERT INTO "shipping_address" ("address_line_1", "address_line_2", "city", "postal_code", "country") VALUES
('123 Elm Street', 'Apt 1', 'Springfield', '62701', 'USA'),
('456 Oak Avenue', NULL, 'Toronto', 'M5A 1A1', 'Canada'),
('789 Pine Road', 'Suite 300', 'London', 'W1A 1AA', 'UK'),
('321 Maple Lane', NULL, 'Sydney', '2000', 'Australia');

INSERT INTO "orders" ("order_date", "shipping_date", "status", "total_amount", "user_id", "shipping_address_id", "category_id") VALUES
('2024-09-01', '2024-09-03', 'Shipped', 199.99, 1, 1, 1),
('2024-09-02', '2024-09-05', 'Pending', 25.50, 2, 2, 2),
('2024-09-03', '2024-09-06', 'Delivered', 89.00, 3, 3, 3),
('2024-09-04', '2024-09-07', 'Cancelled', 45.75, 4, 4, 4);

INSERT INTO "product" ("name", "description", "price", "stock", "category_id") VALUES
('Smartphone', 'Latest model with 5G capability', 699.99, 50, 1),
('Science Fiction Novel', 'A gripping science fiction story.', 15.99, 100, 2),
('Leather Jacket', 'Stylish leather jacket for all seasons.', 120.00, 30, 3),
('Coffee Maker', 'Automatic coffee maker with programmable settings.', 85.00, 20, 4);

INSERT INTO "payments" ("payment_date", "amount", "payment_method", "order_id") VALUES
('2024-09-01', 199.99, 'Credit Card', 1),
('2024-09-02', 25.50, 'PayPal', 2),
('2024-09-03', 89.00, 'Debit Card', 3),
('2024-09-04', 45.75, 'Credit Card', 4);
