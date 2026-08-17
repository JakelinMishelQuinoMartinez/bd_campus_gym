# REQUERIMIENTOS DEL TALLER - CAMPUSLANDS GYM

## OBJETIVO GENERAL
Crear una base de datos para un gimnasio llamada "campuslands_gym" que permita gestionar socios, entrenadores, sedes, planes de entrenamiento y asignaciones, cumpliendo con todos los requerimientos técnicos solicitados en la review.

## REQUERIMIENTOS TÉCNICOS

### 1. ESTRUCTURA DE BASE DE DATOS
- Crear la base de datos campuslands_gym
- Implementar todas las tablas necesarias para el funcionamiento del gimnasio
- Establecer relaciones entre tablas usando claves foráneas
- Normalizar la base de datos

### 2. LENGUAJE SQL

#### DDL (Data Definition Language)
- Crear todas las tablas: socios, ciudades, sedes, planes_entrenamientos, especialidades, entrenadores, socio_plan_entrenadores
- Definir claves primarias y foráneas
- Establecer restricciones de integridad

#### DML (Data Manipulation Language)
- Insertar datos ficticios en todas las tablas
- Población de datos de prueba

#### DQL (Data Query Language)
- Consultas con IN
- Consultas con INNER JOIN
- Consultas con OUT (LEFT JOIN)
- Consultas con INOUT (RIGHT JOIN)
- Consultas con IF_THEN_ELSE (CASE)
- Consultas con subconsultas

### 3. ESTRUCTURAS DE CONTROL

#### Bucles
- WHILE: Implementar procedimiento que inserte múltiples registros
- REPEAT: Implementar procedimiento que recorra y actualice registros
- LOOP: Implementar procedimiento con iteraciones controladas

#### CASE
- Utilizar CASE en consultas para clasificación de datos
- Utilizar CASE en procedimientos almacenados

### 4. MANEJO DE ERRORES
- Manejo de errores con código específico (códigos de error de MySQL)
- Manejo de errores con transacciones (START TRANSACTION, COMMIT, ROLLBACK)
- Implementar SIGNAL para lanzar errores personalizados
- Manejar excepciones con DECLARE EXIT HANDLER

### 5. EVENTOS Y TRIGGERS
- EVENTO: Reporte diario - cantidad de socios por entrenador
- TRIGGER: Verificar disponibilidad de entrenador antes de asignación (máximo 3 socios por entrenador)

### 6. FUNCIONES CREADAS POR USUARIO
- Función simple: Calcular comisión del entrenador
- Función con condiciones: Clasificar socios según cantidad de planes
- Función con bucles: Contar socios por entrenador
- Función que accede a datos de la base: Obtener sede principal de un socio
- Función no determinística: Generar código único para socio
- Función con manejo de errores: Calcular socios de entrenador con validación

### 7. PARTICIONAMIENTO DE TABLAS
- Implementar particionamiento por rango de fechas
- Crear tabla particionada para auditoría

### 8. PREPARE, EXECUTE Y DEALLOCATE
- Implementar consultas dinámicas
- Demostrar el uso de sentencias preparadas

### 9. CREACIÓN DE USUARIOS Y PRIVILEGIOS
- Crear usuario normal
- Crear usuario administrador
- Crear usuario consultor
- Asignar permisos básicos
- Asignar permisos específicos sobre columnas
- Verificar privilegios de usuarios

## ENTREGABLES
1. Base de datos funcional con todas las tablas y datos
2. Scripts SQL organizados por tipo (DDL, DML, DQL)
3. Procedimientos almacenados para cada requerimiento
4. Funciones personalizadas
5. Eventos y triggers configurados
6. Capturas de pantalla de cada funcionalidad implementada
7. Documentación completa en archivos markdown

## CRITERIOS DE EVALUACIÓN
- Funcionalidad correcta de cada requerimiento
- Código limpio y bien organizado
- Manejo adecuado de errores
- Documentación clara y completa
- Evidencias visuales de cada implementación