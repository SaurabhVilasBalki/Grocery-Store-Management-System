-- inserting values in uom
insert into uom (unit_id, unit_name) values (1,'each'),(2,'kg');

-- inserting values in products
insert into products (product_id, name, unit_id, price_per_unit)
values (1, 'rice', 1, 25),
		(2, 'moong dal', 1, 100),
        (3, 'toothpaste', 2, 30),
        (4, 'soap', 2, 20),
        (5, 'banana', 2, 30),
        (6, 'onions', 2, 70),
        (7, 'apple', 2, 300),
        (8, 'facemask', 1, 20),
        (9, 'okra', 1, 20);
        


SELECT p.product_id, p.name, p.unit_id, p.price_per_unit, u.unit_name
FROM products p
inner join uom u
on p.unit_id=u.unit_id
order by product_id;

insert into products (name, unit_id, price_per_unit)
values ('spinach', 1, 34.5);