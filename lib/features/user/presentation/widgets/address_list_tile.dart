import 'package:flutter/material.dart';
import '../../../address/domain/entities/address.dart';

/// Widget para mostrar una dirección en la lista
class AddressListTile extends StatelessWidget {
  const AddressListTile({
    super.key,
    required this.address,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final Address address;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Icon(
            Icons.location_on,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        title: Text(
          address.street,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${address.municipality}, ${address.department}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              address.country,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (address.additionalInfo != null && address.additionalInfo!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                address.additionalInfo!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
        trailing: PopupMenuButton<String>(
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
                child: ListTile(
                  leading: Icon(Icons.edit, size: 20),
                  title: Text('Editar'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            if (onDelete != null)
              const PopupMenuItem(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete, size: 20),
                  title: Text('Eliminar'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
