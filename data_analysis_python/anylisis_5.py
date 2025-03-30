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

# SQL query to get total sales by day of the week
query = """
SELECT DAYNAME(p.dataVenda) AS dia_semana, SUM(ip.valorTotal) AS total_vendas
FROM pedido p
JOIN itemPedido ip ON p.id_pedido = ip.id_pedido
GROUP BY dia_semana
ORDER BY FIELD(dia_semana, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
"""

# Execute the query
cursor.execute(query)
results = cursor.fetchall()

# Close connection
cursor.close()
connection.close()

# Process results
week_days = []
sales = []

for row in results:
    week_days.append(row[0])
    sales.append(float(row[1]))

# Creating the bar chart
plt.figure(figsize=(8, 5))

sales_series = pd.Series(sales)
ax = sales_series.plot(kind='bar', color="#3455eb")
ax.set_xticklabels(week_days)
ax.ticklabel_format(axis='y', style='plain')
ax.grid(axis='y', linestyle='--', linewidth=1, dashes=(4, 6), color="#dfdfdf")

# Adding the total value above each bar
bar_patches = ax.patches

for bar, amount in zip(bar_patches, sales):
    bar_height = bar.get_height()
    ax.text(
        bar.get_x() + bar.get_width() / 2, bar_height + 5, f"R$ {amount:,.2f}", ha="center", va="bottom"
    )

plt.xlabel("Day of the Week")
plt.ylabel("Total Sales (R$)")
plt.title("Total Sales by Day of the Week")
plt.xticks(rotation=45)  # Rotates X-axis labels for better visualization
plt.show()

# Display results in the console
for day, total in zip(week_days, sales):
    print(f"Day of the Week: {day}, Total Sales: R$ {total:.2f}")