"""
Operaciones READ (SELECT)
"""

from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

def consulta_1_exhibiciones_activas():
    """
    CONSULTA 1: Listar todas las exhibiciones activas con su ubicación y fecha de finalización
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            e.id_exhibicion,
            e.codigo_exhibicion,
            e.nombre,
            e.tipo_exhibicion,
            e.fecha_inicio,
            e.fecha_finalizacion,
            e.descripcion,
            e.estado,
            GROUP_CONCAT(DISTINCT s.nombre_sala SEPARATOR ', ') as salas_asignadas,
            GROUP_CONCAT(DISTINCT s.ubicacion SEPARATOR ' | ') as ubicaciones
        FROM exhibiciones e
        LEFT JOIN exhibiciones_salas es ON e.id_exhibicion = es.id_exhibicion
        LEFT JOIN salas s ON es.id_sala = s.id_sala
        WHERE e.estado = 'activa'
        GROUP BY e.id_exhibicion, e.codigo_exhibicion, e.nombre, e.tipo_exhibicion, 
                 e.fecha_inicio, e.fecha_finalizacion, e.descripcion, e.estado
        ORDER BY e.fecha_inicio DESC
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  EXHIBICIONES ACTIVAS ({len(resultados)})")
        print(f"{'='*80}\n")
        
        for exhibicion in resultados:
            print(f"📍 {exhibicion['nombre']}")
            print(f"   Código: {exhibicion['codigo_exhibicion']}")
            print(f"   Tipo: {exhibicion['tipo_exhibicion'].upper()}")
            print(f"   Fecha inicio: {exhibicion['fecha_inicio']}")
            
            if exhibicion['fecha_finalizacion']:
                print(f"   Fecha finalización: {exhibicion['fecha_finalizacion']}")
            else:
                print(f"   Fecha finalización: PERMANENTE")
            
            if exhibicion['salas_asignadas']:
                print(f"   Salas: {exhibicion['salas_asignadas']}")
            
            if exhibicion['ubicaciones']:
                print(f"   Ubicación: {exhibicion['ubicaciones']}")
            
            if exhibicion['descripcion']:
                print(f"   Descripción: {exhibicion['descripcion'][:100]}...")
            
            print()
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 1: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_2_guias_museo():
    """
    CONSULTA 2: Listar todos los guías del museo con su especialidad
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            e.id_empleado,
            e.nombre_completo,
            e.documento_identidad,
            e.telefono,
            e.email,
            e.fecha_contratacion,
            e.estado,
            g.especialidad,
            g.calificacion_promedio,
            g.total_recorridos,
            GROUP_CONCAT(
                CONCAT(ig.idioma, ' (', ig.nivel, ')') 
                SEPARATOR ', '
            ) as idiomas
        FROM empleados e
        INNER JOIN guias g ON e.id_empleado = g.id_empleado
        LEFT JOIN idiomas_guias ig ON g.id_guia = ig.id_guia
        WHERE e.cargo = 'guia' AND e.estado = 'activo'
        GROUP BY e.id_empleado, e.nombre_completo, e.documento_identidad, 
                 e.telefono, e.email, e.fecha_contratacion, e.estado,
                 g.especialidad, g.calificacion_promedio, g.total_recorridos
        ORDER BY g.calificacion_promedio DESC, e.nombre_completo
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  GUÍAS DEL MUSEO ({len(resultados)})")
        print(f"{'='*80}\n")
        
        for guia in resultados:
            print(f"👤 {guia['nombre_completo']}")
            print(f"   ID Empleado: {guia['id_empleado']}")
            print(f"   Especialidad: {guia['especialidad'].upper()}")
            
            if guia['calificacion_promedio']:
                print(f"   Calificación: {guia['calificacion_promedio']:.2f}/5.00")
            
            print(f"   Total recorridos: {guia['total_recorridos']}")
            
            if guia['idiomas']:
                print(f"   Idiomas: {guia['idiomas']}")
            
            if guia['telefono']:
                print(f"   Teléfono: {guia['telefono']}")
            
            if guia['email']:
                print(f"   Email: {guia['email']}")
            
            print(f"   Contratado: {guia['fecha_contratacion']}")
            print()
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 2: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_3_productos_tienda():
    """
    CONSULTA 3: Listar todos los productos disponibles en la tienda del museo
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            a.id_articulo,
            a.codigo_articulo,
            a.nombre_articulo,
            a.categoria,
            a.precio_venta,
            a.cantidad_inventario,
            a.ubicacion_tienda,
            a.descripcion,
            p.nombre_proveedor
        FROM articulos_tienda a
        LEFT JOIN proveedores p ON a.id_proveedor = p.id_proveedor
        WHERE a.cantidad_inventario > 0
        ORDER BY a.categoria, a.nombre_articulo
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  PRODUCTOS DISPONIBLES EN TIENDA ({len(resultados)})")
        print(f"{'='*80}\n")
        
        categoria_actual = None
        for producto in resultados:
            if producto['categoria'] != categoria_actual:
                categoria_actual = producto['categoria']
                print(f"\n--- {categoria_actual.upper()} ---")
            
            print(f"🛍️  {producto['nombre_articulo']}")
            print(f"   Código: {producto['codigo_articulo']}")
            print(f"   Precio: ${producto['precio_venta']:,.2f}")
            print(f"   Stock: {producto['cantidad_inventario']} unidades")
            
            if producto['ubicacion_tienda']:
                print(f"   Ubicación: {producto['ubicacion_tienda']}")
            
            if producto['nombre_proveedor']:
                print(f"   Proveedor: {producto['nombre_proveedor']}")
            
            if producto['descripcion']:
                desc = producto['descripcion'][:80]
                print(f"   Descripción: {desc}...")
            
            print()
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 3: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_4_empleados_museo():
    """
    CONSULTA 4: Listar todos los empleados del museo con su cargo
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            id_empleado,
            nombre_completo,
            documento_identidad,
            cargo,
            telefono,
            email,
            fecha_contratacion,
            horario_entrada,
            horario_salida,
            salario,
            estado
        FROM empleados
        ORDER BY cargo, nombre_completo
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  EMPLEADOS DEL MUSEO ({len(resultados)})")
        print(f"{'='*80}\n")
        
        cargo_actual = None
        for empleado in resultados:
            if empleado['cargo'] != cargo_actual:
                cargo_actual = empleado['cargo']
                print(f"\n--- {cargo_actual.upper()} ---")
            
            # Emoji según estado
            emoji = "✅" if empleado['estado'] == 'activo' else "⏸️" if empleado['estado'] == 'vacaciones' else "❌"
            
            print(f"{emoji} {empleado['nombre_completo']}")
            print(f"   ID: {empleado['id_empleado']} | Doc: {empleado['documento_identidad']}")
            print(f"   Estado: {empleado['estado'].upper()}")
            print(f"   Salario: ${empleado['salario']:,.2f}")
            print(f"   Contratado: {empleado['fecha_contratacion']}")
            
            if empleado['horario_entrada'] and empleado['horario_salida']:
                print(f"   Horario: {empleado['horario_entrada']} - {empleado['horario_salida']}")
            
            if empleado['telefono']:
                print(f"   Teléfono: {empleado['telefono']}")
            
            if empleado['email']:
                print(f"   Email: {empleado['email']}")
            
            print()
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 4: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_5_estadisticas_empleados():
    """
    CONSULTA 5: Estadísticas de empleados por cargo (COUNT, AVG, MAX, MIN)
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            cargo,
            COUNT(*) as total_empleados,
            COUNT(CASE WHEN estado = 'activo' THEN 1 END) as empleados_activos,
            AVG(salario) as salario_promedio,
            MAX(salario) as salario_maximo,
            MIN(salario) as salario_minimo,
            SUM(salario) as total_nomina
        FROM empleados
        GROUP BY cargo
        ORDER BY total_empleados DESC
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  ESTADÍSTICAS DE EMPLEADOS POR CARGO")
        print(f"{'='*80}\n")
        
        for stat in resultados:
            print(f"📊 {stat['cargo'].upper()}")
            print(f"   Total empleados: {stat['total_empleados']}")
            print(f"   Empleados activos: {stat['empleados_activos']}")
            print(f"   Salario promedio: ${stat['salario_promedio']:,.2f}")
            print(f"   Salario máximo: ${stat['salario_maximo']:,.2f}")
            print(f"   Salario mínimo: ${stat['salario_minimo']:,.2f}")
            print(f"   Total nómina: ${stat['total_nomina']:,.2f}")
            print()
        
        # Totales generales
        cursor.execute("""
            SELECT 
                COUNT(*) as total_general,
                SUM(salario) as nomina_total
            FROM empleados
            WHERE estado = 'activo'
        """)
        totales = cursor.fetchone()
        
        print(f"{'='*80}")
        print(f"  TOTALES GENERALES")
        print(f"{'='*80}")
        print(f"Total empleados activos: {totales['total_general']}")
        print(f"Nómina total mensual: ${totales['nomina_total']:,.2f}\n")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 5: {e}")
        return []
    finally:
        cerrar_conexion(conexion)

def consulta_6_entradas_vendidas_mes():
    """
    CONSULTA 6: Estadísticas de entradas vendidas por tipo en el mes actual
    """
    conexion = crear_conexion()
    if not conexion:
        return []
    
    try:
        cursor = conexion.cursor(dictionary=True)
        
        sql = """
        SELECT 
            tipo_entrada,
            COUNT(*) as cantidad_vendida,
            SUM(precio) as ingresos_totales,
            AVG(precio) as precio_promedio,
            SUM(descuento_aplicado) as descuentos_totales
        FROM entradas
        WHERE MONTH(fecha_compra) = MONTH(CURDATE())
          AND YEAR(fecha_compra) = YEAR(CURDATE())
        GROUP BY tipo_entrada
        ORDER BY cantidad_vendida DESC
        """
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        print(f"\n{'='*80}")
        print(f"  ESTADÍSTICAS DE ENTRADAS - MES ACTUAL")
        print(f"{'='*80}\n")
        
        total_entradas = 0
        total_ingresos = 0
        total_descuentos = 0
        
        for stat in resultados:
            print(f"🎫 {stat['tipo_entrada'].upper()}")
            print(f"   Cantidad vendida: {stat['cantidad_vendida']}")
            print(f"   Ingresos: ${stat['ingresos_totales']:,.2f}")
            print(f"   Precio promedio: ${stat['precio_promedio']:,.2f}")
            print(f"   Descuentos aplicados: ${stat['descuentos_totales']:,.2f}")
            print()
            
            total_entradas += stat['cantidad_vendida']
            total_ingresos += stat['ingresos_totales']
            total_descuentos += stat['descuentos_totales']
        
        print(f"{'='*80}")
        print(f"  TOTALES")
        print(f"{'='*80}")
        print(f"Total entradas vendidas: {total_entradas}")
        print(f"Ingresos totales: ${total_ingresos:,.2f}")
        print(f"Descuentos totales: ${total_descuentos:,.2f}")
        print(f"Ingreso neto: ${total_ingresos - total_descuentos:,.2f}\n")
        
        cursor.close()
        return resultados
        
    except Error as e:
        print(f"✗ Error en consulta 6: {e}")
        return []
    finally:
        cerrar_conexion(conexion)