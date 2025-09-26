import 'package:flutter/material.dart';
import '../../../../core/utils/app_utils.dart' as app_utils;

/// Widget personalizado para seleccionar fechas
class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.selectedDate,
    required this.onDateSelected,
    this.validator,
    this.enabled = true,
    this.firstDate,
    this.lastDate,
  });

  final String labelText;
  final String? hintText;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;
  final String? Function(DateTime?)? validator;
  final bool enabled;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: selectedDate,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: enabled ? () => _selectDate(context, field) : null,
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  filled: true,
                  fillColor: enabled 
                      ? Theme.of(context).colorScheme.surface 
                      : Theme.of(context).disabledColor.withOpacity(0.1),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  errorText: field.errorText,
                ),
                child: Text(
                  selectedDate != null 
                      ? app_utils.DateUtils.dateToString(selectedDate!) 
                      : hintText ?? 'Selecciona una fecha',
                  style: TextStyle(
                    color: selectedDate != null 
                        ? Theme.of(context).textTheme.bodyLarge?.color
                        : Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, FormFieldState<DateTime> field) async {
    final initialDate = selectedDate ?? DateTime.now();
    final first = firstDate ?? DateTime(1900);
    final last = lastDate ?? DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(first) || initialDate.isAfter(last)
          ? last
          : initialDate,
      firstDate: first,
      lastDate: last,
      locale: const Locale('es', 'ES'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      field.didChange(pickedDate);
      onDateSelected(pickedDate);
    }
  }
}
