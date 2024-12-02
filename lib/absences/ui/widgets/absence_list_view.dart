import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView(this.list, {super.key});

  final List<Absence> list;

  @override
  Widget build(BuildContext context) {
    final itemCount = list.length;

    return Column(
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
    return Text('$total absences found');
  }
}

class _AbsenceListItemView extends StatelessWidget {
  const _AbsenceListItemView(this.absence, {super.key});

  final Absence absence;

  @override
  Widget build(BuildContext context) {
    return Text('CrewId: ${absence.crewId}');
  }
}
