import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String selectedOption = 'All';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter by'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Choice(
            value: 'All',
            selected: selectedOption,
            onSelected: (value) {
              selectedOption = value;
              setState(() {
                selectedOption = value;
              });
            },
          ),
          _Choice(
            value: 'Requested',
            selected: selectedOption,
            onSelected: (value) {
              selectedOption = value;
              setState(() {
                selectedOption = value;
              });
            },
          ),
          _Choice(
            value: 'Confirmed',
            selected: selectedOption,
            onSelected: (value) {
              selectedOption = value;
              setState(() {
                selectedOption = value;
              });
            },
          ),
          _Choice(
            value: 'Rejected',
            selected: selectedOption,
            onSelected: (value) {
              selectedOption = value;
              setState(() {
                selectedOption = value;
              });
            },
          ),
        ],
      ),
      actions: const [_OkButton()],
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.value,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String value;
  final String selected;
  final void Function(String onSelected) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value),
      leading: Radio<String>(
        value: value,
        groupValue: selected,
        onChanged: (value) => onSelected(value!),
      ),
    );
  }
}

class _OkButton extends StatelessWidget {
  const _OkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
