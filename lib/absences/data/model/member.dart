import 'package:dart_mappable/dart_mappable.dart';

part 'member.mapper.dart';

@MappableClass()
class Member with MemberMappable {
  Member({
    required this.crewId,
    required this.id,
    required this.image,
    required this.name,
    required this.userId,
  });

  final int crewId;
  final int id;
  final String image;
  final String name;
  final int userId;

  static const fromMap = MemberMapper.fromMap;
  static const fromJson = MemberMapper.fromJson;
}
