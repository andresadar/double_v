import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';
import '../../features/user/data/models/user_model.dart';
import '../../features/address/data/models/address_model.dart';

/// Configuración e inicialización de Hive
class HiveConfig {
  /// Inicializa Hive y registra los adaptadores
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Registrar adaptadores
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    
    // Abrir las cajas
    await Hive.openBox<UserModel>(AppConstants.userBoxName);
    await Hive.openBox<AddressModel>(AppConstants.addressBoxName);
  }
  
  /// Cierra todas las cajas de Hive
  static Future<void> closeBoxes() async {
    await Hive.close();
  }
  
  /// Limpia todas las cajas (útil para testing)
  static Future<void> clearAllBoxes() async {
    final userBox = Hive.box<UserModel>(AppConstants.userBoxName);
    final addressBox = Hive.box<AddressModel>(AppConstants.addressBoxName);
    
    await userBox.clear();
    await addressBox.clear();
  }
  
  /// Obtiene la caja de usuarios
  static Box<UserModel> getUserBox() {
    return Hive.box<UserModel>(AppConstants.userBoxName);
  }
  
  /// Obtiene la caja de direcciones
  static Box<AddressModel> getAddressBox() {
    return Hive.box<AddressModel>(AppConstants.addressBoxName);
  }
}
