import mysql.connector
import matplotlib.pyplot as plt
import pandas as pd

# MySQL connection configuration
# For security purposes, all data is gonna be received from inputs

_host_ = input("Enter host name: ")
_user_ = input("Enter user name: ")
_password_ = input("Enter password / token for the database: ")
_database_schema_ = input("Enter database schema to be acessed within the database: ")

config = {
    'host': _host_, 
    'user': _user_,
    'password': _password_,
    'database': _database_schema_
}

# Connect to the database
conn = mysql.connector.connect(**config)
cursor = conn.cursor()

# Making SQL query to obtain total sales per quarter
query = """
SELECT CONCAT(YEAR(p.dataVenda), '-Q', QUARTER(p.dataVenda)) AS trimestre, SUM(ip.valorTotal) AS total_vendas
FROM pedido p
JOIN itemPedido ip ON p.id_pedido = ip.id_pedido
GROUP BY trimestre
ORDER BY trimestre;
"""

# Execute query
cursor.execute(query)
results = cursor.fetchall()

# Close connection
cursor.close()
conn.close()

# Process results
quarters = []
sales = []

for row in results:
    quarters.append(row[0])
    sales.append(row[1])

# Creating a line chart to show the sales trend over the quarters
plt.figure(figsize=(10, 5)) # in this case, using pandas plot configurations isn't useful ( I normally use to remove scientific notation from the axis )
plt.plot(quarters, sales, marker='o', linestyle='-', color='blue', label="Total Sales")
plt.xlabel("Quarter")
plt.ylabel("Total Sales (R$)")
plt.title("Sales Evolution per Quarter")
plt.xticks(rotation=45)
plt.grid(True)
plt.legend()  # Adding legend so the viewer understands what the marker means
plt.savefig("anylisis_2", bbox_inches="tight")
plt.show()


# Displaying results in the console
print("Sales per Quarter:")
for quarter, total in zip(quarters, sales):
    print(f"Quarter: {quarter}, Total Sales: R$ {total:.2f}")