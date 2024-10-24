class Questions {
  const Questions(this.question, this.options);
  final String question;
  final List<String> options;
  List<String> getShuffledOptions() {
    final sList = List.of(options);
    sList.shuffle();
    return sList;
  }
}
