"""
Operaciones CREATE (INSERT)
"""

import mysql.connector
from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def insertar_empleado(nombre_completo, documento_identidad, cargo, telefono, email, 
                      fecha_contratacion, horario_entrada, horario_salida, salario):
    """
    Inserta un nuevo empleado en la base de datos
    """
    conexion = crear_conexion()
    if not conexion:
        return None
    
    try:
        cursor = conexion.cursor()
        
        sql = """
        INSERT INTO empleados 
        (nombre_completo, documento_identidad, cargo, telefono, email, 
         fecha_contratacion, horario_entrada, horario_salida, salario, estado)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, 'activo')
        """
        
        valores = (nombre_completo, documento_identidad, cargo, telefono, email, 
                  fecha_contratacion, horario_entrada, horario_salida, salario)
        
        cursor.execute(sql, valores)
        conexion.commit()
        
        empleado_id = cursor.lastrowid
        print(f"✓ Empleado insertado correctamente con ID: {empleado_id}")
        print(f"  Nombre: {nombre_completo}")
        print(f"  Cargo: {cargo}")
        print(f"  Documento: {documento_identidad}")
        
        cursor.close()
        return empleado_id
        
    except mysql.connector.IntegrityError as e:
        print(f"✗ Error de integridad: {e}")
        print("  El documento de identidad ya existe en el sistema")
        return None
    except Error as e:
        print(f"✗ Error al insertar empleado: {e}")
        conexion.rollback()
        return None
        
    finally:
        cerrar_conexion(conexion)