# ¿Cómo testearías la lógica de la app sin hardware real?

Para validar la lógica de la aplicación sin disponer del hardware físico, aplicaría una estrategia basada en la creación de mocks para pruebas de API, simulando eventos de la aplicación y utilizando entornos controlados para la integración. Esto permitiría verificar que la aplicación maneje correctamente los datos y eventos que normalmente provendrían del hardware, como respuestas de sensores (camara activa, microfono activado, compartir pantalla).

## Estrategia de pruebas

### 1. Mock de comunicación con hardware

Simularía las respuestas del dispositivo mediante mocks o simuladores para validar cómo la aplicación procesa la información recibida, y se podría utilizar los endpoints de la API que normalmente recibirían datos del hardware.

**Ejemplos de escenarios:**

- El sensor envía un valor dentro del rango esperado → validar que la aplicación muestre el estado correcto.
- El sensor envía un valor crítico → validar que la aplicación genere una alerta.
- El dispositivo pierde conexión → validar que la aplicación maneje correctamente el error y permita la reconexión.

**Herramientas posibles:**

- Mock servers.
- Simuladores de dispositivos.
- Servicios virtualizados.

---

### 2. Pruebas de API con datos simulados

Si la aplicación consume servicios backend, utilizaría mocks de API para validar la comunicación entre la aplicación y los servicios externos.

**Escenarios a validar:**

- Respuesta exitosa (HTTP 200).
- Datos incompletos o inválidos.
- Errores del servidor (HTTP 500).
- Timeout del servicio.
- Pérdida temporal de conexión.

---

### 3. Simulación de eventos del dispositivo

Generaría eventos artificiales como si fueran enviados por el hardware real.

**Eventos simulados:**

- Encendido y apagado del dispositivo.
- Cambio de estado.
- Lectura de sensores.
- Envío periódico de datos.
- Desconexión y reconexión.
- Valores extremos o inesperados.

El objetivo sería validar que la aplicación responda correctamente ante diferentes comportamientos del dispositivo.

---

### 4. Pruebas de integración en ambiente controlado

Validaría la interacción entre los diferentes componentes utilizando ambientes simulados antes de integrar con hardware real.

**Validaría:**

- Comunicación aplicación ↔ backend.
- Comunicación aplicación ↔ dispositivo simulado.
- Actualización de información en tiempo real.
- Persistencia de datos.
- Manejo de errores.

**Herramientas posibles:**

- Postman/Newman.
- Mock servers.
- Emuladores.
- Firebase Test Lab.
- BrowserStack.

---

### 5. Validación de logs y trazabilidad

Revisaría que la aplicación registre correctamente los eventos importantes para facilitar diagnóstico.

**Validaciones:**

- Eventos recibidos desde el dispositivo.
- Cambios de estado.
- Errores generados.
- Intentos de reconexión.
- Acciones realizadas por el usuario.

---

## Objetivo de la estrategia

Asegurar que la aplicación cumpla con la lógica funcional esperada y maneje correctamente diferentes escenarios antes de realizar pruebas con hardware físico.

De esta manera se reduce la dependencia del dispositivo real y se pueden detectar errores temprano en la lógica de negocio, integración y manejo de excepciones.


# Matriz de combinaciones Dispositivo / Sistema Operativo / Browser

| ID | Dispositivo | Sistema Operativo | Browser | Test |
|---|---|---|---|---|
| 1 | Laptop/Desktop | Windows 11 | Chrome última versión | Usuario inicia sesión con credenciales válidas |
| 2 | Laptop/Desktop | Windows 11 | Edge última versión | Usuario crea una configuración y guarda cambios correctamente |
| 3 | Laptop/Desktop | macOS Sonoma | Safari última versión | Usuario navega por la aplicación y valida que los componentes visuales carguen correctamente |
| 4 | Laptop/Desktop | macOS Sonoma | Chrome última versión | Usuario ejecuta una acción crítica y valida que la información persista después de refrescar la página |
| 5 | Smartphone Android gama alta | Android 15 | Chrome Mobile | Usuario inicia sesión y mantiene la sesión activa después de cerrar y abrir la app |
| 6 | Smartphone Android gama media | Android 14 | Chrome Mobile | Usuario ejecuta una operación con conexión lenta y valida manejo de tiempos de espera |
| 7 | iPhone gama alta | iOS 18 | Safari Mobile | Usuario recibe una notificación generada por un evento del sistema |
| 8 | iPhone gama media/anterior | iOS 17 | Safari Mobile | Usuario completa un flujo principal sin errores de interfaz o navegación |
| 9 | Tablet Android | Android 14 | Chrome Tablet | Usuario utiliza la aplicación en orientación vertical y horizontal |
| 10 | iPad | iPadOS 18 | Safari | Usuario realiza un flujo completo y valida adaptación responsive |