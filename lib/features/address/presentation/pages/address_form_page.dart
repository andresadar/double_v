import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../user/presentation/widgets/custom_text_field.dart';
import '../providers/address_provider.dart';

/// Página para crear o editar direcciones
class AddressFormPage extends ConsumerStatefulWidget {
  const AddressFormPage({
    super.key,
    required this.userId,
    this.addressId,
  });

  final String userId;
  final String? addressId; // null = crear, no null = editar

  @override
  ConsumerState<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends ConsumerState<AddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _additionalInfoController = TextEditingController();
  
  String? _selectedCountry;
  String? _selectedDepartment;
  String? _selectedMunicipality;

  @override
  void dispose() {
    _streetController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(addressFormProvider);
    final countriesAsyncValue = ref.watch(countriesProvider);
    
    // Escuchar cambios de estado para navegar cuando se complete
    ref.listen(addressFormProvider, (previous, next) {
      if (next.isSuccess && previous?.isSuccess != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dirección creada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/user/${widget.userId}');
      } else if (next.errorMessage != null && previous?.errorMessage != next.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.addressId != null ? 'Editar Dirección' : 'Nueva Dirección'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Selector de País
                countriesAsyncValue.when(
                  data: (countries) => DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    decoration: InputDecoration(
                      labelText: 'País',
                      prefixIcon: const Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: countries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                        _selectedDepartment = null;
                        _selectedMunicipality = null;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El país es obligatorio';
                      }
                      return null;
                    },
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error al cargar países: $error'),
                ),
                const SizedBox(height: 16),
                // Selector de Departamento
                _buildDepartmentDropdown(),
                const SizedBox(height: 16),
                // Selector de Municipio
                _buildMunicipalityDropdown(),
                const SizedBox(height: 16),
                // Campo de dirección
                CustomTextField(
                  controller: _streetController,
                  labelText: 'Dirección',
                  hintText: 'Ej: Carrera 10 # 20-30',
                  prefixIcon: Icons.location_on_outlined,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'La dirección es obligatoria';
                    }
                    if (value.trim().length < 5) {
                      return 'La dirección debe tener al menos 5 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Campo de información adicional
                CustomTextField(
                  controller: _additionalInfoController,
                  labelText: 'Información adicional (opcional)',
                  hintText: 'Ej: Apartamento 201, Edificio Torre A',
                  prefixIcon: Icons.info_outline,
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: formState.isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: formState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          widget.addressId != null ? 'Actualizar Dirección' : 'Crear Dirección',
                          style: const TextStyle(fontSize: 16),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentDropdown() {
    if (_selectedCountry == null) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Departamento',
          prefixIcon: const Icon(Icons.location_city),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: const [],
        onChanged: null,
        validator: (value) => 'Primero selecciona un país',
      );
    }

    // Aquí deberías llamar al provider correspondiente para departamentos
    // Para efectos de la demo, usamos datos mock
    final departments = _getMockDepartments(_selectedCountry!);
    
    return DropdownButtonFormField<String>(
      value: _selectedDepartment,
      decoration: InputDecoration(
        labelText: 'Departamento',
        prefixIcon: const Icon(Icons.location_city),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: departments.map((department) {
        return DropdownMenuItem(
          value: department,
          child: Text(department),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedDepartment = value;
          _selectedMunicipality = null;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El departamento es obligatorio';
        }
        return null;
      },
    );
  }

  Widget _buildMunicipalityDropdown() {
    if (_selectedCountry == null || _selectedDepartment == null) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Municipio',
          prefixIcon: const Icon(Icons.location_on),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: const [],
        onChanged: null,
        validator: (value) => 'Primero selecciona un departamento',
      );
    }

    // Aquí deberías llamar al provider correspondiente para municipios
    // Para efectos de la demo, usamos datos mock
    final municipalities = _getMockMunicipalities(_selectedCountry!, _selectedDepartment!);
    
    return DropdownButtonFormField<String>(
      value: _selectedMunicipality,
      decoration: InputDecoration(
        labelText: 'Municipio',
        prefixIcon: const Icon(Icons.location_on),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: municipalities.map((municipality) {
        return DropdownMenuItem(
          value: municipality,
          child: Text(municipality),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedMunicipality = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El municipio es obligatorio';
        }
        return null;
      },
    );
  }

  List<String> _getMockDepartments(String country) {
    switch (country) {
      case 'Colombia':
        return ['Antioquia', 'Cundinamarca', 'Valle del Cauca', 'Atlántico'];
      default:
        return ['Departamento 1', 'Departamento 2', 'Departamento 3'];
    }
  }

  List<String> _getMockMunicipalities(String country, String department) {
    if (country == 'Colombia') {
      switch (department) {
        case 'Antioquia':
          return ['Medellín', 'Bello', 'Itagüí', 'Envigado'];
        case 'Cundinamarca':
          return ['Bogotá', 'Soacha', 'Zipaquirá', 'Chía'];
        default:
          return ['Municipio 1', 'Municipio 2'];
      }
    }
    return ['Municipio A', 'Municipio B'];
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref.read(addressFormProvider.notifier).createAddress(
        userId: widget.userId,
        country: _selectedCountry!,
        department: _selectedDepartment!,
        municipality: _selectedMunicipality!,
        street: _streetController.text.trim(),
        additionalInfo: _additionalInfoController.text.trim().isNotEmpty 
            ? _additionalInfoController.text.trim() 
            : null,
      );
    }
  }
}
