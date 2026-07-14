# Process

## Introducción

Durante el desarrollo de esta prueba técnica seguí un enfoque orientado a calidad, priorizando la comprensión de los requerimientos, la identificación de riesgos y la creación de una solución automatizada que pudiera ser ejecutada de forma repetible.

El objetivo no fue únicamente implementar pruebas que pasen correctamente, sino construir una estrategia de validación que represente escenarios reales de OpcionYo, incluyendo casos positivos, negativos y posibles edge cases.

---

# Herramientas utilizadas

## Karate Framework

Utilicé Karate como framework principal para la automatización de pruebas API.

La elección se realizó debido a que permite:

- Crear pruebas funcionales de APIs utilizando una sintaxis sencilla.
- Validar códigos de respuesta, estructuras JSON y reglas de negocio.
- Mantener los escenarios legibles para equipos técnicos y no técnicos.
- Integrarse fácilmente con pipelines de CI/CD mediante Maven.

---

## Maven

Utilicé Maven como herramienta de gestión y ejecución del proyecto.

Se utilizó para:

- Gestionar dependencias del proyecto.
- Ejecutar los escenarios automatizados.
- Generar reportes de ejecución.
- Integrar la ejecución de pruebas dentro del pipeline de CI.

---

## Mockoon

Utilicé Mockoon para simular las apis de OpcionYo.

La creación de los mocks fue realizada manualmente, implementando lo siguiente:

- Endpoints requeridos.
- Métodos HTTP.
- Códigos de respuesta.
- Estructuras de datos.
- Validaciones mediante reglas.
- Diferentes escenarios de respuesta.

La decisión de utilizar mocks permitió ejecutar las pruebas de forma independiente sin depender de servicios externos reales, manteniendo un ambiente controlado y reproducible.

Nota: en el caso del pago-con-stripe.feature se utilizó el modo sandbox de Stripe para los 2 primeros casos. El tercer caso fue simulado con Mockoon.

---

## GitHub Actions

Implementé un pipeline de integración continua utilizando GitHub Actions.

El pipeline fue diseñado para:

- Ejecutar los tests automáticamente en cada Pull Request.
- Levantar el ambiente mock antes de ejecutar las pruebas.
- Ejecutar la suite automatizada mediante Maven.
- Fallar automáticamente cuando algún escenario no cumple con los resultados esperados.

La decisión de incluir CI permite asegurar que los cambios futuros no introduzcan regresiones en la funcionalidad existente.

---

## Postman

Utilicé Postman como herramienta de apoyo durante la exploración inicial de los endpoints y validación manual de comportamientos.

Fue utilizado principalmente para:

- Verificar contratos de request y response.
- Validar reglas configuradas en los mocks.
- Analizar respuestas antes de implementar la automatización.

---

# Uso de Inteligencia Artificial

Durante el desarrollo de la prueba utilicé herramientas de inteligencia artificial como ChatGPT y GitHub Copilot como apoyo durante el proceso. Sirvió como un acelerador de ideas y obtener sugerencias de implementación, pero utilizando mi criterio personal y experiencia para decidir qué aplicar y cómo hacerlo.


---

# Decisiones tomadas

## Flujo de trabajo

1. Este proyecto lo inicié realizando un análisis del requerimiento de la prueba y los test solicitados para cada flujo.
2. Luego comencé con la creación de las apis mockeadas para poder ejecutar los escenarios de prueba.
3. Posteriormente, implementé los escenarios de prueba en Karate, siguiendo la estructura de carpetas y nomenclatura recomendada por los requerimientos de la prueba.
4. Por cada creación, ejecutaba de forma manual las pruebas en Postman y luego validaba la ejecución de los escenarios automatizados en Karate. Esto me daba la seguridad de que la prueba estaba correctamente implementada y que los resultados eran consistentes.

# Criterio de calidad aplicado

Durante la implementación busqué que la solución no solamente valide respuestas técnicas, sino que también represente riesgos reales del producto.

La estrategia combinó:

- Pruebas funcionales.
- Validaciones negativas.
- Pruebas de autorización.
- Validación de reglas de negocio.

El resultado final busca entregar una base de pruebas mantenible, reproducible y alineada con un proceso real de aseguramiento de calidad.