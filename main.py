"""
Aplicación CRUD para Base de Datos de Museo
Archivo Principal Main

Estudiante: Mateo Orozco Baldovino
Asignatura: Bases de Datos 1- 2025
"""

from datetime import datetime
from create import insertar_empleado
from update import (actualizar_telefono_email, actualizar_cargo,
                    actualizar_salario, actualizar_horario,
                    cambiar_estado_empleado)
from read import (
    consulta_1_exhibiciones_activas,
    consulta_2_guias_museo,
    consulta_3_productos_tienda,
    consulta_4_empleados_museo,
    consulta_5_estadisticas_empleados,
    consulta_6_entradas_vendidas_mes
)
from delete import eliminar_empleado


def mostrar_menu():
    """Muestra el menú principal del sistema de gestión del museo"""

    print("\n" + "-" * 60)
    print("SISTEMA DE GESTION DE MUSEO - museo_2025")
    print("-" * 60)

    print("\nCONSULTAS")
    print("1. Listar exhibiciones activas con ubicacion y fecha")
    print("2. Listar guias del museo con su especialidad")
    print("3. Listar productos disponibles en tienda")
    print("4. Listar empleados del museo con su cargo")
    print("5. Ver estadisticas de empleados por cargo")
    print("6. Ver estadisticas de entradas vendidas (mes actual)")

    print("\nINSERCION")
    print("7. Insertar nuevo empleado")

    print("\nACTUALIZACION")
    print("8. Actualizar telefono o email de empleado")
    print("9. Actualizar cargo de empleado")
    print("10. Actualizar salario de empleado")
    print("11. Actualizar horario de empleado")
    print("12. Cambiar estado de empleado (activo o inactivo)")

    print("\nELIMINACION")
    print("13. Eliminar empleado")

    print("\n0. Salir")
    print("-" * 60)




