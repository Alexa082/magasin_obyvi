-- этап 4. Вход пользователя
SELECT u.id, u.full_name, r.name AS role
FROM users u
JOIN roles r ON r.id = u.role_id
WHERE u.login = 'yzls62@outlook.com' AND u.password = 'JlFRCZ';

-- Этап 5. Каталог товаров
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
       p.description, p.photo,
       c.name AS category,
       m.name AS manufacturer,
       s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id;

-- Этап 6. Поиск, фильтр, сортировка
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
       p.description, p.photo,
       c.name AS category,
       m.name AS manufacturer,
       s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id;

-- Этап 7. Получение справочников
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;

-- Этап 7. Добавление товара
INSERT INTO products
(article, name, unit, price, discount, stock_qty, description, photo,
 category_id, manufacturer_id, supplier_id)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

-- Этап 7. Получение товара для редактирования
SELECT * FROM products
WHERE id = ?;

-- Этап 7. Сохранение изменений товара
UPDATE products
SET article = ?,
    name = ?,
    unit = ?,
    price = ?,
    discount = ?,
    stock_qty = ?,
    description = ?,
    photo = ?,
    category_id = ?,
    manufacturer_id = ?,
    supplier_id = ?
WHERE id = ?;

-- Этап 8. Проверка, используется ли товар в заказах
SELECT COUNT(*) AS used_in_orders
FROM prodorders
WHERE product_id = ?;

-- Этап 8. Проверка запрета удаления товара
DELETE FROM products
WHERE id = ?;