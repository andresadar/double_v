# 🚀 Guía de Configuración y Uso - DoubleV

## 📋 Requisitos Previos

- **Flutter SDK**: >= 3.9.2
- **Dart SDK**: >= 3.0.0
- **IDE**: VS Code, Android Studio o IntelliJ
- **Dispositivos**: iOS Simulator, Android Emulator o dispositivo físico

## ⚡ Instalación Rápida

```bash
# 1. Clonar el repositorio
git clone <repository-url>
cd doublev

# 2. Instalar dependencias
flutter pub get

# 3. Generar archivos de Hive
dart run build_runner build

# 4. Ejecutar la aplicación
flutter run
```

## 🎯 Flujo de Uso de la Aplicación

### 1. Pantalla Principal (HomePage)
- **Ruta**: `/`
- **Funcionalidad**: 
  - Lista todos los usuarios registrados
  - Pull-to-refresh para recargar
  - Tap en usuario para ver detalles
  - FAB "+" para crear nuevo usuario

### 2. Crear Usuario (UserFormPage)
- **Ruta**: `/user-form`
- **Campos requeridos**:
  - **Nombres**: Mínimo 2 caracteres, solo letras
  - **Apellidos**: Mínimo 2 caracteres, solo letras  
  - **Fecha de nacimiento**: No puede ser futura, después de 1900
- **Validaciones**: En tiempo real mientras escribes
- **Navegación**: Automática a home después de crear

### 3. Detalle de Usuario (UserDetailPage)
- **Ruta**: `/user/:userId`
- **Información mostrada**:
  - Avatar con inicial del nombre
  - Nombre completo y edad calculada
  - Fecha de nacimiento formateada
  - Lista de direcciones asociadas
- **Acciones**:
  - Editar usuario (botón en AppBar)
  - Agregar nueva dirección
  - Ver/editar direcciones existentes

### 4. Crear Dirección (AddressFormPage)
- **Ruta**: `/user/:userId/address-form`
- **Flujo de selección**:
  1. **País**: Lista de países disponibles
  2. **Departamento**: Se habilita después de seleccionar país
  3. **Municipio**: Se habilita después de seleccionar departamento
  4. **Dirección**: Campo libre (mín. 5 caracteres)
  5. **Info adicional**: Opcional (apartamento, etc.)

## 🔧 Comandos de Desarrollo

```bash
# Análisis de código
flutter analyze

# Ejecutar tests unitarios
flutter test test/unit/

# Ejecutar todos los tests
flutter test

# Generar coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Ejecutar con hot reload
flutter run

# Build para producción
flutter build apk          # Android
flutter build ios          # iOS
flutter build web          # Web
```

## 🧪 Testing

### Tests Implementados

```bash
test/
├── widget_test.dart                 # Test básico de la app
└── unit/
    ├── core/
    │   └── utils/
    │       └── app_utils_test.dart  # Tests de utilidades
    └── domain/
        └── entities/
            ├── user_test.dart       # Tests de entidad User
            └── address_test.dart    # Tests de entidad Address
```

### Ejecutar Tests

```bash
# Solo tests unitarios
flutter test test/unit/

# Test específico
flutter test test/unit/domain/entities/user_test.dart

# Con output detallado
flutter test --reporter=expanded
```

## 🗂️ Estructura de Datos

### Usuario
```dart
User {
  id: String,           // UUID generado automáticamente
  firstName: String,    // Nombres
  lastName: String,     // Apellidos
  birthDate: DateTime,  // Fecha de nacimiento
  addresses: List<String> // IDs de direcciones asociadas
}
```

### Dirección
```dart
Address {
  id: String,              // UUID generado automáticamente
  userId: String,          // ID del usuario propietario
  country: String,         // País seleccionado
  department: String,      // Departamento/Estado
  municipality: String,    // Municipio/Ciudad
  street: String,          // Dirección completa
  additionalInfo: String?  // Info adicional (opcional)
}
```

## 🎨 Personalización de UI

### Tema
- **Material 3**: Design system moderno
- **Color primario**: Indigo (#6366F1)
- **Componentes**: Cards con bordes redondeados
- **Elevaciones**: Sutiles para profundidad
- **Typography**: Hierarchy clara

### Widgets Personalizados
- **CustomTextField**: Campo de texto consistente
- **DatePickerField**: Selector de fechas en español
- **UserListTile**: Tarjeta de usuario con avatar
- **AddressListTile**: Tarjeta de dirección con menú

## 🚨 Manejo de Errores

### Tipos de Error
- **ValidationFailure**: Errores de validación
- **CacheFailure**: Problemas con Hive
- **ServerFailure**: Errores de red (futuro)
- **NotFoundException**: Recursos no encontrados

### Estados de Loading
- **AsyncValue.loading**: Indicadores de progreso
- **AsyncValue.error**: Pantallas de error elegantes
- **AsyncValue.data**: Contenido exitoso

## 📱 Compatibilidad

### Plataformas Soportadas
- ✅ **iOS**: 11.0+
- ✅ **Android**: API 21+ (Android 5.0)
- ✅ **Web**: Browsers modernos
- ✅ **Desktop**: Windows, macOS, Linux (experimental)

### Orientaciones
- ✅ **Portrait**: Optimizada
- ✅ **Landscape**: Funcional

## 🔐 Seguridad y Privacidad

- **Datos locales**: Almacenados solo en el dispositivo
- **Sin conexión**: No se envían datos a servidores externos
- **Validaciones**: Input sanitization en todos los campos
- **Type safety**: Fuertemente tipado para prevenir errores

## 🤝 Contribución

### Agregar Nueva Feature
1. Crear branch: `feature/nueva-funcionalidad`
2. Seguir Clean Architecture
3. Agregar tests unitarios
4. Verificar con `flutter analyze`
5. Crear PR con descripción detallada

### Reportar Bugs
1. Reproducir el error
2. Incluir logs de Flutter
3. Especificar dispositivo/versión
4. Pasos para reproducir

---

**Desarrollado con ❤️ por Andrés Arenas para Double V Partners NYX**
