# Opción Yo - Prueba técnica
Autor: Kevin Bejarano Calle

## Cómo ejecutar todo con un solo comando

### Requisitos previos

Antes de ejecutar el proyecto, es necesario contar con:

- Java 17 o superior.
- Maven instalado.
- Node.js instalado.
- Mockoon CLI instalado.

Instalación de Mockoon CLI:

```bash
npm install -g @mockoon/cli
```

---

## Ejecución completa

Desde la raíz del proyecto ejecutar:

```bash
mvn clean test
```

Este comando ejecuta automáticamente la suite de pruebas automatizadas.

---

## ¿Qué ejecuta el comando?

Al ejecutar:

```bash
mvn clean test
```

el proyecto realiza:

1. Compilación del proyecto.
2. Ejecución de los runners de Karate.
3. Ejecución de los escenarios automatizados.
4. Generación de reportes de ejecución.

---

## Ejecución del ambiente mock

Antes de ejecutar las pruebas, debe estar disponible el servidor Mockoon con la configuración ubicada en:

```
mock/OpcionYo-mock-api.json
```

Para levantar el mock manualmente:

```bash
mockoon-cli start --data mock/OpcionYo-mock-api.json
```

Una vez iniciado el mock, las pruebas automatizadas consumirán los endpoints configurados.

---

## Reportes

Luego de la ejecución, los reportes generados por Karate estarán disponibles en:

```
target/karate-reports
```
