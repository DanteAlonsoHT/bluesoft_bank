# Guía Proyecto Bluesoft Bank

Siguiendo los pasos a continuación podrás correr las funciones básicas solicitadas por Bluesoft Bank.

## Prerrequisitos

- **Ruby:** Versión 3.0
- **Rails:** Versión 7.0
- **PostgreSQL:**

## Paso 1: Clonar Repositorio

Clonar repositorio desde GitHub a tu entorno local.

```bash
git clone https://github.com/tu_usuario/bluesoft_bank.git
cd bluesoft_bank
```

## Paso 2: Instalar Dependencias

```bash
bundle install
```

## Paso 3: Crear la Base de Datos
```bash
rails db:create
```

## Paso 4: Ejecutar Migraciones
```bash
rails db:migrate
```

## Paso 5: Cargar Datos de Semillas
```bash
rails db:seed
```

## Paso 6: Iniciar el Servidor
```bash
rails server
```

Una vez siguiendo estos pasos, verás la siguiente vista, donde podrás interactuar con las funciones principales.

Vista del usuario y su cuenta ya sea de ahorro personal o cuentacorriente empresarial con su balance actual, en el link de detalles se pueden realizar transacciones.
<img width="1313" alt="Screenshot 2024-08-06 at 4 10 57 a m" src="https://github.com/user-attachments/assets/201a7a8d-40f1-4625-9204-c52c860589a4">

Vista de los reportes mensuales sobre los usuarios que hacen mas transacciones.
<img width="1313" alt="image" src="https://github.com/user-attachments/assets/a386bb9f-6ea2-4ac9-b11d-1a604a284e91">

Vista del reporte de la cantidad de retiros que su totalidad son superiores al $1,000,000.00 en cuentas de diferentes ciudades a la del or<img width="1313" alt="Screenshot 2024-08-06 at 4 13 37 a m" src="https://github.com/user-attachments/assets/acba7161-c396-4d07-aa12-066a531da5cb">
igen de la cuenta.





