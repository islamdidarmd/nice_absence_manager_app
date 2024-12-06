// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nice_absence_manager_app/feature/absences/data/absence_api.dart'
    as _i472;
import 'package:nice_absence_manager_app/feature/absences/data/absence_repository.dart'
    as _i138;
import 'package:nice_absence_manager_app/feature/absences/ui/cubit/absence_list_cubit.dart'
    as _i238;

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
    gh.factory<_i472.AbsenceApi>(() => _i472.AbsenceApi());
    gh.factory<_i138.AbsenceRepository>(
        () => _i138.AbsenceRepository(gh<_i472.AbsenceApi>()));
    gh.factory<_i238.AbsenceListCubit>(
        () => _i238.AbsenceListCubit(gh<_i138.AbsenceRepository>()));
    return this;
  }
}
