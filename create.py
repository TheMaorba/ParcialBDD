"""
Operaciones CREATE (INSERT)
"""

import mysql.connector
from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def insertar_obra(titulo, autor, fecha_creacion, tipo_obra, precio_estimado):
    """Inserta una nueva obra en la base de datos"""
    conexion = crear_conexion()
    if not conexion:
        return None
    
    try:
        cursor = conexion.cursor()
        
        sql = """
        INSERT INTO obras (titulo, autor, fecha_creacion, tipo_obra, precio_estimado)
        VALUES (%s, %s, %s, %s, %s)
        """
        
        valores = (titulo, autor, fecha_creacion, tipo_obra, precio_estimado)
        
        cursor.execute(sql, valores)
        conexion.commit()
        
        obra_id = cursor.lastrowid
        print(f"✓ Obra insertada correctamente con ID: {obra_id}")
        
        cursor.close()
        return obra_id
        
    except Error as e:
        print(f"✗ Error al insertar obra: {e}")
        conexion.rollback()
        return None
        
    finally:
        cerrar_conexion(conexion)

def insertar_visitante(nombre, apellido, email, telefono, fecha_registro):
    """Inserta un nuevo visitante en la base de datos"""
    conexion = crear_conexion()
    if not conexion:
        return None
    
    try:
        cursor = conexion.cursor()
        
        sql = """
        INSERT INTO visitantes (nombre, apellido, email, telefono, fecha_registro)
        VALUES (%s, %s, %s, %s, %s)
        """
        
        valores = (nombre, apellido, email, telefono, fecha_registro)
        
        cursor.execute(sql, valores)
        conexion.commit()
        
        visitante_id = cursor.lastrowid
        print(f"✓ Visitante insertado con ID: {visitante_id}")
        
        cursor.close()
        return visitante_id
        
    except mysql.connector.IntegrityError as e:
        print(f"✗ Error de integridad (posible email duplicado): {e}")
        return None
    except Error as e:
        print(f"✗ Error al insertar visitante: {e}")
        return None
    finally:
        cerrar_conexion(conexion)