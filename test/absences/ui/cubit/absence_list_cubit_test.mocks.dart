// Mocks generated by Mockito 5.4.4 from annotations
// in nice_absence_manager_app/test/absences/ui/cubit/absence_list_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter/material.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nice_absence_manager_app/feature/absences/data/absence_api.dart'
    as _i2;
import 'package:nice_absence_manager_app/feature/absences/data/absence_repository.dart'
    as _i4;
import 'package:nice_absence_manager_app/feature/absences/data/model/absence.dart'
    as _i6;
import 'package:nice_absence_manager_app/feature/absences/data/model/member.dart'
    as _i8;
import 'package:nice_absence_manager_app/feature/absences/data/model/paginated_response.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAbsenceApi_0 extends _i1.SmartFake implements _i2.AbsenceApi {
  _FakeAbsenceApi_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePaginatedResponse_1<T> extends _i1.SmartFake
    implements _i3.PaginatedResponse<T> {
  _FakePaginatedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AbsenceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAbsenceRepository extends _i1.Mock implements _i4.AbsenceRepository {
  @override
  _i2.AbsenceApi get absenceApi => (super.noSuchMethod(
        Invocation.getter(#absenceApi),
        returnValue: _FakeAbsenceApi_0(
          this,
          Invocation.getter(#absenceApi),
        ),
        returnValueForMissingStub: _FakeAbsenceApi_0(
          this,
          Invocation.getter(#absenceApi),
        ),
      ) as _i2.AbsenceApi);

  @override
  int get itemsPerPage => (super.noSuchMethod(
        Invocation.getter(#itemsPerPage),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i5.Future<_i3.PaginatedResponse<_i6.Absence>> fetchAbsencesListByFilter({
    String? type,
    _i7.DateTimeRange? range,
    int? page = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchAbsencesListByFilter,
          [],
          {
            #type: type,
            #range: range,
            #page: page,
          },
        ),
        returnValue: _i5.Future<_i3.PaginatedResponse<_i6.Absence>>.value(
            _FakePaginatedResponse_1<_i6.Absence>(
          this,
          Invocation.method(
            #fetchAbsencesListByFilter,
            [],
            {
              #type: type,
              #range: range,
              #page: page,
            },
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.PaginatedResponse<_i6.Absence>>.value(
                _FakePaginatedResponse_1<_i6.Absence>(
          this,
          Invocation.method(
            #fetchAbsencesListByFilter,
            [],
            {
              #type: type,
              #range: range,
              #page: page,
            },
          ),
        )),
      ) as _i5.Future<_i3.PaginatedResponse<_i6.Absence>>);

  @override
  _i5.Future<List<_i8.Member>> fetchMemberList() => (super.noSuchMethod(
        Invocation.method(
          #fetchMemberList,
          [],
        ),
        returnValue: _i5.Future<List<_i8.Member>>.value(<_i8.Member>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i8.Member>>.value(<_i8.Member>[]),
      ) as _i5.Future<List<_i8.Member>>);
}
