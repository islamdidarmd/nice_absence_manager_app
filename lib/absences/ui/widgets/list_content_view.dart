import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/mapper/absence_mapper.dart';
import 'package:nice_absence_manager_app/absences/ui/mapper/filter_mapper.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';
import 'package:nice_absence_manager_app/core/adaptive_size.dart';
import 'package:nice_absence_manager_app/core/spacing.dart';

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
  final _bufferedPixelCount = 200;

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

    return LayoutBuilder(
      builder: (_, constraints) {
        final gridSize = getAdaptiveGridSize(constraints.maxWidth);
        if (gridSize.columnCount > 0) {
          return _ContentGridView(
            gridSize: gridSize,
            scrollController: _scrollController,
            widget: widget,
          );
        } else {
          return _ContentListView(
              scrollController: _scrollController, widget: widget);
        }
      },
    );
  }

  void _listenToScrollChange() {
    final shouldPreload = _scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - _bufferedPixelCount;
    if (shouldPreload) {
      context.read<AbsenceListCubit>().loadMore();
    }
  }
}

class _ContentListView extends StatelessWidget {
  const _ContentListView({
    required ScrollController scrollController,
    required this.widget,
    super.key,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final ListContentView widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (_, index) => _AbsenceItemView(widget.list[index]),
      itemCount: widget.itemCount,
    );
  }
}

class _ContentGridView extends StatelessWidget {
  const _ContentGridView({
    required this.gridSize,
    required ScrollController scrollController,
    required this.widget,
    super.key,
  }) : _scrollController = scrollController;

  final AdaptiveGridSize gridSize;
  final ScrollController _scrollController;
  final ListContentView widget;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSize.columnCount,
        childAspectRatio: gridSize.aspectRatio,
      ),
      controller: _scrollController,
      itemBuilder: (_, index) => _AbsenceItemView(widget.list[index]),
      itemCount: widget.itemCount,
    );
  }
}

class _AbsenceItemView extends StatelessWidget {
  const _AbsenceItemView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final box = context.findRenderObject() as RenderBox?;
        final sharePosition = box!.localToGlobal(Offset.zero) & box.size;
        context.read<AbsenceListCubit>().shareICal(
              absence,
              sharePosition,
            );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleView(absence),
              const SizedBox(height: xSmall),
              _DateView(absence),
              const SizedBox(height: xSmall),
              _InfoView(absence),
            ],
          ),
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
        const SizedBox(width: medium),
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
      label: Text(mapFilterDateRangeToString(
          DateTimeRange(start: absence.startDate, end: absence.endDate))),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class _InfoView extends StatelessWidget {
  const _InfoView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    final bgColorImportant = Theme.of(context).colorScheme.secondaryContainer;
    Color bgColorHighLight;
    if (absence.status == AbsenceStatus.rejected) {
      bgColorHighLight = Theme.of(context).colorScheme.errorContainer;
    } else {
      bgColorHighLight = Theme.of(context).colorScheme.primaryContainer;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Chip(
              label: Text(mapStatusToString(absence.status)),
              backgroundColor: bgColorHighLight,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: small),
            Chip(
              label: Text(mapTypeToString(absence.type)),
              backgroundColor: bgColorImportant,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        ..._getNoteView(),
      ],
    );
  }

  List<Widget> _getNoteView() {
    final optionalInfo = <Widget>[];
    if (absence.memberNote.isNotEmpty) {
      optionalInfo.add(
        Text(
          'Member Note: ${absence.memberNote}',
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    if (absence.admitterNote.isNotEmpty) {
      optionalInfo.add(
        Text('Admitter Note: ${absence.admitterNote}',
            overflow: TextOverflow.ellipsis),
      );
    }
    return optionalInfo;
  }
}
