CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'sales representative') NOT NULL
);

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    image_url VARCHAR(2048),
    measurement_unit VARCHAR(50),
    quantity INT NOT NULL DEFAULT 0,
    instock_count INT NOT NULL DEFAULT 0
);

CREATE TABLE Sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep_id INT NOT NULL,
    customer_name VARCHAR(150) NOT NULL,
    customer_contact VARCHAR(100),
    sale_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sales_rep_id) REFERENCES Users(id)
);

CREATE TABLE Sales_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);


INSERT INTO Users (name, email, password, role) VALUES
('James Mwangi', 'james@hardware.co.ke', 'hashed_password_1', 'admin'),
('Peter Kamau', 'peter@hardware.co.ke', 'hashed_password_2', 'sales representative'),
('Mary Wanjiku', 'mary@hardware.co.ke', 'hashed_password_3', 'sales representative'),
('John Kiptoo', 'john@hardware.co.ke', 'hashed_password_4', 'sales representative'),
('Grace Achieng', 'grace@hardware.co.ke', 'hashed_password_5', 'sales representative');



INSERT INTO Products (name, price, description, image_url, measurement_unit, quantity, instock_count) VALUES
('Hermosa Paint', 650.00, 'Hermosa paint sold per litre', 'https://example.com/hermosa-paint.jpg', 'litre', 20, 12),
('Mabati Roofing Sheet', 1200.00, 'Standard iron roofing sheet', 'https://example.com/mabati.jpg', 'sheet', 1, 200),
('D12 Steel Bar', 950.00, '12mm reinforcement steel bar', 'https://example.com/steel-bar.jpg', 'piece', 1, 150),
('PVC Pipe', 450.00, 'One-inch PVC plumbing pipe', 'https://example.com/pvc-pipe.jpg', 'piece', 6, 80),
('Cement 50kg', 850.00, '50kg bag of cement', 'https://example.com/cement.jpg', 'bag', 50, 100),
('Nails 3 inch', 250.00, 'Box of 3-inch nails', 'https://example.com/nails.jpg', 'kg', 1, 100),
('Ceramic Floor Tiles', 950.00, 'Ceramic floor tiles', 'https://example.com/tiles.jpg', 'square metre', 1, 120),
('Electrical Cable', 1800.00, '2.5mm electrical wiring cable', 'https://example.com/cable.jpg', 'metre', 100, 40),
('Water Tap', 750.00, 'Chrome-plated water tap', 'https://example.com/tap.jpg', 'piece', 1, 50),
('Padlock', 400.00, 'Heavy-duty metal padlock', 'https://example.com/padlock.jpg', 'piece', 1, 60),
('Wheelbarrow', 5500.00, 'Heavy-duty construction wheelbarrow', 'https://example.com/wheelbarrow.jpg', 'piece', 1, 15),
('Spade', 900.00, 'Steel construction spade', 'https://example.com/spade.jpg', 'piece', 1, 35),
('Roofing Nails', 300.00, 'Box of roofing nails', 'https://example.com/roofing-nails.jpg', 'box', 1, 75),
('PPR Pipe', 280.00, '20mm water supply pipe', 'https://example.com/ppr-pipe.jpg', 'piece', 4, 90),
('Manila Rope', 120.00, 'General-purpose construction rope', 'https://example.com/rope.jpg', 'metre', 100, 200);

INSERT INTO Sales (sales_rep_id, customer_name, customer_contact, sale_date) VALUES
(2, 'George Njoroge', '0712345678', '2026-10-01 09:15:00'),
(3, 'Esther Wambui', '0723456789', '2026-10-01 10:30:00'),
(4, 'Patrick Odhiambo', '0734567890', '2026-10-02 11:00:00'),
(5, 'Janet Muthoni', '0745678901', '2026-10-02 14:20:00'),
(2, 'Collins Barasa', '0701234567', '2026-10-03 08:45:00'),
(3, 'Ruth Chepkemoi', '0713456789', '2026-10-03 12:10:00'),
(3, 'Daniel Musyoka', '0724567890', '2026-10-04 09:30:00'),
(3, 'Caroline Akoth', '0735678901', '2026-10-04 15:00:00'),
(4, 'Joseph Kariuki', '0746789012', '2026-10-05 10:15:00'),
(2, 'Beatrice Nasimiyu', '0702345678', '2026-10-05 13:40:00'),
(5, 'Francis Mwende', '0714567890', '2026-10-06 08:50:00'),
(3, 'Diana Nyambura', '0725678901', '2026-10-06 11:25:00'),
(4, 'Robert Ochieng', '0736789012', '2026-10-07 14:10:00'),
(5, 'Alice Jepkosgei', '0747890123', '2026-10-07 16:00:00'),
(3, 'Martin Kiplagat', '0703456789', '2026-10-08 09:20:00');

INSERT INTO Sales_Items (sale_id, product_id, quantity_sold, total_price) VALUES
(1, 1, 10, 8500.00),
(2, 2, 5, 6000.00),
(3, 3, 8, 7600.00),
(4, 4, 12, 5400.00),
(5, 5, 2, 13000.00),
(6, 6, 10, 2500.00),
(7, 7, 15, 14250.00),
(8, 8, 3, 5400.00),
(9, 9, 6, 4500.00),
(10, 10, 4, 1600.00),
(11, 11, 2, 11000.00),
(12, 12, 5, 4500.00),
(13, 13, 8, 2400.00),
(14, 14, 20, 5600.00),
(15, 15, 30, 3600.00);