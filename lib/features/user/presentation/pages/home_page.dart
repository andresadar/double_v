import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/user.dart';
import '../providers/user_provider.dart';
import '../widgets/user_list_tile.dart';
import '../widgets/gradient_background.dart';
import '../widgets/empty_state_widget.dart';

/// Página principal que muestra la lista de usuarios
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersProvider);

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'DoubleV - Usuarios',
            style: AppTypography.headlineSmall.copyWith(
              color: AppColors.grey700,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: usersAsyncValue.when(
          data: (users) {
            if (users.isEmpty) {
              return const EmptyStateWidget(
                icon: Icons.person_off_outlined,
                title: 'No hay usuarios registrados',
                subtitle: 'Toca el botón + para crear tu primer usuario',
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(usersProvider);
              },
              color: AppColors.primary,
              backgroundColor: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      gradient: AppColors.cardGradient,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.cardBorder,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowLight,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: UserListTile(
                      user: user,
                      onTap: () {
                        context.push('/user/${user.id}');
                      },
                      onEdit: () => context.push(AppRoutes.userForm, extra: user.id),
                      onDelete: () => _showDeleteUserConfirmation(context, user, ref),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Cargando usuarios...',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          error: (error, stack) => Center(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.errorBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.error.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error al cargar usuarios',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.grey600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(usersProvider);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              context.push(AppRoutes.userForm);
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            tooltip: 'Crear usuario',
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteUserConfirmation(
    BuildContext context,
    User user,
    WidgetRef ref,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '¿Eliminar usuario?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.error,
          ),
        ),
        content: Text(
          '¿Estás seguro de que quieres eliminar a ${user.fullName}? Esta acción no se puede deshacer.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: AppColors.grey600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (result == true && context.mounted) {
      final deleteNotifier = ref.read(deleteUserProvider.notifier);
      await deleteNotifier.deleteUser(user.id);
      
      // Mostrar mensaje de éxito
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${user.fullName} eliminado correctamente'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }
}
