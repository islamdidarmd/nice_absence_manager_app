import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/heading_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/list_content_view.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView({
    required this.totalItemCount,
    required this.list,
    required this.typeFilter,
    required this.dateFilter,
    super.key,
  });

  final int totalItemCount;
  final List<AbsenceListItemModel> list;
  final TypeFilter typeFilter;
  final DateTimeRange? dateFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingView(
          total: totalItemCount,
          typeFilter: typeFilter,
          dateFilter: dateFilter,
        ),
        Expanded(
          child: ListContentView(list: list, itemCount: list.length),
        )
      ],
    );
  }
}
