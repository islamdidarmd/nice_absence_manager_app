import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/list_content_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/list_title_view.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView({
    required this.totalItemCoint,
    required this.list,
    required this.typeFilter,
    required this.dateFilter,
    super.key,
  });

  final int totalItemCoint;
  final List<AbsenceListItemModel> list;
  final String typeFilter;
  final String dateFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitleView(
          total: totalItemCoint,
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
