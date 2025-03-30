import mysql.connector
import matplotlib.pyplot as plt  # We will use Matplotlib to display the chart
import pandas as pd  # We will create the chart using Pandas (which uses Matplotlib in the backend)

"""
===========================================================================================
The database data (column names and schemas) are all in portuguese,
So expect the column retrieved from the queries to be in the same language.
The complete database is gonna be on the project's folder if you wanna change that mannualy.

OBSERVATION: The configuration data to connect to the database is gonna be as simple as 
it can gets. It uses the default configurations (port and  host adress), so if you hosted
the database on another port or different host adress, please change/add these specifications 
to the config variable on each anylisis.
===========================================================================================
"""

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
cursor = conn.cursor()  # The cursor is a class used to interact with the server, execute queries, etc.

# SQL query to calculate total sales by age group
query = """
SELECT FLOOR(DATEDIFF(CURDATE(), c.dataNascimento)/365/10)*10 AS faixa_etaria, 
       SUM(ip.valorTotal) AS total_vendas
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN itemPedido ip ON p.id_pedido = ip.id_pedido
GROUP BY faixa_etaria
ORDER BY faixa_etaria; 
"""

# Execute query
cursor.execute(query)
results = cursor.fetchall()  # Stores query results with fetchall()

# Close connection
cursor.close()
conn.close()

# Store results for the chart
age_groups = []
sales = []

# Format each row to display an age group
for row in results:
    group = f"{int(row[0])}-{int(row[0]) + 9} years"  # Example: "20-29 years"
    age_groups.append(group)
    sales.append(float(row[1])) # mysql query returns decimal.Decimal type, so we convert it to a float so matplotlib can compute these values


# Display results in the console
print("Total Sales by Age Group:")
for group, total in zip(age_groups, sales):
    print(f"Age Group: {group}, Total Sales: ${total:.2f}")

# Creating the bar chart
plt.figure(figsize=(10, 5))  # Chart size

sales_series = pd.Series(sales)  # Using Pandas Series to create the chart
ax = sales_series.plot(kind="bar",color = "#3455eb")  # 'ax' is a convention, so I'll use it here
ax.set_xticklabels(age_groups)  # Set tick labels to match the largest sales value without scientific notation
ax.ticklabel_format(axis = 'y',style = 'plain') # remove scientific notation fromthe y ticks
ax.grid(axis = 'y', linestyle = '--' , linewidth = 1, dashes = (4,6), color = "#dfdfdf") # this one is to activate a grid on the y axis to better visualise the height difference from the age groups

# Display results in the console
print("Total Sales by Age Group:")
for group, total in zip(age_groups, sales):
    print(f"Age Group: {group}, Total Sales: ${total:.2f}") # correct this part tomorrow <-- put dashed lines at each y tick

# -- Adding text above bars to display total sales values --
bar_info = ax.patches  # 'patches' returns information about each bar (color, size, etc.), used to place text above the bars

for bar, title in zip(bar_info, sales):
    bar_height = bar.get_height()
    ax.text(
        bar.get_x() + bar.get_width() / 2, bar_height + 5, title, ha="center", va="bottom"
    )
    
plt.xlabel("Age Group")
plt.ylabel("Total Sales (in R$)")
plt.title("Total Sales by Age Group")
plt.xticks(rotation=45)  # Rotate X-axis labels for better visualization
plt.show()
