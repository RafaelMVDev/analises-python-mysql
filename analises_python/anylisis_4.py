import mysql.connector
import matplotlib.pyplot as plt
import pandas as pd

# MySQL connection configuration
# For security purposes, all data will be received via input
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
connection = mysql.connector.connect(**config)
cursor = connection.cursor()

# SQL query to get the top 10 clients with the highest purchase value
query = """
SELECT c.nome, SUM(ip.valorTotal) AS gasto_cliente from cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN itempedido ip ON p.id_pedido = ip.id_pedido
GROUP BY c.nome
ORDER BY gasto_cliente DESC
LIMIT 10;
"""

# Execute query
cursor.execute(query)
results = cursor.fetchall()

# Close connection
cursor.close()
connection.close()

# Process results
clients = []
total_spent = []

for row in results:
    clients.append(row[0])
    total_spent.append(float(row[1]))

# Display results in the console
print("Top 10 Clients with the Highest Purchase Value")
for client, amount in zip(clients, total_spent):
    print(f"Client: {client}, Amount (in R$): {amount}")

# Creating the bar chart
plt.figure(figsize=(10, 5))
sales_series = pd.Series(total_spent)

ax = sales_series.plot(kind='bar', color="#3455eb")
ax.set_xticklabels(clients)
ax.ticklabel_format(axis='y', style='plain')
ax.grid(axis='y', linestyle='--', linewidth=1, dashes=(4, 6), color="#dfdfdf")

# Adding total amount above each bar
bar_patches = ax.patches

for bar, amount in zip(bar_patches, total_spent):
    bar_height = bar.get_height()
    ax.text(
        bar.get_x() + bar.get_width() / 2, bar_height + 5, f"R$ {amount:,.2f}", ha="center", va="bottom"
    )

plt.xlabel("Client")
plt.ylabel("Total Amount Spent")
plt.title("Top 10 Clients with the Highest Purchase Value")
plt.xticks(rotation=45)
plt.show()