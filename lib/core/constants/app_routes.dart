/// Rutas de la aplicación
class AppRoutes {
  static const String home = '/';
  static const String userForm = '/user-form';
  static const String userDetail = '/user/:userId';
  static const String addressForm = '/user/:userId/address-form';
  static const String addressDetail = '/user/:userId/address/:addressId';
  
  // Nombres de rutas para go_router
  static const String homeRouteName = 'home';
  static const String userFormRouteName = 'user-form';
  static const String userDetailRouteName = 'user-detail';
  static const String addressFormRouteName = 'address-form';
  static const String addressDetailRouteName = 'address-detail';
}
