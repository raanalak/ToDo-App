class Task {
  String title;
  bool isImportant;
  bool hasDone;
  DateTime dueDate;

  Task ({required this.title , this.isImportant = false, this.hasDone = false, required this.dueDate });
  bool getIsImportant() {
    return isImportant;
  }
}