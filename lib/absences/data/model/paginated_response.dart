class PaginatedResponse<T> {
  const PaginatedResponse(this.totalItemCount, this.items, this.hasMore);

  final int totalItemCount;
  final List<T> items;
  final bool hasMore;
}
