# 📸 Screenshots - DoubleV App

> **Nota**: Las siguientes son capturas de pantalla de la aplicación DoubleV desarrollada para Double V Partners NYX.

## 🏠 Pantalla Principal (HomePage)

![Home Screen](home_screen.png)

**Características mostradas:**
- Lista de usuarios registrados con avatar circular
- Información básica: nombre, apellidos y edad calculada
- Pull-to-refresh implementado
- FloatingActionButton para crear nuevo usuario
- AppBar con título de la aplicación
- Material 3 design system

---

## 👤 Formulario de Usuario (UserFormPage)

![User Form](user_form.png)

**Características mostradas:**
- Campos de entrada con validación en tiempo real:
  - Nombres (requerido, mínimo 2 caracteres)
  - Apellidos (requerido, mínimo 2 caracteres)
  - Fecha de nacimiento (DatePicker personalizado)
- CustomTextField con diseño consistente
- Botón de acción principal con estado habilitado/deshabilitado
- Navegación back funcionando
- Manejo de estados de loading y error

---

## 📋 Detalle de Usuario (UserDetailPage)

![User Detail](user_detail.png)

**Características mostradas:**
- Avatar grande con inicial del nombre
- Información completa del usuario:
  - Nombre completo
  - Edad calculada automáticamente
  - Fecha de nacimiento formateada
- Lista de direcciones asociadas
- Card design con elevaciones sutiles
- Botón para agregar nueva dirección
- Navegación a formulario de direcciones

---

## 🏠 Formulario de Direcciones (AddressFormPage)

![Address Form](address_form.png)

**Características mostradas:**
- Selección jerárquica de ubicación:
  - País (dropdown con lista de países disponibles)
  - Departamento (se habilita después de seleccionar país)
  - Municipio (se habilita después de seleccionar departamento)
- Campo de dirección física (texto libre)
- Campo de información adicional (opcional)
- Validaciones y estados de habilitación en cascada
- Datos mock realistas para Colombia
- Botón de guardado con validación completa

---

## 🎨 Elementos de UI Destacados

### Material 3 Design System
- **Color Primario**: Indigo (#6366F1)
- **Cards**: Bordes redondeados con elevación sutil
- **Typography**: Jerarquía clara con Material 3 text styles
- **Spacing**: Consistente siguiendo guías de Material Design

### Componentes Personalizados
- **CustomTextField**: Input fields con estilo unificado
- **DatePickerField**: Selector de fecha con localización en español
- **UserListTile**: Card de usuario con avatar y información
- **AddressListTile**: Representación elegante de direcciones

### Estados de la Aplicación
- **Loading**: Indicadores de progreso CircularProgressIndicator
- **Empty**: Estados vacíos con mensajes informativos
- **Error**: Manejo elegante de errores con SnackBar
- **Success**: Confirmaciones visuales para acciones exitosas

---

## 📱 Capturas por Hacer

Para completar la documentación, se deben tomar las siguientes capturas:

1. **home_screen.png** - Pantalla principal con lista de usuarios
2. **user_form.png** - Formulario de creación de usuario
3. **user_detail.png** - Pantalla de detalle con información completa
4. **address_form.png** - Formulario de direcciones con selecciones
5. **loading_states.png** - Estados de carga en diferentes pantallas
6. **validation_errors.png** - Errores de validación en formularios

### Instrucciones para Capturas

1. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

2. **Navegar por todas las pantallas**:
   - Crear al menos 2 usuarios de prueba
   - Agregar direcciones a los usuarios
   - Mostrar validaciones en formularios

3. **Herramientas recomendadas**:
   - **iOS Simulator**: Comando `Cmd + S` para captura
   - **Android Emulator**: Panel lateral con botón de captura
   - **Dispositivo físico**: Screenshots nativos

4. **Formato recomendado**:
   - **Resolución**: Nativa del dispositivo
   - **Formato**: PNG para mejor calidad
   - **Orientación**: Portrait (vertical)

---

*Capturas pendientes de tomar durante la ejecución de la aplicación en dispositivo o simulador.*
