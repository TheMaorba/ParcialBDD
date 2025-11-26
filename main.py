"""
Aplicación CRUD para Base de Datos de Museo
Archivo Principal con Menú Interactivo
"""

from datetime import datetime
from create import insertar_obra, insertar_visitante
from read import (
    consulta_1_todas_obras,
    consulta_2_obras_por_autor,
    consulta_3_obras_rango_precio,
    consulta_4_estadisticas_obras,
    consulta_5_obras_por_tipo,
    consulta_6_visitantes_recientes
)
from update import (
    actualizar_precio_obra,
    actualizar_datos_visitante,
    actualizar_tipo_obra
)
from delete import (
    eliminar_obra,
    eliminar_visitante
)

def mostrar_menu():
    """Muestra el menú principal"""
    print("\n" + "="*50)
    print("   SISTEMA DE GESTIÓN DE MUSEO")
    print("="*50)
    print("\n--- OPERACIONES CREATE (INSERT) ---")
    print("1. Insertar nueva obra")
    print("2. Registrar visitante")
    print("\n--- OPERACIONES READ (SELECT) ---")
    print("3. Ver todas las obras")
    print("4. Buscar obras por autor")
    print("5. Obras por rango de precio")
    print("6. Ver estadísticas del museo")
    print("7. Obras agrupadas por tipo")
    print("8. Ver visitantes recientes")
    print("\n--- OPERACIONES UPDATE ---")
    print("9. Actualizar precio de obra")
    print("10. Actualizar datos de visitante")
    print("11. Actualizar tipo de obra")
    print("\n--- OPERACIONES DELETE ---")
    print("12. Eliminar obra")
    print("13. Eliminar visitante")
    print("\n0. Salir")
    print("="*50)

def ejecutar_aplicacion():
    """Función principal"""
    
    print("\n¡Bienvenido al Sistema de Gestión de Museo!")
    
    while True:
        mostrar_menu()
        
        try:
            opcion = input("\nSeleccione una opción: ").strip()
            
            if opcion == "1":
                print("\n--- INSERTAR NUEVA OBRA ---")
                titulo = input("Título: ")
                autor = input("Autor: ")
                fecha = input("Año de creación: ")
                tipo = input("Tipo (pintura/escultura/fotografía): ")
                precio = float(input("Precio estimado: "))
                insertar_obra(titulo, autor, fecha, tipo, precio)
                
            elif opcion == "2":
                print("\n--- REGISTRAR VISITANTE ---")
                nombre = input("Nombre: ")
                apellido = input("Apellido: ")
                email = input("Email: ")
                telefono = input("Teléfono: ")
                fecha_reg = datetime.now().strftime('%Y-%m-%d')
                insertar_visitante(nombre, apellido, email, telefono, fecha_reg)
            
            elif opcion == "3":
                consulta_1_todas_obras()
                
            elif opcion == "4":
                autor = input("Nombre del autor: ")
                consulta_2_obras_por_autor(autor)
                
            elif opcion == "5":
                precio_min = float(input("Precio mínimo: "))
                precio_max = float(input("Precio máximo: "))
                consulta_3_obras_rango_precio(precio_min, precio_max)
                
            elif opcion == "6":
                consulta_4_estadisticas_obras()
                
            elif opcion == "7":
                consulta_5_obras_por_tipo()
                
            elif opcion == "8":
                dias = input("¿Cuántos días atrás? (default 30): ").strip()
                dias = int(dias) if dias else 30
                consulta_6_visitantes_recientes(dias)
            
            elif opcion == "9":
                obra_id = int(input("ID de la obra: "))
                nuevo_precio = float(input("Nuevo precio: "))
                actualizar_precio_obra(obra_id, nuevo_precio)
                
            elif opcion == "10":
                visitante_id = int(input("ID del visitante: "))
                email = input("Nuevo email (Enter para omitir): ").strip() or None
                telefono = input("Nuevo teléfono (Enter para omitir): ").strip() or None
                actualizar_datos_visitante(visitante_id, email, telefono)
                
            elif opcion == "11":
                obra_id = int(input("ID de la obra: "))
                nuevo_tipo = input("Nuevo tipo de obra: ")
                actualizar_tipo_obra(obra_id, nuevo_tipo)
            
            elif opcion == "12":
                obra_id = int(input("ID de la obra a eliminar: "))
                confirmar = input("¿Está seguro? (s/n): ").lower()
                if confirmar == 's':
                    eliminar_obra(obra_id)
                else:
                    print("Operación cancelada")
                    
            elif opcion == "13":
                visitante_id = int(input("ID del visitante a eliminar: "))
                confirmar = input("¿Está seguro? (s/n): ").lower()
                if confirmar == 's':
                    eliminar_visitante(visitante_id)
                else:
                    print("Operación cancelada")
            
            elif opcion == "0":
                print("\n¡Gracias por usar el sistema!")
                break
                
            else:
                print("✗ Opción inválida")
                
        except ValueError:
            print("✗ Error: Ingrese un valor numérico válido")
        except KeyboardInterrupt:
            print("\n\n¡Hasta luego!")
            break
        except Exception as e:
            print(f"✗ Error inesperado: {e}")

if __name__ == "__main__":
    ejecutar_aplicacion()
