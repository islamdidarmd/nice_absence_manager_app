class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.totalItemCount,
    required this.items,
    required this.currentPage,
    required this.hasMore,
  });

  final int totalItemCount;
  final List<T> items;
  final int currentPage;
  final bool hasMore;
}
