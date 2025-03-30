import mysql.connector
import matplotlib.pyplot as plt

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
SELECT genero, COUNT(*) AS total_clientes
FROM cliente
GROUP BY genero;
"""

# Execute the query
cursor.execute(query)
results = cursor.fetchall()

# Close connection with the database
cursor.close()
conn.close()

# Process the results
genders = []
amount_per_gender = []

#row[0] returns the gender in the portuguese language. In that case we need to translate them so the labels aren't displayed in portuguese)

gender_translation = {
    'Masculino': 'Male',
    'Feminino' : 'Female',
    'Outro' : 'Other'
}
for row in results:
    genders.append(gender_translation[row[0]])
    amount_per_gender.append(row[1])

# Criando the pie chart
plt.figure(figsize=(6, 6))
plt.pie(amount_per_gender, labels=genders, autopct='%1.1f%%', colors=["#5b8dff", "#ff9bf3", "#e8e5e8"]) # these are in the order that the values are placed on the pie chart, so order matters
plt.title("Customer Distribution by Gender")
plt.show()

# Exibindo os resultados no console
for genero, total in zip(genders,amount_per_gender):
    print(f"Gender: {genders}, Total Customers: {amount_per_gender}")

