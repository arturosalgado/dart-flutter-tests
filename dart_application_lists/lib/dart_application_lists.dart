int calculate() {
  return 6 * 7;
}
extension FilterableList<T extends Map<String, dynamic>> on List<T> {
  List<T> applyFilter(List<String> filters) {
    return where((map) {
      var groups = map['groups'];
      if (groups is List<String>) {
        return groups.any((group) => filters.contains(group));
      }
      return false;
    }).toList();
  }
}