def ejecutar_aplicacion():
    """Función principal del sistema"""

    print("\n" + "=" * 70)
    print("   ¡Bienvenido al Sistema de Gestión de Museo!")
    print("   Base de Datos: museo_2025")
    print("=" * 70)

    while True:
        mostrar_menu()

        try:
            opcion = input("\n👉 Seleccione una opción: ").strip()

            # === CONSULTAS SELECT ===
            if opcion == "1":
                consulta_1_exhibiciones_activas()
                input("\nPresione Enter para continuar...")

            elif opcion == "2":
                consulta_2_guias_museo()
                input("\nPresione Enter para continuar...")

            elif opcion == "3":
                consulta_3_productos_tienda()
                input("\nPresione Enter para continuar...")

            elif opcion == "4":
                consulta_4_empleados_museo()
                input("\nPresione Enter para continuar...")

            elif opcion == "5":
                consulta_5_estadisticas_empleados()
                input("\nPresione Enter para continuar...")

            elif opcion == "6":
                consulta_6_entradas_vendidas_mes()
                input("\nPresione Enter para continuar...")

            # === INSERCIÓN ===
            elif opcion == "7":
                print("\n" + "=" * 70)
                print("  INSERTAR NUEVO EMPLEADO")
                print("=" * 70)

                nombre_completo = input("\nNombre completo: ").strip()
                documento_identidad = input("Documento de identidad: ").strip()

                print("\nCargos disponibles:")
                print("  1. guia")
                print("  2. administrador")
                print("  3. cajero")
                print("  4. seguridad")
                print("  5. mantenimiento")
                print("  6. gerente")
                print("  7. atencion_cliente")

                cargos = ['guia', 'administrador', 'cajero', 'seguridad',
                          'mantenimiento', 'gerente', 'atencion_cliente']
                cargo_num = int(input("\nSeleccione cargo (1-7): "))

                if 1 <= cargo_num <= 7:
                    cargo = cargos[cargo_num - 1]
                else:
                    print("✗ Cargo inválido")
                    continue

                telefono = input("Teléfono: ").strip() or None
                email = input("Email: ").strip() or None
                fecha_contratacion = input("Fecha de contratación (YYYY-MM-DD) [Enter = hoy]: ").strip()

                if not fecha_contratacion:
                    fecha_contratacion = datetime.now().strftime('%Y-%m-%d')

                horario_entrada = input("Horario de entrada (HH:MM:SS): ").strip()
                horario_salida = input("Horario de salida (HH:MM:SS): ").strip()
                salario = float(input("Salario: "))

                insertar_empleado(nombre_completo, documento_identidad, cargo,
                                  telefono, email, fecha_contratacion,
                                  horario_entrada, horario_salida, salario)

                input("\nPresione Enter para continuar...")

            # === ACTUALIZACIÓN ===
            elif opcion == "8":
                print("\n" + "=" * 70)
                print("  ACTUALIZAR TELÉFONO/EMAIL DE EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado: "))
                telefono = input("Nuevo teléfono (Enter para omitir): ").strip() or None
                email = input("Nuevo email (Enter para omitir): ").strip() or None

                actualizar_telefono_email(empleado_id, telefono, email)
                input("\nPresione Enter para continuar...")

            elif opcion == "9":
                print("\n" + "=" * 70)
                print("  ACTUALIZAR CARGO DE EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado: "))

                print("\nCargos disponibles:")
                print("  1. guia")
                print("  2. administrador")
                print("  3. cajero")
                print("  4. seguridad")
                print("  5. mantenimiento")
                print("  6. gerente")
                print("  7. atencion_cliente")

                cargos = ['guia', 'administrador', 'cajero', 'seguridad',
                          'mantenimiento', 'gerente', 'atencion_cliente']
                cargo_num = int(input("\nSeleccione nuevo cargo (1-7): "))

                if 1 <= cargo_num <= 7:
                    nuevo_cargo = cargos[cargo_num - 1]
                    actualizar_cargo(empleado_id, nuevo_cargo)
                else:
                    print("✗ Cargo inválido")

                input("\nPresione Enter para continuar...")

            elif opcion == "10":
                print("\n" + "=" * 70)
                print("  ACTUALIZAR SALARIO DE EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado: "))
                nuevo_salario = float(input("Nuevo salario: "))

                actualizar_salario(empleado_id, nuevo_salario)
                input("\nPresione Enter para continuar...")

            elif opcion == "11":
                print("\n" + "=" * 70)
                print("  ACTUALIZAR HORARIO DE EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado: "))
                horario_entrada = input("Nueva hora de entrada (HH:MM:SS, Enter para omitir): ").strip() or None
                horario_salida = input("Nueva hora de salida (HH:MM:SS, Enter para omitir): ").strip() or None

                actualizar_horario(empleado_id, horario_entrada, horario_salida)
                input("\nPresione Enter para continuar...")

            elif opcion == "12":
                print("\n" + "=" * 70)
                print("  CAMBIAR ESTADO DE EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado: "))
                print("\nEstados disponibles:")
                print("  1. activo")
                print("  2. inactivo")

                estado_num = input("\nSeleccione estado (1-2): ").strip()

                if estado_num == "1":
                    cambiar_estado_empleado(empleado_id, "activo")
                elif estado_num == "2":
                    cambiar_estado_empleado(empleado_id, "inactivo")
                else:
                    print("✗ Estado inválido")

                input("\nPresione Enter para continuar...")

            # === ELIMINACIÓN ===
            elif opcion == "13":
                print("\n" + "=" * 70)
                print("  ELIMINAR EMPLEADO")
                print("=" * 70)

                empleado_id = int(input("\nID del empleado a eliminar: "))

                print("\n⚠️  ADVERTENCIA: Esta acción no se puede deshacer")
                confirmar = input("¿Está seguro de eliminar este empleado? (SI/no): ").strip().upper()

                if confirmar == "SI":
                    eliminar_empleado(empleado_id)
                else:
                    print("❌ Operación cancelada")

                input("\nPresione Enter para continuar...")

            # === SALIR ===
            elif opcion == "0":
                print("\n" + "=" * 70)
                print("   ¡Gracias por usar el sistema!")
                print("   Desarrollado por: Mateo Orozco Baldovino")
                print("=" * 70)
                break

            else:
                print("✗ Opción inválida. Por favor seleccione una opción del menú.")
                input("\nPresione Enter para continuar...")

        except ValueError as e:
            print(f"✗ Error: Ingrese un valor válido - {e}")
            input("\nPresione Enter para continuar...")
        except KeyboardInterrupt:
            print("\n\n¡Hasta luego!")
            break
        except Exception as e:
            print(f"✗ Error inesperado: {e}")
            print("Por favor, intente nuevamente.")
            input("\nPresione Enter para continuar...")


if __name__ == "__main__":
    ejecutar_aplicacion()
