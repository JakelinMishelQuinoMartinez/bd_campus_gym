# TALLER CAMPUSLANDS GYM

## DESCRIPCIÓN DEL TALLER

Este taller consiste en la creación de una base de datos para la gestión de un gimnasio llamado Campuslands Gym. La base de datos permite administrar la información de socios, entrenadores, sedes, planes de entrenamiento y las asignaciones entre estos elementos.

El taller fue desarrollado como parte de un ejercicio académico para demostrar el dominio de diferentes conceptos de MySQL incluyendo la creación de bases de datos, consultas avanzadas, procedimientos almacenados, funciones, disparadores y manejo de usuarios.

## ESTRUCTURA DEL PROYECTO

El proyecto está organizado en las siguientes carpetas:

Carpeta database: Contiene todos los scripts SQL organizados por tipo
- ddl: Scripts de definición de datos (creación de tablas)
- dml: Scripts de manipulación de datos (inserciones)
- dql: Scripts de consultas de datos (consultas avanzadas)

Carpeta docs: Documentación del proyecto
- requeriments.md: Lista de requerimientos técnicos
- results.md: Resultados obtenidos y evidencias

Carpeta evidences: Capturas de pantalla de cada funcionalidad implementada

Carpeta modules: Scripts adicionales organizados por tema
- case.sql: Implementaciones de CASE
- events_triggers: Eventos y triggers
- functions.sql: Funciones personalizadas
- loops.sql: Estructuras de bucle
- manejo_de_errores.sql: Manejo de errores
- partition_and_security.sql: Particiones y seguridad
- users.sql: Gestión de usuarios
- while_and_repeat.sql: Bucles WHILE y REPEAT

```text 
BD_CAMPUS_GYM
│
├── database
│   ├── ddl
│   │   └── schema.sql
│   ├── dml
│   │   └── inserts.sql
│   └── dql
│       └── consults.sql
├── docs
│   ├── requeriments.md
│   └── results.md
├── evidences
├── modules
│   ├── .gitkeep
│   ├── case.sql
│   ├── events_triggers.sql
│   ├── functions.sql
│   ├── loops.sql
│   ├── manejo_de_errores.sql
│   ├── partition_and_security.sql
│   ├── users.sql
│   └── while_and_repeat.sql
└── README.md 
```

## FUNCIONALIDADES IMPLEMENTADAS

### Base de Datos
La base de datos contiene 7 tablas principales que permiten gestionar toda la información del gimnasio. Las tablas están relacionadas entre sí mediante claves foráneas para mantener la integridad de los datos.

### Consultas
Se implementaron diferentes tipos de consultas para extraer información de la base de datos incluyendo consultas con joins, subconsultas y filtros específicos.

### Procedimientos y Funciones
Se crearon procedimientos almacenados para automatizar tareas repetitivas y funciones personalizadas para cálculos específicos como comisiones de entrenadores y clasificación de socios.

### Automatizaciones
El sistema cuenta con un evento programado que genera reportes diarios automáticos y un trigger que verifica que los entrenadores no tengan más de 3 socios asignados.

### Seguridad
Se crearon diferentes usuarios con distintos niveles de permisos para garantizar la seguridad de la información. Los usuarios administradores tienen acceso total mientras que los usuarios normales tienen permisos limitados.

## EVIDENCIAS

Todas las capturas de pantalla que demuestran el funcionamiento de cada característica implementada se encuentran en la carpeta evidences. Cada captura muestra el código ejecutado y los resultados obtenidos.