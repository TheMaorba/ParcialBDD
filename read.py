"""
Operaciones READ (SELECT)
"""

from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def consulta_1_todas_obras():
    """CONSULTA 1: Obtener todas las obras del museo"""
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = "SELECT * FROM obras ORDER BY fecha_creacion DESC"
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n=== TODAS LAS OBRAS ({len(resultados)}) ===")
        for obra in resultados:
            print(f"ID: {obra['id']} | {obra['titulo']} - {obra['autor']} ({obra['fecha_creacion']})")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 1: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_2_obras_por_autor(autor):
    """CONSULTA 2: Buscar obras de un autor específico"""
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT titulo, fecha_creacion, tipo_obra, precio_estimado 
        FROM obras 
        WHERE autor LIKE %s
        ORDER BY fecha_creacion
        """
        
        cursor.execute(sql, (f'%{autor}%',))
        resultados = cursor.fetchall()
        
        print(f"\n=== OBRAS DE {autor.upper()} ({len(resultados)}) ===")
        for obra in resultados:
            print(f"{obra['titulo']} ({obra['fecha_creacion']}) - ${obra['precio_estimado']:,.2f}")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 2: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_3_obras_rango_precio(precio_min, precio_max):
    """CONSULTA 3: Obtener obras dentro de un rango de precio"""
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT titulo, autor, precio_estimado, tipo_obra
        FROM obras
        WHERE precio_estimado BETWEEN %s AND %s
        ORDER BY precio_estimado DESC
        """
        
        cursor.execute(sql, (precio_min, precio_max))
        resultados = cursor.fetchall()
        
        print(f"\n=== OBRAS ENTRE ${precio_min:,.2f} Y ${precio_max:,.2f} ===")
        for obra in resultados:
            print(f"{obra['titulo']} - {obra['autor']}: ${obra['precio_estimado']:,.2f}")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 3: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_4_estadisticas_obras():
    """CONSULTA 4: Estadísticas de obras (COUNT, AVG, MAX, MIN)"""
    conexion = crear_conexion()
    if not conexion:
        return None
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            COUNT(*) as total_obras,
            AVG(precio_estimado) as precio_promedio,
            MAX(precio_estimado) as precio_maximo,
            MIN(precio_estimado) as precio_minimo,
            COUNT(DISTINCT autor) as total_autores
        FROM obras
        """
        
        cursor.execute(sql)
        stats = cursor.fetchone()
        
        print(f"\n=== ESTADÍSTICAS DEL MUSEO ===")
        print(f"Total de obras: {stats['total_obras']}")
        print(f"Precio promedio: ${stats['precio_promedio']:,.2f}")
        print(f"Obra más cara: ${stats['precio_maximo']:,.2f}")
        print(f"Obra más barata: ${stats['precio_minimo']:,.2f}")
        print(f"Autores diferentes: {stats['total_autores']}")
        
        cursor.close()
        return stats
        
    except Error as e:
        print(f"✗ Error en consulta 4: {e}")
        return None
    finally:
        cerrar_conexion(conexion)

def consulta_5_obras_por_tipo():
    """CONSULTA 5: Agrupar obras por tipo con COUNT"""
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            tipo_obra,
            COUNT(*) as cantidad,
            AVG(precio_estimado) as precio_promedio
        FROM obras
        GROUP BY tipo_obra
        ORDER BY cantidad DESC
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n=== OBRAS POR TIPO ===")
        for tipo in resultados:
            print(f"{tipo['tipo_obra']}: {tipo['cantidad']} obras (promedio: ${tipo['precio_promedio']:,.2f})")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 5: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_6_visitantes_recientes(dias=30):
    """CONSULTA 6: Visitantes registrados recientemente"""
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT nombre, apellido, email, fecha_registro
        FROM visitantes
        WHERE fecha_registro >= DATE_SUB(CURDATE(), INTERVAL %s DAY)
        ORDER BY fecha_registro DESC
        """
        
        cursor.execute(sql, (dias,))
        resultados = cursor.fetchall()
        
        print(f"\n=== VISITANTES ÚLTIMOS {dias} DÍAS ({len(resultados)}) ===")
        for visitante in resultados:
            print(f"{visitante['nombre']} {visitante['apellido']} - {visitante['email']} ({visitante['fecha_registro']})")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 6: {e}")
        return []
    finally:
        cerrar_conexion(conexion)