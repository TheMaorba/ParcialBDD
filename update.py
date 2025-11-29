"""
Operaciones UPDATE
"""

"""Se importan las librerías necesarias para la conexión con la base de datos"""

import mysql.connector
from mysql.connector import Error
from conexion import crear_conexion, cerrar_conexion

"""Funciones para actualizar información de empleados"""


def actualizar_telefono_email(empleado_id, telefono=None, email=None):
    """Actualiza teléfono y/o email de un empleado"""

    conexion = crear_conexion()
    if not conexion:
        return False

    try:
        cursor = conexion.cursor()

        # Construir dinámicamente los campos a actualizar
        campos = []
        valores = []

        if telefono:
            campos.append("telefono = %s")
            valores.append(telefono)
        if email:
            campos.append("email = %s")
            valores.append(email)

        if not campos:
            print("✗ No hay datos para actualizar")
            return False

        valores.append(empleado_id)
        sql = f"UPDATE empleados SET {', '.join(campos)} WHERE id = %s"

        cursor.execute(sql, valores)
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"✓ Empleado ID {empleado_id} actualizado correctamente")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró empleado con ID {empleado_id}")
            cursor.close()
            return False

    except Error as e:
        print(f"✗ Error al actualizar empleado: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)


def actualizar_cargo(empleado_id, nuevo_cargo):
    """Actualiza el cargo de un empleado"""

    conexion = crear_conexion()
    if not conexion:
        return False

    try:
        cursor = conexion.cursor()

        sql = """
        UPDATE empleados 
        SET cargo = %s
        WHERE id = %s
        """

        cursor.execute(sql, (nuevo_cargo, empleado_id))
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"✓ Cargo actualizado para empleado ID {empleado_id}: {nuevo_cargo}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró empleado con ID {empleado_id}")
            cursor.close()
            return False

    except Error as e:
        print(f"✗ Error al actualizar cargo: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)


def actualizar_salario(empleado_id, nuevo_salario):
    """Actualiza el salario de un empleado"""

    conexion = crear_conexion()
    if not conexion:
        return False

    try:
        cursor = conexion.cursor()

        sql = """
        UPDATE empleados 
        SET salario = %s
        WHERE id = %s
        """

        cursor.execute(sql, (nuevo_salario, empleado_id))
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"✓ Salario actualizado para empleado ID {empleado_id}: ${nuevo_salario:,.2f}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró empleado con ID {empleado_id}")
            cursor.close()
            return False

    except Error as e:
        print(f"✗ Error al actualizar salario: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)


def actualizar_horario(empleado_id, horario_entrada=None, horario_salida=None):
    """Actualiza el horario de entrada y/o salida de un empleado"""

    conexion = crear_conexion()
    if not conexion:
        return False

    try:
        cursor = conexion.cursor()

        campos = []
        valores = []

        if horario_entrada:
            campos.append("horario_entrada = %s")
            valores.append(horario_entrada)
        if horario_salida:
            campos.append("horario_salida = %s")
            valores.append(horario_salida)

        if not campos:
            print("✗ No hay horarios para actualizar")
            return False

        valores.append(empleado_id)
        sql = f"UPDATE empleados SET {', '.join(campos)} WHERE id = %s"

        cursor.execute(sql, valores)
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"✓ Horario actualizado para empleado ID {empleado_id}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró empleado con ID {empleado_id}")
            cursor.close()
            return False

    except Error as e:
        print(f"✗ Error al actualizar horario: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)


def cambiar_estado_empleado(empleado_id, nuevo_estado):
    """Cambia el estado de un empleado (activo/inactivo)"""

    if nuevo_estado not in ['activo', 'inactivo']:
        print("✗ Estado inválido. Use 'activo' o 'inactivo'")
        return False

    conexion = crear_conexion()
    if not conexion:
        return False

    try:
        cursor = conexion.cursor()

        sql = """
        UPDATE empleados 
        SET estado = %s
        WHERE id = %s
        """

        cursor.execute(sql, (nuevo_estado, empleado_id))
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"✓ Estado cambiado a '{nuevo_estado}' para empleado ID {empleado_id}")
            cursor.close()
            return True
        else:
            print(f"✗ No se encontró empleado con ID {empleado_id}")
            cursor.close()
            return False

    except Error as e:
        print(f"✗ Error al cambiar estado: {e}")
        conexion.rollback()
        return False
    finally:
        cerrar_conexion(conexion)
