CREATE TABLE "orders" ( 
	"id" SERIAL PRIMARY KEY,
	"order_date" DATE NOT NULL,
	"shipping_date" DATE,
	"status" VARCHAR(50) NOT NULL,
	"total_amount" DECIMAL(10, 2) NOT NULL,
	"user_id" INT REFERENCES "user"("id"),
	"shipping_address_id" INT REFERENCES "shipping_address"("id"),
	"category_id"  INT REFERENCES "category" ("id")

);
CREATE TABLE "category" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT
);
CREATE TABLE "payments" (
    "id" SERIAL PRIMARY KEY,
    "payment_date" DATE NOT NULL,
    "amount" DECIMAL(10, 2) NOT NULL,
    "payment_method" VARCHAR(50) NOT NULL,
    "order_id" INT REFERENCES "orders"("id")
); 
CREATE TABLE "product" (
   "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "description" TEXT,
    "price" DECIMAL(10, 2) NOT NULL,
    "stock" INT NOT NULL,
    "category_id" INT REFERENCES "category"("id")
);
CREATE TABLE "shipping_address" (
	"id" SERIAL PRIMARY KEY,
	"address_line_1" VARCHAR(255) NOT NULL,
	"address_line_2" VARCHAR(255),
	"city" VARCHAR(100) NOT NULL,
	"postal_code" VARCHAR(20) NOT NULL,
	"country" VARCHAR(100) NOT NULL
);
CREATE TABLE "user" (
	"id" SERIAL PRIMARY KEY,
	"username" VARCHAR(50) NOT NULL,
	"email" VARCHAR(100) UNIQUE NOT NULL,
	"phone" VARCHAR(30),
	"address" VARCHAR(300),
	"country" VARCHAR(50)
	
);
