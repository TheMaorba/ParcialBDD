"""
Módulo de Conexión a Base de Datos
"""

import mysql.connector
from mysql.connector import Error

def crear_conexion():
    """Establece conexión con la base de datos MySQL"""
    try:
        conexion = mysql.connector.connect(
            user='root',
            password='mateo123456789',
            host='localhost',
            database='museo_2025',
            port='3306'
        )
        
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