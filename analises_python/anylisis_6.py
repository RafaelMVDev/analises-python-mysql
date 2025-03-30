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

# Connecting to the database
conn = mysql.connector.connect(**config) 
cursor = conn.cursor()

# SQL query to get total sales by day of the week
query = """
SELECT c.nomeCategoria, SUM((ip.valorVendaPedido - p.valorCusto) * ip.quantidade) AS lucro_total
FROM itemPedido ip
JOIN produto p ON ip.id_produto = p.id_produto
JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nomeCategoria
ORDER BY lucro_total DESC;
"""

# Execute the query
cursor.execute(query)
results = cursor.fetchall()

# Close connection with the database
cursor.close()
conn.close()

# Processa the results
categories = []
profit = []

for row in results: 
    categories.append(row[0]) 
    profit.append(float(row[1]))

# # Creating the bar chart 

plt.figure(figsize=(10, 5))
lucros_series = pd.Series(profit)

# Setting color based on conditional statement
colors = ['green' if val > 0 else 'red' for val in lucros_series] # green if the value is above 0 or red if it's below that

ax = lucros_series.plot(kind = 'barh',color = colors)
ax.set_yticklabels(categories)
ax.ticklabel_format(axis='x', style='plain')
ax.grid(axis='x', linestyle='--', linewidth=1, dashes=(4, 6), color="#dfdfdf") 

plt.xlabel("Total Profit (R$)")
plt.ylabel("Categorie")
plt.title("Total Profit by Category")
plt.gca().invert_yaxis()  # Inverte eixo para a categoria com maior lucro ficar no topo
plt.show()

# Exibir resultados no console
for categoria, lucro in zip(categories, profit):
    print(f"Category: {categoria}, Total Profit: R$ {lucro:.2f}")