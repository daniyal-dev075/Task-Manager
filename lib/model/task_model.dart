class Task {
  final String id;
  final String title;
  bool isCompleted;
  String details;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.details = '',
  });

  // For SharedPreferences (as JSON string)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'details': details,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'],
      details: map['details'] ?? '',
    );
  }
}
