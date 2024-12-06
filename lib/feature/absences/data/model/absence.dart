import 'package:dart_mappable/dart_mappable.dart';

part 'absence.mapper.dart';

@MappableClass()
class Absence with AbsenceMappable {
  Absence({
    required this.admitterId,
    required this.admitterNote,
    required this.confirmedAt,
    required this.createdAt,
    required this.crewId,
    required this.endDate,
    required this.id,
    required this.memberNote,
    required this.rejectedAt,
    required this.startDate,
    required this.type,
    required this.userId,
  });

  final int? admitterId;
  final String admitterNote;
  final DateTime? confirmedAt;
  final DateTime createdAt;
  final int crewId;
  final DateTime endDate;
  final int id;
  final String memberNote;
  final DateTime? rejectedAt;
  final DateTime startDate;
  final String type;
  final int userId;

  static const fromMap = AbsenceMapper.fromMap;
  static const fromJson = AbsenceMapper.fromJson;
}
