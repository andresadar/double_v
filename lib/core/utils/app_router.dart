import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_routes.dart';
import '../../features/user/presentation/pages/home_page.dart';
import '../../features/user/presentation/pages/user_form_page.dart';
import '../../features/user/presentation/pages/user_detail_page.dart';
import '../../features/address/presentation/pages/address_form_page.dart';

/// Configuración de Go Router para la aplicación
class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeRouteName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.userForm,
        name: AppRoutes.userFormRouteName,
        builder: (context, state) {
          final userId = state.extra as String?;
          return UserFormPage(userId: userId);
        },
      ),
      GoRoute(
        path: AppRoutes.userDetail,
        name: AppRoutes.userDetailRouteName,
        builder: (context, state) {
          final userId = state.pathParameters['userId']!;
          return UserDetailPage(userId: userId);
        },
        routes: [
          GoRoute(
            path: 'address-form',
            name: AppRoutes.addressFormRouteName,
            builder: (context, state) {
              final userId = state.pathParameters['userId']!;
              final addressId = state.extra as String?;
              return AddressFormPage(
                userId: userId,
                addressId: addressId,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Página no encontrada',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'La ruta "${state.uri}" no existe',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    ),
  );

  static GoRouter get router => _router;
}
