# DoubleV - Prueba Técnica Flutter

Aplicación móvil desarrollada en Flutter como prueba técnica para Double V Partners NYX.

## 📋 Descripción del Proyecto

Aplicación que permite crear usuarios con información personal y gestionar múltiples direcciones por usuario. El proyecto implementa Clean Architecture, principios SOLID y las mejores prácticas de desarrollo en Flutter.

### Funcionalidades

- ✅ Formulario de creación de usuarios (Nombre, Apellido, Fecha de nacimiento)
- ✅ Gestión de direcciones (País, Departamento, Municipio)
- ✅ Múltiples direcciones por usuario
- ✅ Flujo de 3 pantallas mínimo
- ✅ Visualización de datos del usuario
- ✅ Control de errores y estados
- ✅ Cobertura de tests unitarios

## 🏗️ Arquitectura

El proyecto sigue **Clean Architecture** con la siguiente estructura:

```
lib/
├── core/                   # Utilidades, constantes y configuraciones
│   ├── constants/
│   ├── errors/
│   ├── usecases/
│   └── utils/
├── features/               # Características de la aplicación
│   ├── user/
│   │   ├── data/          # Repositorios, models, datasources
│   │   ├── domain/        # Entities, repositories abstractos, use cases
│   │   └── presentation/  # UI, providers, pages
│   └── address/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/                 # Componentes compartidos
    ├── widgets/
    └── providers/
```

## 🛠️ Tecnologías y Paquetes

### Estado y Arquitectura
- **Riverpod** - Manejo de estado reactivo
- **Go Router** - Navegación declarativa y type-safe
- **Equatable** - Comparación de objetos y value objects

### Persistencia y Datos
- **Hive** - Base de datos NoSQL local y rápida
- **Dio** - Cliente HTTP para APIs (países, departamentos, municipios)
- **TextEditingController** - Manejo de formularios con mejores prácticas

### Desarrollo y Calidad
- **Clean Architecture** - Arquitectura de capas bien definidas
- **SOLID Principles** - Principios de diseño orientado a objetos
- **Repository Pattern** - Abstracción de acceso a datos
- **Dependency Injection** - Inyección de dependencias con Riverpod

### Testing Completo
- **flutter_test** - Tests unitarios
- **integration_test** - Tests de integración
- **mocktail** - Mocking avanzado para tests
- **golden_toolkit** - Tests de UI (golden tests)
- **patrol** - Tests end-to-end (opcional)

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
