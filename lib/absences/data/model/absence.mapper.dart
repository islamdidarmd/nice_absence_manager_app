// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'absence.dart';

class AbsenceMapper extends ClassMapperBase<Absence> {
  AbsenceMapper._();

  static AbsenceMapper? _instance;
  static AbsenceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AbsenceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Absence';

  static int? _$admitterId(Absence v) => v.admitterId;
  static const Field<Absence, int> _f$admitterId =
      Field('admitterId', _$admitterId);
  static String _$admitterNote(Absence v) => v.admitterNote;
  static const Field<Absence, String> _f$admitterNote =
      Field('admitterNote', _$admitterNote);
  static DateTime? _$confirmedAt(Absence v) => v.confirmedAt;
  static const Field<Absence, DateTime> _f$confirmedAt =
      Field('confirmedAt', _$confirmedAt);
  static DateTime _$createdAt(Absence v) => v.createdAt;
  static const Field<Absence, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static int _$crewId(Absence v) => v.crewId;
  static const Field<Absence, int> _f$crewId = Field('crewId', _$crewId);
  static DateTime _$endDate(Absence v) => v.endDate;
  static const Field<Absence, DateTime> _f$endDate =
      Field('endDate', _$endDate);
  static int _$id(Absence v) => v.id;
  static const Field<Absence, int> _f$id = Field('id', _$id);
  static String _$memberNote(Absence v) => v.memberNote;
  static const Field<Absence, String> _f$memberNote =
      Field('memberNote', _$memberNote);
  static DateTime? _$rejectedAt(Absence v) => v.rejectedAt;
  static const Field<Absence, DateTime> _f$rejectedAt =
      Field('rejectedAt', _$rejectedAt);
  static DateTime _$startDate(Absence v) => v.startDate;
  static const Field<Absence, DateTime> _f$startDate =
      Field('startDate', _$startDate);
  static String _$type(Absence v) => v.type;
  static const Field<Absence, String> _f$type = Field('type', _$type);
  static int _$userId(Absence v) => v.userId;
  static const Field<Absence, int> _f$userId = Field('userId', _$userId);

  @override
  final MappableFields<Absence> fields = const {
    #admitterId: _f$admitterId,
    #admitterNote: _f$admitterNote,
    #confirmedAt: _f$confirmedAt,
    #createdAt: _f$createdAt,
    #crewId: _f$crewId,
    #endDate: _f$endDate,
    #id: _f$id,
    #memberNote: _f$memberNote,
    #rejectedAt: _f$rejectedAt,
    #startDate: _f$startDate,
    #type: _f$type,
    #userId: _f$userId,
  };

  static Absence _instantiate(DecodingData data) {
    return Absence(
        admitterId: data.dec(_f$admitterId),
        admitterNote: data.dec(_f$admitterNote),
        confirmedAt: data.dec(_f$confirmedAt),
        createdAt: data.dec(_f$createdAt),
        crewId: data.dec(_f$crewId),
        endDate: data.dec(_f$endDate),
        id: data.dec(_f$id),
        memberNote: data.dec(_f$memberNote),
        rejectedAt: data.dec(_f$rejectedAt),
        startDate: data.dec(_f$startDate),
        type: data.dec(_f$type),
        userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static Absence fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Absence>(map);
  }

  static Absence fromJson(String json) {
    return ensureInitialized().decodeJson<Absence>(json);
  }
}

mixin AbsenceMappable {
  String toJson() {
    return AbsenceMapper.ensureInitialized()
        .encodeJson<Absence>(this as Absence);
  }

  Map<String, dynamic> toMap() {
    return AbsenceMapper.ensureInitialized()
        .encodeMap<Absence>(this as Absence);
  }

  AbsenceCopyWith<Absence, Absence, Absence> get copyWith =>
      _AbsenceCopyWithImpl(this as Absence, $identity, $identity);
  @override
  String toString() {
    return AbsenceMapper.ensureInitialized().stringifyValue(this as Absence);
  }

  @override
  bool operator ==(Object other) {
    return AbsenceMapper.ensureInitialized()
        .equalsValue(this as Absence, other);
  }

  @override
  int get hashCode {
    return AbsenceMapper.ensureInitialized().hashValue(this as Absence);
  }
}

extension AbsenceValueCopy<$R, $Out> on ObjectCopyWith<$R, Absence, $Out> {
  AbsenceCopyWith<$R, Absence, $Out> get $asAbsence =>
      $base.as((v, t, t2) => _AbsenceCopyWithImpl(v, t, t2));
}

abstract class AbsenceCopyWith<$R, $In extends Absence, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? admitterId,
      String? admitterNote,
      DateTime? confirmedAt,
      DateTime? createdAt,
      int? crewId,
      DateTime? endDate,
      int? id,
      String? memberNote,
      DateTime? rejectedAt,
      DateTime? startDate,
      String? type,
      int? userId});
  AbsenceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AbsenceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Absence, $Out>
    implements AbsenceCopyWith<$R, Absence, $Out> {
  _AbsenceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Absence> $mapper =
      AbsenceMapper.ensureInitialized();
  @override
  $R call(
          {Object? admitterId = $none,
          String? admitterNote,
          Object? confirmedAt = $none,
          DateTime? createdAt,
          int? crewId,
          DateTime? endDate,
          int? id,
          String? memberNote,
          Object? rejectedAt = $none,
          DateTime? startDate,
          String? type,
          int? userId}) =>
      $apply(FieldCopyWithData({
        if (admitterId != $none) #admitterId: admitterId,
        if (admitterNote != null) #admitterNote: admitterNote,
        if (confirmedAt != $none) #confirmedAt: confirmedAt,
        if (createdAt != null) #createdAt: createdAt,
        if (crewId != null) #crewId: crewId,
        if (endDate != null) #endDate: endDate,
        if (id != null) #id: id,
        if (memberNote != null) #memberNote: memberNote,
        if (rejectedAt != $none) #rejectedAt: rejectedAt,
        if (startDate != null) #startDate: startDate,
        if (type != null) #type: type,
        if (userId != null) #userId: userId
      }));
  @override
  Absence $make(CopyWithData data) => Absence(
      admitterId: data.get(#admitterId, or: $value.admitterId),
      admitterNote: data.get(#admitterNote, or: $value.admitterNote),
      confirmedAt: data.get(#confirmedAt, or: $value.confirmedAt),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      crewId: data.get(#crewId, or: $value.crewId),
      endDate: data.get(#endDate, or: $value.endDate),
      id: data.get(#id, or: $value.id),
      memberNote: data.get(#memberNote, or: $value.memberNote),
      rejectedAt: data.get(#rejectedAt, or: $value.rejectedAt),
      startDate: data.get(#startDate, or: $value.startDate),
      type: data.get(#type, or: $value.type),
      userId: data.get(#userId, or: $value.userId));

  @override
  AbsenceCopyWith<$R2, Absence, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AbsenceCopyWithImpl($value, $cast, t);
}
