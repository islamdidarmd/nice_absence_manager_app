import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';

class ListContentView extends StatefulWidget {
  const ListContentView({
    required this.list,
    required this.itemCount,
    super.key,
  });

  final List<AbsenceListItemModel> list;
  final int itemCount;

  @override
  State<ListContentView> createState() => _ListContentViewState();
}

class _ListContentViewState extends State<ListContentView> {
  final _scrollController = ScrollController();
  final _preloadPixels = 200;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenToScrollChange);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenToScrollChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const EmptyView();
    }
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) => _AbsenceListItemView(widget.list[index]),
      itemCount: widget.itemCount,
    );
  }

  void _listenToScrollChange() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - _preloadPixels) {
      context.read<AbsenceListCubit>().loadMore();
    }
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
