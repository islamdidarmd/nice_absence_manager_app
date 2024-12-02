import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/filter_dialog.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_alt),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => FilterDialog(),
        );
      },
    );
  }
}
