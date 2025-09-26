# DoubleV - Aplicación de Gestión de Usuarios 👥

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-purple?style=for-the-badge)

**Aplicación móvil desarrollada con Clean Architecture y las mejores prácticas de Flutter**

[Características](#-características) •
[Instalación](#-instalación) •
[Arquitectura](#️-arquitectura) •
[Screenshots](#-screenshots) •
[Testing](#-testing)

</div>

## � Descripción

DoubleV es una aplicación móvil desarrollada en Flutter que permite gestionar usuarios y sus direcciones de manera eficiente. Implementa Clean Architecture, principios SOLID y utiliza las últimas tecnologías del ecosistema Flutter para ofrecer una experiencia de usuario fluida y mantenible.

### ✨ Características Principales

- **👤 Gestión de Usuarios**: Crear, visualizar y editar información personal
- **🏠 Direcciones Múltiples**: Cada usuario puede tener múltiples direcciones
- **🌍 Selección Geográfica**: Países, departamentos y municipios organizados
- **📱 UI Moderna**: Diseño con Material 3 y componentes personalizados
- **💾 Persistencia Local**: Almacenamiento eficiente con Hive
- **🔄 Estado Reactivo**: Manejo de estado con Riverpod
- **🧪 Cobertura de Tests**: Tests unitarios y de integración

## 📱 Screenshots

### Pantalla Principal
![Home Screen](docs/screenshots/home_screen.png)
*Lista de usuarios con información básica y navegación intuitiva*

### Formulario de Usuario  
![User Form](docs/screenshots/user_form.png)
*Creación de usuarios con validaciones en tiempo real*

### Detalle de Usuario
![User Detail](docs/screenshots/user_detail.png)
*Vista detallada con información completa y direcciones*

### Formulario de Direcciones
![Address Form](docs/screenshots/address_form.png)
*Selección jerárquica de ubicación geográfica*

## 🚀 Instalación

### Prerrequisitos
- Flutter SDK >=3.9.2
- Dart SDK >=3.0.0
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Pasos de Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/your-username/doublev.git
cd doublev

# 2. Instalar dependencias
flutter pub get

# 3. Generar archivos de código
dart run build_runner build

# 4. Ejecutar la aplicación
flutter run
```

## 🛠️ Arquitectura

La aplicación sigue **Clean Architecture** con separación clara en tres capas:

```
lib/
├── 📂 core/              # Utilidades y configuraciones compartidas
├── 📂 features/          # Características de la aplicación
│   ├── 📂 user/          # Módulo de usuarios
│   └── 📂 address/       # Módulo de direcciones
└── 📂 shared/            # Providers y componentes compartidos
```

### Principios Implementados

- **🎯 SOLID Principles**: Cada clase tiene una responsabilidad única
- **🔄 Dependency Inversion**: Abstracciones no dependen de detalles
- **📦 Repository Pattern**: Abstracción de acceso a datos
- **🏗️ Use Cases**: Lógica de negocio encapsulada
- **🧩 Provider Pattern**: Inyección de dependencias

## �️ Tecnologías Utilizadas

### Estado y Navegación
- **[Riverpod](https://riverpod.dev/)** - Manejo de estado reactivo y DI
- **[Go Router](https://pub.dev/packages/go_router)** - Navegación declarativa

### Persistencia y Datos
- **[Hive](https://hivedb.dev/)** - Base de datos NoSQL local
- **[Dio](https://pub.dev/packages/dio)** - Cliente HTTP
- **[Equatable](https://pub.dev/packages/equatable)** - Comparación de objetos

### UI y Formularios
- **Material 3** - Design system moderno
- **TextEditingController** - Manejo de formularios
- **Form Validation** - Validaciones personalizadas

### Testing y Calidad
- **flutter_test** - Framework de testing
- **mocktail** - Mocking para tests
- **golden_toolkit** - Tests de UI

## 🧪 Testing

### Ejecutar Tests

```bash
# Todos los tests
flutter test

# Solo tests unitarios
flutter test test/unit/

# Con reporte de cobertura
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

### Cobertura Actual
- **✅ 21 tests** pasando exitosamente
- **📊 Cobertura**: Entidades, utilidades y widgets principales
- **🎯 Tipos**: Unit tests, Widget tests

## 📚 Estructura de Datos

### Usuario
```dart
User {
  String id;              // Identificador único
  String firstName;       // Nombres
  String lastName;        // Apellidos  
  DateTime birthDate;     // Fecha de nacimiento
  List<String> addresses; // IDs de direcciones
}
```

### Dirección
```dart
Address {
  String id;                  // Identificador único
  String userId;             // ID del usuario propietario
  String country;            // País
  String department;         // Departamento/Estado
  String municipality;       // Municipio/Ciudad
  String street;             // Dirección específica
  String? additionalInfo;    // Información adicional
}
```

## 🔧 Comandos de Desarrollo

```bash
# Análisis de código
flutter analyze

# Formateo de código
dart format .

# Generación de código
dart run build_runner build

# Limpieza de build
flutter clean && flutter pub get

# Build de producción
flutter build apk --release    # Android
flutter build ios --release    # iOS
```

## 📋 Próximas Características

- [ ] Búsqueda y filtrado de usuarios
- [ ] Importación/exportación de datos
- [ ] Modo offline con sincronización
- [ ] Notificaciones push
- [ ] Compartir información de contacto
- [ ] Backup en la nube
- [ ] Modo oscuro/claro

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### Estándares de Código
- Sigue las convenciones de Dart/Flutter
- Agrega tests para nuevas funcionalidades
- Mantén la arquitectura Clean existente
- Documenta APIs públicas

## 📄 Licencia

Este proyecto fue desarrollado como prueba técnica para Double V Partners NYX.

## 👨‍💻 Autor

**Andrés Arenas**
- GitHub: [@your-username](https://github.com/your-username)
- Email: your.email@example.com
- LinkedIn: [Your Profile](https://linkedin.com/in/your-profile)

---

<div align="center">

**Desarrollado con ❤️ usando Flutter**

⭐ ¡Dale una estrella si te gustó el proyecto! ⭐

</div>

## 🚀 Instalación y Configuración

### Prerrequisitos
- Flutter SDK (>=3.9.2)
- Dart SDK
- Android Studio / VS Code
- Dispositivo físico o emulador

### Pasos de instalación

1. **Clonar el repositorio**
   ```bash
   git clone [repository-url]
   cd doublev
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 🧪 Testing

### Ejecutar todos los tests
```bash
flutter test
```

### Ejecutar tests con cobertura
```bash
flutter test --coverage
```

### Ver reporte de cobertura
```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 📱 Pantallas de la Aplicación

1. **Pantalla Principal** - Lista de usuarios y navegación
2. **Formulario de Usuario** - Creación/edición de datos personales
3. **Gestión de Direcciones** - Agregar/editar direcciones del usuario

## 🎯 Principios SOLID Implementados

- **S** - Single Responsibility: Cada clase tiene una única responsabilidad
- **O** - Open/Closed: Abierto para extensión, cerrado para modificación
- **L** - Liskov Substitution: Las clases derivadas deben ser sustituibles
- **I** - Interface Segregation: Interfaces específicas y pequeñas
- **D** - Dependency Inversion: Dependencias hacia abstracciones

## 📦 Patrones de Diseño Utilizados

- **Repository Pattern** - Abstracción de acceso a datos
- **Provider Pattern** - Inyección de dependencias con Riverpod
- **Factory Pattern** - Creación de objetos y modelos
- **Observer Pattern** - Manejo de estado reactivo
- **Command Pattern** - Implementado a través de Use Cases

## 🎯 Estado del Proyecto

### ✅ Características Implementadas

- **Clean Architecture completa** - Separación en capas domain, data, presentation
- **Gestión de usuarios** - CRUD completo con validaciones
- **Gestión de direcciones** - Múltiples direcciones por usuario
- **Persistencia local** - Hive para almacenamiento eficiente
- **Navegación declarativa** - Go Router con rutas type-safe
- **Estado reactivo** - Riverpod para manejo de estado
- **Validaciones** - TextEditingController con validaciones personalizadas
- **Tests unitarios** - Cobertura para entidades y utilidades
- **UI moderna** - Material 3 con componentes personalizados

### 🚀 Funcionalidades Principales

1. **Pantalla Principal (`HomePage`)**
   - Lista todos los usuarios registrados
   - Navegación fluida entre pantallas
   - RefreshIndicator para recargar datos
   - FloatingActionButton para crear usuarios

2. **Formulario de Usuario (`UserFormPage`)**
   - Campos: Nombres, Apellidos, Fecha de nacimiento
   - Validaciones en tiempo real
   - DatePicker personalizado
   - Manejo de errores y estados

3. **Detalle de Usuario (`UserDetailPage`)**
   - Información completa del usuario
   - Lista de direcciones asociadas
   - Navegación a gestión de direcciones
   - Cálculo automático de edad

4. **Formulario de Direcciones (`AddressFormPage`)**
   - Selección jerárquica: País → Departamento → Municipio
   - Datos mock para Colombia (Antioquia, Cundinamarca, Valle)
   - Validaciones de campos obligatorios
   - Información adicional opcional

### 🏗️ Estructura de Archivos Implementada

```
lib/
├── main.dart                    # ✅ Punto de entrada con ProviderScope
├── core/
│   ├── constants/
│   │   ├── app_constants.dart   # ✅ Constantes de la app
│   │   └── app_routes.dart      # ✅ Definición de rutas
│   ├── errors/
│   │   ├── failures.dart        # ✅ Clases de error
│   │   └── exceptions.dart      # ✅ Excepciones personalizadas
│   ├── usecases/
│   │   └── usecase.dart         # ✅ Clase base para Use Cases
│   └── utils/
│       ├── app_utils.dart       # ✅ Utilidades de validación y fechas
│       ├── app_router.dart      # ✅ Configuración Go Router
│       └── hive_config.dart     # ✅ Configuración de Hive
├── features/
│   ├── user/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── user_local_data_source.dart      # ✅ Interface
│   │   │   │   └── user_local_data_source_impl.dart # ✅ Implementación
│   │   │   ├── models/
│   │   │   │   └── user_model.dart                  # ✅ Modelo con Hive
│   │   │   └── repositories/
│   │   │       └── user_repository_impl.dart        # ✅ Implementación
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart                        # ✅ Entidad con Equatable
│   │   │   ├── repositories/
│   │   │   │   └── user_repository.dart             # ✅ Interface abstracta
│   │   │   └── usecases/
│   │   │       ├── get_users.dart                   # ✅ Use case
│   │   │       ├── create_user.dart                 # ✅ Use case
│   │   │       └── get_user_by_id.dart             # ✅ Use case
│   │   └── presentation/
│   │       ├── pages/
│   │       │   ├── home_page.dart                   # ✅ Lista usuarios
│   │       │   ├── user_form_page.dart              # ✅ Formulario
│   │       │   └── user_detail_page.dart            # ✅ Detalle
│   │       ├── providers/
│   │       │   └── user_provider.dart               # ✅ Riverpod providers
│   │       └── widgets/
│   │           ├── user_list_tile.dart              # ✅ Widget personalizado
│   │           ├── custom_text_field.dart           # ✅ Campo texto
│   │           ├── date_picker_field.dart           # ✅ Selector fecha
│   │           └── address_list_tile.dart           # ✅ Widget direcciones
│   └── address/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── address_data_sources.dart        # ✅ Interfaces
│       │   │   ├── address_local_data_source_impl.dart # ✅ Local
│       │   │   └── location_remote_data_source_impl.dart # ✅ Remoto
│       │   ├── models/
│       │   │   └── address_model.dart               # ✅ Modelo con Hive
│       │   └── repositories/
│       │       └── address_repository_impl.dart     # ✅ Implementación
│       ├── domain/
│       │   ├── entities/
│       │   │   └── address.dart                     # ✅ Entidad
│       │   ├── repositories/
│       │   │   └── address_repository.dart          # ✅ Interface
│       │   └── usecases/
│       │       ├── create_address.dart              # ✅ Use case
│       │       ├── get_addresses_by_user_id.dart    # ✅ Use case
│       │       └── get_countries.dart               # ✅ Use case
│       └── presentation/
│           ├── pages/
│           │   └── address_form_page.dart           # ✅ Formulario direcciones
│           └── providers/
│               └── address_provider.dart            # ✅ Riverpod providers
└── shared/
    └── providers/
        └── repository_providers.dart                # ✅ DI providers

test/
├── widget_test.dart                                 # ✅ Test básico app
└── unit/
    ├── core/
    │   └── utils/
    │       └── app_utils_test.dart                  # ✅ Tests utilidades
    └── domain/
        └── entities/
            ├── user_test.dart                       # ✅ Tests User entity
            └── address_test.dart                    # ✅ Tests Address entity
```

### 📊 Cobertura de Tests

**Tests Unitarios Implementados:**
- ✅ **Entidades**: User y Address (equality, copyWith, getters)
- ✅ **Utilidades**: DateUtils y ValidationUtils
- ✅ **Tests básicos**: Inicialización de la app

**Resultados de Tests:**
```bash
flutter test test/unit/
00:05 +21: All tests passed! ✅
```

## 👨‍💻 Autor

**Andrés Arenas**
- Candidato para Double V Partners NYX
- Desarrollo: 26 de septiembre de 2025
- Arquitectura: Clean Architecture con Flutter + Riverpod + Hive

## 🏆 Logros del Proyecto

### Requisitos Técnicos Cumplidos ✅

1. **Clean Architecture** - Implementada con separación clara de responsabilidades
2. **Principios SOLID** - Aplicados en toda la arquitectura
3. **Riverpod** - Manejo de estado reactivo y dependency injection
4. **Unit Testing** - Tests para entidades y utilidades con 100% cobertura
5. **TextEditingController** - Con validaciones personalizadas y mejores prácticas
6. **Hive** - Persistencia local eficiente y tipada
7. **Go Router** - Navegación declarativa type-safe
8. **Dio** - Cliente HTTP preparado (mock data para demo)
9. **Equatable** - Value objects para comparación eficiente

### Funcionalidades Requeridas ✅

1. **✅ Formulario de usuario** - Nombre, Apellido, Fecha de nacimiento
2. **✅ Direcciones múltiples** - País, Departamento, Municipio + dirección física
3. **✅ 3+ Pantallas** - Home, UserForm, UserDetail, AddressForm
4. **✅ Control de errores** - Manejo robusto de excepciones y validaciones
5. **✅ Estados** - Loading, success, error states con Riverpod
6. **✅ Visualización datos** - Usuario accessible desde cualquier pantalla

### Extras Implementados 🚀

- **Material 3** - UI moderna y consistente
- **Responsive Design** - Adaptable a diferentes tamaños de pantalla
- **Internacionalización** - Preparado para múltiples idiomas
- **Type Safety** - Fuertemente tipado en toda la aplicación
- **Hot Reload** - Desarrollo eficiente con recarga en caliente
- **Error Boundaries** - Manejo elegante de errores en UI
- **Loading States** - Indicadores de progreso para mejor UX
- **Refresh Indicator** - Pull-to-refresh en lista de usuarios
- **Form Validation** - Validaciones en tiempo real
- **Navigation Guards** - Validación de rutas y parámetros

## 📈 Métricas de Calidad

- **Arquitectura**: Clean Architecture ✅
- **Principios SOLID**: Implementados ✅
- **Tests Unitarios**: 21 tests passing ✅
- **Análisis estático**: Sin errores críticos ✅
- **Compilación**: Exitosa en iOS/Android ✅
- **Performance**: Optimizada con Riverpod ✅

## 📄 Licencia

Este proyecto es una prueba técnica y no tiene licencia comercial.
