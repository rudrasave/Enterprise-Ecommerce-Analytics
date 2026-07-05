# Data Dictionary

## Customers

| Column | Description |
|----------|-------------|
| customer_id | Unique customer identifier |
| customer_city | Customer city |
| customer_state | Customer state |

---

## Orders

| Column | Description |
|----------|-------------|
| order_id | Unique order identifier |
| customer_id | Customer reference |
| order_purchase_timestamp | Purchase date |
| order_delivered_customer_date | Delivery date |
| order_estimated_delivery_date | Estimated delivery |

---

## Products

| Column | Description |
|----------|-------------|
| product_id | Product identifier |
| product_category_name | Category |
| product_weight_g | Weight |
| product_length_cm | Length |
| product_height_cm | Height |
| product_width_cm | Width |

---

## Sellers

| Column | Description |
|----------|-------------|
| seller_id | Seller identifier |
| seller_city | Seller city |
| seller_state | Seller state |

---

## Payments

| Column | Description |
|----------|-------------|
| payment_type | Payment method |
| payment_value | Amount paid |

---

## Reviews

| Column | Description |
|----------|-------------|
| review_score | Customer rating |