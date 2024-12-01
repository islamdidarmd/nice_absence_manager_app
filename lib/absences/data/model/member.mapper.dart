// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'member.dart';

class MemberMapper extends ClassMapperBase<Member> {
  MemberMapper._();

  static MemberMapper? _instance;
  static MemberMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MemberMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Member';

  static int _$crewId(Member v) => v.crewId;
  static const Field<Member, int> _f$crewId = Field('crewId', _$crewId);
  static int _$id(Member v) => v.id;
  static const Field<Member, int> _f$id = Field('id', _$id);
  static String _$image(Member v) => v.image;
  static const Field<Member, String> _f$image = Field('image', _$image);
  static String _$name(Member v) => v.name;
  static const Field<Member, String> _f$name = Field('name', _$name);
  static int _$userId(Member v) => v.userId;
  static const Field<Member, int> _f$userId = Field('userId', _$userId);

  @override
  final MappableFields<Member> fields = const {
    #crewId: _f$crewId,
    #id: _f$id,
    #image: _f$image,
    #name: _f$name,
    #userId: _f$userId,
  };

  static Member _instantiate(DecodingData data) {
    return Member(
        crewId: data.dec(_f$crewId),
        id: data.dec(_f$id),
        image: data.dec(_f$image),
        name: data.dec(_f$name),
        userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static Member fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Member>(map);
  }

  static Member fromJson(String json) {
    return ensureInitialized().decodeJson<Member>(json);
  }
}

mixin MemberMappable {
  String toJson() {
    return MemberMapper.ensureInitialized().encodeJson<Member>(this as Member);
  }

  Map<String, dynamic> toMap() {
    return MemberMapper.ensureInitialized().encodeMap<Member>(this as Member);
  }

  MemberCopyWith<Member, Member, Member> get copyWith =>
      _MemberCopyWithImpl(this as Member, $identity, $identity);
  @override
  String toString() {
    return MemberMapper.ensureInitialized().stringifyValue(this as Member);
  }

  @override
  bool operator ==(Object other) {
    return MemberMapper.ensureInitialized().equalsValue(this as Member, other);
  }

  @override
  int get hashCode {
    return MemberMapper.ensureInitialized().hashValue(this as Member);
  }
}

extension MemberValueCopy<$R, $Out> on ObjectCopyWith<$R, Member, $Out> {
  MemberCopyWith<$R, Member, $Out> get $asMember =>
      $base.as((v, t, t2) => _MemberCopyWithImpl(v, t, t2));
}

abstract class MemberCopyWith<$R, $In extends Member, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? crewId, int? id, String? image, String? name, int? userId});
  MemberCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MemberCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Member, $Out>
    implements MemberCopyWith<$R, Member, $Out> {
  _MemberCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Member> $mapper = MemberMapper.ensureInitialized();
  @override
  $R call({int? crewId, int? id, String? image, String? name, int? userId}) =>
      $apply(FieldCopyWithData({
        if (crewId != null) #crewId: crewId,
        if (id != null) #id: id,
        if (image != null) #image: image,
        if (name != null) #name: name,
        if (userId != null) #userId: userId
      }));
  @override
  Member $make(CopyWithData data) => Member(
      crewId: data.get(#crewId, or: $value.crewId),
      id: data.get(#id, or: $value.id),
      image: data.get(#image, or: $value.image),
      name: data.get(#name, or: $value.name),
      userId: data.get(#userId, or: $value.userId));

  @override
  MemberCopyWith<$R2, Member, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MemberCopyWithImpl($value, $cast, t);
}
