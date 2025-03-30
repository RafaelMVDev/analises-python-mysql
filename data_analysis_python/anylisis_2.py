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

# SQL query to calculate the ROI of products
query = """
SELECT p.nomeProduto, 
       (SUM(ip.valorTotal) - SUM(p.valorCusto * ip.quantidade)) / SUM(p.valorCusto * ip.quantidade) AS ROI
FROM itemPedido ip
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY p.nomeProduto
ORDER BY ROI DESC
LIMIT 10;
"""

# Execute query
cursor.execute(query)
results = cursor.fetchall()

# Close connection
cursor.close()
conn.close()

# Process results
products = []
rois = []

for row in results:
    products.append(row[0])
    rois.append(float(row[1]))

# Creating the plot
plt.figure(figsize=(10, 5))

rois_series = pd.Series(rois)
ax = rois_series.plot(kind='barh', color='g')
ax.set_yticklabels(products)  
ax.ticklabel_format(axis='x', style='plain')
ax.grid(axis='x', linestyle='--', linewidth=1, dashes=(4, 6), color="#dfdfdf") 


# Display results in the console
print("Top 10 Products with Highest ROI:")
for product, roi in zip(products, rois):
    print(f"Product: {product}, ROI: {roi:.2%}")

plt.xlabel("ROI (%)")
plt.ylabel("Product")
plt.title("Top 10 Products with Highest ROI")
plt.gca().invert_yaxis()  # Invert axis to show the highest ROI at the top
plt.xticks(rotation=45)
plt.show()


