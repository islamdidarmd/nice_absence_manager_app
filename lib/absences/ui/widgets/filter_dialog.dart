import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/type_filter.dart';

class TypeFilterDialog extends StatelessWidget {
  const TypeFilterDialog(this.selectedOption, {super.key});

  final TypeFilter selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter by Type'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Choice(
            text: 'All',
            value: TypeFilter.all,
            selected: selectedOption,
            onSelected: (value) {
              context.read<AbsenceListCubit>().filterAbsenceListByType(value);
              Navigator.of(context).pop();
            },
          ),
          _Choice(
            text: 'Sickness',
            value: TypeFilter.sickness,
            selected: selectedOption,
            onSelected: (value) {
              context.read<AbsenceListCubit>().filterAbsenceListByType(value);
              Navigator.of(context).pop();
            },
          ),
          _Choice(
            text: 'Vacation',
            value: TypeFilter.vacation,
            selected: selectedOption,
            onSelected: (value) {
              context.read<AbsenceListCubit>().filterAbsenceListByType(value);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.text,
    required this.value,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String text;
  final TypeFilter value;
  final TypeFilter selected;
  final void Function(TypeFilter onSelected) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Radio<TypeFilter>(
        value: value,
        groupValue: selected,
        onChanged: (value) => onSelected(value!),
      ),
    );
  }
}
