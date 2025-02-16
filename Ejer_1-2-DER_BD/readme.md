#Explicación del DER

##Resumen

Simulamos el DER para modelar la BD para KeepCoding, recogiendo datos de: Alumnos, calificaciones, bootcamps, módulos, matriculas 
y profesores. 

##Información de las tablas

Identificamos las siguientes entidades: **alumnos**, **bootcamps**, **profesores**, **módulos**, **matrículas** 
y **calificaciones**. 
A continuación, se describe cada tabla y su propósito:

- **Tabla `alumno`**: Almacena los datos de los estudiantes (nombre, apellidos, correo, teléfono).
- **Tabla `bootcamp`**: Registra información de los cursos de formación (nombre, fechas, estado).
- **Tabla `profesor`**: Contiene los datos de los profesores (nombre, apellidos, correo, teléfono).
- **Tabla `modulos`**: Asocia los módulos con los bootcamps y profesores correspondientes.
- **Tabla `matricula`**: Gestiona la relación entre alumnos y bootcamps, registrando las matrículas.
- **Tabla `calificaciones`**: Almacena las calificaciones de los alumnos por módulo.

##Explicación de las relaciones entre las tablas

Las relaciones clave entre las tablas son:
- Los **alumnos** pueden estar matriculados en varios **bootcamps**.
- Un **bootcamp** tiene múltiples **módulos**, y cada módulo es impartido por un **profesor**.
- Los **alumnos** reciben **calificaciones** por los **módulos** que cursan.

Este modelo de base de datos permite gestionar el seguimiento de matrículas, profesores, módulos y calificaciones de manera eficiente.
