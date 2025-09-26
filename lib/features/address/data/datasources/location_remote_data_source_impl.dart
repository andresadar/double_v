import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import 'address_data_sources.dart';

/// Implementación de LocationRemoteDataSource usando Dio
/// Para efectos de la prueba, usaremos datos mock
/// En una implementación real, esto consultaría APIs de países/departamentos
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  const LocationRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<String>> getCountries() async {
    try {
      // Mock data para la prueba técnica
      // En una implementación real, esto haría una llamada HTTP
      await Future.delayed(const Duration(milliseconds: 500)); // Simula latencia
      
      return [
        'Colombia',
        'Argentina',
        'México',
        'Perú',
        'Chile',
        'Ecuador',
        'Venezuela',
        'Brasil',
      ];
    } catch (e) {
      throw ServerException('Error al obtener países: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> getDepartments(String country) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // Simula latencia
      
      // Mock data basado en el país seleccionado
      switch (country) {
        case 'Colombia':
          return [
            'Antioquia',
            'Cundinamarca',
            'Valle del Cauca',
            'Atlántico',
            'Santander',
            'Bolívar',
            'Norte de Santander',
            'Córdoba',
            'Tolima',
            'Meta',
          ];
        case 'Argentina':
          return [
            'Buenos Aires',
            'Córdoba',
            'Santa Fe',
            'Mendoza',
            'Tucumán',
            'Entre Ríos',
            'Salta',
            'Chaco',
          ];
        case 'México':
          return [
            'Ciudad de México',
            'Estado de México',
            'Jalisco',
            'Nuevo León',
            'Puebla',
            'Guanajuato',
            'Veracruz',
            'Michoacán',
          ];
        default:
          return [
            'Departamento 1',
            'Departamento 2',
            'Departamento 3',
          ];
      }
    } catch (e) {
      throw ServerException('Error al obtener departamentos: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> getMunicipalities(String country, String department) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // Simula latencia
      
      // Mock data basado en el departamento seleccionado
      if (country == 'Colombia') {
        switch (department) {
          case 'Antioquia':
            return [
              'Medellín',
              'Bello',
              'Itagüí',
              'Envigado',
              'Apartadó',
              'Turbo',
              'Rionegro',
              'Sabaneta',
            ];
          case 'Cundinamarca':
            return [
              'Bogotá',
              'Soacha',
              'Girardot',
              'Zipaquirá',
              'Facatativá',
              'Chía',
              'Mosquera',
              'Fusagasugá',
            ];
          case 'Valle del Cauca':
            return [
              'Cali',
              'Palmira',
              'Buenaventura',
              'Cartago',
              'Buga',
              'Tuluá',
              'Jamundí',
            ];
          default:
            return [
              'Municipio 1',
              'Municipio 2',
              'Municipio 3',
            ];
        }
      }
      
      // Para otros países, devolvemos datos genéricos
      return [
        'Municipio A',
        'Municipio B',
        'Municipio C',
        'Municipio D',
      ];
    } catch (e) {
      throw ServerException('Error al obtener municipios: ${e.toString()}');
    }
  }
}
