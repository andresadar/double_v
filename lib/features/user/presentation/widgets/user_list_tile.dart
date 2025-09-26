import 'package:flutter/material.dart';
import '../../../../core/utils/app_utils.dart' as app_utils;
import '../../domain/entities/user.dart';

/// Widget para mostrar un usuario en la lista
class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            user.firstName[0].toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.fullName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Edad: ${user.age} años',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Fecha de nacimiento: ${app_utils.DateUtils.dateToString(user.birthDate)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (user.addresses.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                '${user.addresses.length} dirección${user.addresses.length > 1 ? 'es' : ''}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
