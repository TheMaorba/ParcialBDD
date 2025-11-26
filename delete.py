"""
Operaciones DELETE
"""

from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def eliminar_obra(obra_id):
    """Elimina una obra de la base de datos"""
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        cursor.execute("SELECT titulo FROM obras WHERE id = %s", (obra_id,))
        obra = cursor.fetchone()
        
        if not obra:
            print(f"✗ No existe obra con ID {obra_id}")
            cursor.close()
            return False
        
        sql = "DELETE FROM obras WHERE id = %s"
        
        cursor.execute(sql, (obra_id,))
        conexion.commit()
        
        print(f"✓ Obra '{obra[0]}' (ID: {obra_id}) eliminada correctamente")
        cursor.close()
        return True
        
    except Error as e:
        print(f"✗ Error al eliminar obra: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)

def eliminar_visitante(visitante_id):
    """Elimina un visitante de la base de datos"""
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        cursor.execute(
            "SELECT nombre, apellido FROM visitantes WHERE id = %s", 
            (visitante_id,)
        )
        visitante = cursor.fetchone()
        
        if not visitante:
            print(f"✗ No existe visitante con ID {visitante_id}")
            cursor.close()
            return False
        
        sql = "DELETE FROM visitantes WHERE id = %s"
        
        cursor.execute(sql, (visitante_id,))
        conexion.commit()
        
        print(f"✓ Visitante '{visitante[0]} {visitante[1]}' (ID: {visitante_id}) eliminado correctamente")
        cursor.close()
        return True
        
    except Error as e:
        print(f"✗ Error al eliminar visitante: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)