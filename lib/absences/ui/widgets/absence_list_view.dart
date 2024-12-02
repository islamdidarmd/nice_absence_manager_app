import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView(this.list, {super.key});

  final List<AbsenceListItemModel> list;

  @override
  Widget build(BuildContext context) {
    final itemCount = list.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TotalView(itemCount),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => _AbsenceListItemView(list[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: itemCount,
          ),
        )
      ],
    );
  }
}

class _TotalView extends StatelessWidget {
  const _TotalView(this.total, {super.key});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Text(
        'Total Absence: $total',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class _AbsenceListItemView extends StatelessWidget {
  const _AbsenceListItemView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${absence.memeberName}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(absence.type)),
              Chip(label: Text(absence.status)),
            ],
          ),
          Chip(
              label: Text(
                  '${_formatDateTime(absence.startDate)} - ${_formatDateTime(absence.endDate)}')),

          if (absence.memberNote.isNotEmpty) Text(absence.memberNote),
          if (absence.admitterNote.isNotEmpty) Text(absence.admitterNote),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime time) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(time);
  }
}
