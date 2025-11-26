"""
Operaciones UPDATE
"""

from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def actualizar_precio_obra(obra_id, nuevo_precio):
    """Actualiza el precio estimado de una obra"""
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        sql = """
        UPDATE obras 
        SET precio_estimado = %s
        WHERE id = %s
        """
        
        cursor.execute(sql, (nuevo_precio, obra_id))
        conexion.commit()
        
        if cursor.rowcount > 0:
            print(f"✓ Precio actualizado para obra ID {obra_id}: ${nuevo_precio:,.2f}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró obra con ID {obra_id}")
            cursor.close()
            return False
        
    except Error as e:
        print(f"✗ Error al actualizar precio: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)

def actualizar_datos_visitante(visitante_id, email=None, telefono=None):
    """Actualiza información de contacto de un visitante"""
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        campos = []
        valores = []
        
        if email:
            campos.append("email = %s")
            valores.append(email)
        if telefono:
            campos.append("telefono = %s")
            valores.append(telefono)
        
        if not campos:
            print("✗ No hay datos para actualizar")
            return False
        
        valores.append(visitante_id)
        sql = f"UPDATE visitantes SET {', '.join(campos)} WHERE id = %s"
        
        cursor.execute(sql, valores)
        conexion.commit()
        
        if cursor.rowcount > 0:
            print(f"✓ Visitante ID {visitante_id} actualizado correctamente")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró visitante con ID {visitante_id}")
            cursor.close()
            return False
        
    except Error as e:
        print(f"✗ Error al actualizar visitante: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)

def actualizar_tipo_obra(obra_id, nuevo_tipo):
    """Actualiza el tipo de una obra"""
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        sql = """
        UPDATE obras 
        SET tipo_obra = %s
        WHERE id = %s
        """
        
        cursor.execute(sql, (nuevo_tipo, obra_id))
        conexion.commit()
        
        if cursor.rowcount > 0:
            print(f"✓ Tipo de obra actualizado para ID {obra_id}: {nuevo_tipo}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró obra con ID {obra_id}")
            cursor.close()
            return False
        
    except Error as e:
        print(f"✗ Error al actualizar tipo de obra: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)