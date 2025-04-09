class Class {
  final int id;
  final String name;
  final int teacherId;

  const Class({required this.id, required this.name, required this.teacherId});

  factory Class.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"id": int id, "name": String name, "teacher_id": int teacherId} => Class(
        id: id,
        name: name,
        teacherId: teacherId,
      ),
      _ => throw const FormatException('Failed to load class.'),
    };
  }
}
