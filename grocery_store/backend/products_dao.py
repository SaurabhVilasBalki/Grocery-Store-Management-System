# Data Access Object
# https://dev.mysql.com/doc/connector-python/en/

from sql_connection import get_sql_connection

def get_all_products(connection):

    cursor = connection.cursor()

    query = ("""SELECT p.product_id, p.name, p.unit_id, p.price_per_unit, u.unit_name
    FROM products p
    inner join uom u
    on p.unit_id=u.unit_id;""")

    cursor.execute(query)

    response = []
    for (product_id, name, unit_id, price_per_unit, unit_name) in cursor:
        response.append(
            {
                'product_id':product_id,
                'name':name,
                'unit_id':unit_id,
                'price_per_unit':price_per_unit,
                'unit_name':unit_name
            }
        )

    return response

def insert_new_product(connection, product):
    cursor = connection.cursor()

    query = ("""insert into products (name, unit_id, price_per_unit)
                values (%s, %s, %s)""")

    data = (product['product_name'], product['unit_id'], product['price_per_unit'])

    cursor.execute(query, data)

    connection.commit()

    return cursor.lastrowid

def delete_product(connection, product_id):

    cursor = connection.cursor()
    query = ("delete from products where product_id = " + str(product_id))
    cursor.execute(query)
    connection.commit()

    return 'Product Deleted'


if __name__=='__main__':
    connection = get_sql_connection()
    print(delete_product(connection, 10))

