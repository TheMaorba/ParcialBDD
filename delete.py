"""
Operaciones DELETE
"""

from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def eliminar_empleado(empleado_id):
    """
    Elimina un empleado de la base de datos
    
    Args:
        empleado_id: ID del empleado a eliminar
    
    Returns:
        bool: True si se eliminó correctamente, False si falló
    """
    conexion = crear_conexion()
    if not conexion:
        return False
    
    try:
        cursor = conexion.cursor()
        
        # Verificar que el empleado existe
        cursor.execute("""
            SELECT nombre_completo, cargo, documento_identidad, estado 
            FROM empleados 
            WHERE id_empleado = %s
        """, (empleado_id,))
        
        empleado = cursor.fetchone()
        
        if not empleado:
            print(f"✗ No existe empleado con ID {empleado_id}")
            cursor.close()
            return False
        
        # Mostrar información del empleado
        print(f"\n{'='*60}")
        print(f"  EMPLEADO A ELIMINAR")
        print(f"{'='*60}")
        print(f"ID: {empleado_id}")
        print(f"Nombre: {empleado[0]}")
        print(f"Cargo: {empleado[1]}")
        print(f"Documento: {empleado[2]}")
        print(f"Estado: {empleado[3]}")
        print(f"{'='*60}\n")
        
        # Verificar si es guía
        cursor.execute("""
            SELECT COUNT(*) 
            FROM guias 
            WHERE id_empleado = %s
        """, (empleado_id,))
        
        es_guia = cursor.fetchone()[0] > 0
        
        if es_guia:
            # Verificar si tiene visitas guiadas activas
            cursor.execute("""
                SELECT COUNT(*) 
                FROM visitas_guiadas vg
                INNER JOIN guias g ON vg.id_guia = g.id_guia
                WHERE g.id_empleado = %s 
                  AND vg.estado = 'programada'
            """, (empleado_id,))
            
            visitas_activas = cursor.fetchone()[0]
            
            if visitas_activas > 0:
                print(f"⚠️  ADVERTENCIA: Este guía tiene {visitas_activas} visita(s) programada(s)")
                print("   No se puede eliminar hasta reasignar o cancelar las visitas")
                cursor.close()
                return False
        
        # Ejecutar eliminación
        sql = "DELETE FROM empleados WHERE id_empleado = %s"
        cursor.execute(sql, (empleado_id,))
        conexion.commit()
        
        print(f"✓ Empleado '{empleado[0]}' (ID: {empleado_id}) eliminado correctamente")
        
        cursor.close()
        return True
        
    except Error as e:
        print(f"✗ Error al eliminar empleado: {e}")
        print("  Nota: Puede haber registros relacionados en otras tablas")
        print("  (historial de cargos, guías, mantenimientos, etc.)")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)