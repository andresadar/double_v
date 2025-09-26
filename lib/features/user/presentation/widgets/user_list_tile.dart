import 'package:flutter/material.dart';
import '../../../../core/utils/app_utils.dart' as app_utils;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/user.dart';

/// Widget para mostrar un usuario en la lista con diseño moderno
class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final User user;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Avatar con gradiente
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    user.firstName[0].toUpperCase(),
                    style: AppTypography.headlineSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Información del usuario
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.grey700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.cake_outlined,
                          size: 16,
                          color: AppColors.grey500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${user.age} años',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.grey500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: AppColors.grey500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          app_utils.DateUtils.dateToString(user.birthDate),
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.grey500,
                          ),
                        ),
                      ],
                    ),
                    if (user.addresses.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${user.addresses.length} dirección${user.addresses.length > 1 ? 'es' : ''}',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Menú de opciones o flecha indicadora
              if (onEdit != null || onDelete != null)
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit' && onEdit != null) {
                      onEdit!();
                    } else if (value == 'delete' && onDelete != null) {
                      onDelete!();
                    }
                  },
                  itemBuilder: (context) => [
                    if (onEdit != null)
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 20),
                            SizedBox(width: 12),
                            Text('Editar'),
                          ],
                        ),
                      ),
                    if (onDelete != null)
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 20, color: Colors.red),
                            SizedBox(width: 12),
                            Text('Eliminar', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                  ],
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: AppColors.grey600,
                    ),
                  ),
                )
              else
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.grey600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
