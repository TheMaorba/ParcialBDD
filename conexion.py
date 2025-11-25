import mysql.connector


conexion = mysql.connector.connect(user ='root', password ='mateo123456789',
                                    host ='localhost',
                                    database ='museo_2025',
                                    port = '3306')
print("Conexión exitosa a la base de datos.")


# Hacer consultados con la base de datos aquí
