import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/filter_dialog.dart';

class ListTitleView extends StatelessWidget {
  const ListTitleView(this.total, this.filter, {super.key});

  final int total;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TotalView(total: total, filter: filter),
          const Spacer(),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => FilterDialog(),
                );
              },
              icon: const Icon(Icons.filter_list)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt))
        ],
      ),
    );
  }
}

class _TotalView extends StatelessWidget {
  const _TotalView({
    super.key,
    required this.total,
    required this.filter,
  });

  final int total;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Absence: $total',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Filter: $filter',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
