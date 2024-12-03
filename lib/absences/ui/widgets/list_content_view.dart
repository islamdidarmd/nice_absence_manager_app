import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';

class ListContentView extends StatelessWidget {
  const ListContentView({
    required this.list,
    required this.itemCount,
    super.key,
  });

  final List<AbsenceListItemModel> list;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return const EmptyView();
    }
    return ListView.builder(
      itemBuilder: (context, index) => _AbsenceListItemView(list[index]),
      itemCount: itemCount,
    );
  }
}

class _AbsenceListItemView extends StatelessWidget {
  const _AbsenceListItemView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleView(absence),
            _DateView(absence),
            _InfoView(absence),
          ],
        ),
      ),
    );
  }
}

class _TitleView extends StatelessWidget {
  const _TitleView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: CachedNetworkImageProvider(absence.picture),
        ),
        const SizedBox(width: 12),
        Text(
          absence.memberName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _DateView extends StatelessWidget {
  const _DateView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(formatDateRange(
          DateTimeRange(start: absence.startDate, end: absence.endDate))),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

class _InfoView extends StatelessWidget {
  const _InfoView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Chip(
              label: Text(_formatStatus(absence.status)),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
            const SizedBox(width: 8),
            Chip(
              label: Text(_formatType(absence.type)),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ],
        ),
        if (absence.memberNote.isNotEmpty)
          Text('Member Note: ${absence.memberNote}'),
        if (absence.admitterNote.isNotEmpty)
          Text('Admitter Note: ${absence.admitterNote}'),
      ],
    );
  }

  String _formatStatus(AbsenceStatus status) {
    return switch (status) {
      AbsenceStatus.requested => 'Requested',
      AbsenceStatus.rejected => 'Rejected',
      AbsenceStatus.confirmed => 'Confirmed',
    };
  }

  String _formatType(AbsenceType type) {
    return switch (type) {
      AbsenceType.vacation => 'Vacation',
      AbsenceType.sickness => 'Sickness',
    };
  }
}
