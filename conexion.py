"""
Modulo de Conexión a Base de Datos

En este codigo se importan las librerias necesarias para la conexion con una base de datos MySQL

"""

import mysql.connector
from mysql.connector import Error

def crear_conexion():
    """Establece conexión con la base de datos MySQL y se añaden los detalles del usuario"""
    try:
        conexion = mysql.connector.connect(
            user='root',
            password='mateo123456789',
            host='localhost',
            database='museo_2025',
            port='3306'
        )
        """Se crea una condicion para verificar si la base de datos fue conectada exitosamente"""



        if conexion.is_connected():
            print("✓ Conexión exitosa a la base de datos")
            return conexion
            
    except Error as e:
        print(f"✗ Error al conectar a MySQL: {e}")
        return None

def cerrar_conexion(conexion):


    """Cierra la conexión a la base de datos"""
    if conexion and conexion.is_connected():
        conexion.close()
        print("✓ Conexión cerrada")