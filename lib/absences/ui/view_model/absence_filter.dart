enum TypeFilter { all, sickness, vacation }

String formatFilterByType(TypeFilter typeFilter) {
  return switch (typeFilter) {
    TypeFilter.all => 'Type (All)',
    TypeFilter.sickness => 'Sickness',
    TypeFilter.vacation => 'Vacation',
  };
}

