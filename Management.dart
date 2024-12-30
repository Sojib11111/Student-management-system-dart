// Abstract class defining Role
import 'dart:io';

abstract class Role {
  void displayRole();
}

// Base class Person implementing Role
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    // To be overridden by subclasses
  }
}

// Student class extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    double total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  void displayStudentInfo() {
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}");
  }
}

// Teacher class extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Student Management System class
class StudentManagementSystem {
  static void main() {
    print("Enter Student Name:");
    String studentName = stdin.readLineSync()!;

    print("Enter Student Age:");
    int studentAge = int.parse(stdin.readLineSync()!);

    print("Enter Student Address:");
    String studentAddress = stdin.readLineSync()!;

    print("Enter Student ID:");
    String studentID = stdin.readLineSync()!;

    print("Enter Student Grade:");
    String studentGrade = stdin.readLineSync()!;

    print("Enter Student Scores (comma-separated):");
    List<double> studentScores = stdin.readLineSync()!
        .split(',')
        .map((score) => double.parse(score.trim()))
        .toList();

    Student student = Student(studentName, studentAge, studentAddress, studentID, studentGrade, studentScores);

    // Input for Teacher
    print("\nEnter Teacher Name:");
    String teacherName = stdin.readLineSync()!;

    print("Enter Teacher Age:");
    int teacherAge = int.parse(stdin.readLineSync()!);

    print("Enter Teacher Address:");
    String teacherAddress = stdin.readLineSync()!;

    print("Enter Teacher ID:");
    String teacherID = stdin.readLineSync()!;

    print("Enter Courses Taught (comma-separated):");
    List<String> coursesTaught = stdin.readLineSync()!
        .split(',')
        .map((course) => course.trim())
        .toList();

    Teacher teacher = Teacher(teacherName, teacherAge, teacherAddress, teacherID, coursesTaught);

    // Display Student information
    print("\nStudent Information:");
    student.displayStudentInfo();

    // Display Teacher information
    print("\nTeacher Information:");
    teacher.displayTeacherInfo();
  }
}

void main() {
  StudentManagementSystem.main();
}
