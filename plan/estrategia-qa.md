# Estrategia de QA - Opcion Yo

## 1. ¿Por dónde comenzar y por qué?

Se adopta un enfoque de **pruebas basadas en riesgos (Risk-Based Testing)**, priorizando las funcionalidades cuyo fallo tendría mayor impacto para el negocio.

| Prioridad | Flujo | Justificación |
|-----------|-------|---------------|
| 1 | Autenticación | Habilita el acceso al resto de funcionalidades. |
| 2 | Agendamiento | Es el núcleo funcional de la aplicación. |
| 3 | Pagos | Impacto económico y alta criticidad. |
| 4 | Videollamadas | Mayor complejidad técnica por depender de hardware, navegador y red. |

---

## 2. Herramientas seleccionadas

| Capa                      | Herramienta    | Justificación                                                                                                                          |
|---------------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Mock de servicios         | Mockoon        | Permite aislar dependencias externas y generar escenarios repetibles.                                                                  |
| Pruebas API Manual        | Postman        | Permite validar endpoints de forma manual antes de automatizar el escenario y probar que el API funciona según las reglas del negocio. |
| Pruebas API e integración | Karate         | Automatización legible, validación de contratos e integración con CI.                                                                  |
| Navegador (AWS Chime)     | Playwright     | Simulación de permisos y comportamiento del navegador.                                                                                 |
| Integración Continua      | GitHub Actions | Ejecución automática de la suite de pruebas en cada cambio.                                                                            |

---

## 3. Estrategia de validación

- Validar primero la lógica de negocio mediante pruebas de API.
- Aislar servicios externos (Stripe y AWS Chime) utilizando mocks y el modo Sandbox.
- Automatizar únicamente los flujos críticos de negocio.
- Complementar con pruebas exploratorias para identificar escenarios no previstos.

---

## 4. Criterios para liberar a producción

Una funcionalidad se considera lista para producción cuando:

- Todos los casos críticos pasan correctamente.
- No existen defectos críticos o altos pendientes.
- La suite de regresión finaliza satisfactoriamente.
- Las validaciones de autenticación, autorización y contratos son exitosas.
- El pipeline de CI finaliza sin errores.

---

## Flujo de la estrategia

```text
Autenticación
      ↓
Agendamiento
      ↓
Pagos
      ↓
Videollamadas
      ↓
Regresión
      ↓
CI/CD
      ↓
Producción
```