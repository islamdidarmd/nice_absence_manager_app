// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nice_absence_manager_app/absences/data/absence_api.dart'
    as _i275;
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart'
    as _i404;
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart'
    as _i130;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i275.AbsenceApi>(() => _i275.AbsenceApi());
    gh.factory<_i404.AbsenceRepository>(
        () => _i404.AbsenceRepository(gh<_i275.AbsenceApi>()));
    gh.factory<_i130.AbsenceListCubit>(
        () => _i130.AbsenceListCubit(gh<_i404.AbsenceRepository>()));
    return this;
  }
}
