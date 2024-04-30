// attendance_model.dart

class Subject {
  final String name;
  final bool isPresent;

  Subject({required this.name, required this.isPresent});
}

List<Subject> subjects = [
  Subject(name: 'Math', isPresent: true),
  Subject(name: 'Science', isPresent: false),
  Subject(name: 'History', isPresent: true),
  // Add more subjects as needed
];
