class Question {
  final String id;
  final int part;
  final String title;
  final Map<String, bool> options;

  Question({required this.id,required this.part, required this.title, required this.options});

  @override
  String toString() {
    // TODO: implement toString
    return 'Question(id: $id ,part:$part, title: $title , options: $options)';
  }
}
