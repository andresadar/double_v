import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/errors/exceptions.dart';
import 'address_data_sources.dart';

/// Implementación de LocationRemoteDataSource usando archivos JSON mock
/// Lee datos realistas desde assets/data/countries.json
/// En una implementación real, esto consultaría APIs de países/departamentos
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  const LocationRemoteDataSourceImpl();

  @override
  Future<List<String>> getCountries() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/countries.json');
      final List<dynamic> countriesData = json.decode(jsonString);
      
      return countriesData.map<String>((country) => country['name'] as String).toList();
    } catch (e) {
      throw ServerException('Error loading countries: $e');
    }
  }

  @override
  Future<List<String>> getDepartments(String countryName) async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/countries.json');
      final List<dynamic> countriesData = json.decode(jsonString);
      
      final country = countriesData.firstWhere(
        (c) => c['name'] == countryName,
        orElse: () => null,
      );
      
      if (country == null) {
        throw ServerException('Country not found: $countryName');
      }
      
      final List<dynamic> departments = country['departments'] ?? [];
      return departments.map<String>((dept) => dept['name'] as String).toList();
    } catch (e) {
      throw ServerException('Error loading departments: $e');
    }
  }

  @override
  Future<List<String>> getMunicipalities(String countryName, String departmentName) async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/countries.json');
      final List<dynamic> countriesData = json.decode(jsonString);
      
      final country = countriesData.firstWhere(
        (c) => c['name'] == countryName,
        orElse: () => null,
      );
      
      if (country == null) {
        throw ServerException('Country not found: $countryName');
      }
      
      final List<dynamic> departments = country['departments'] ?? [];
      final department = departments.firstWhere(
        (d) => d['name'] == departmentName,
        orElse: () => null,
      );
      
      if (department == null) {
        throw ServerException('Department not found: $departmentName');
      }
      
      final List<dynamic> municipalities = department['municipalities'] ?? [];
      return municipalities.map<String>((muni) => muni['name'] as String).toList();
    } catch (e) {
      throw ServerException('Error loading municipalities: $e');
    }
  }
}
