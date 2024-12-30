// A. abstract Role
abstract class Role {
  void displayRole();
}

// B. Class Person
class Person implements Role {
  String _name;
  int _age;
  String _address;

  Person(this._name, this._age, this._address);

  //getter methods
  String get name => _name;
  int get age => _age;
  String get address => _address;

  @override
  void displayRole() {
    print("Role: Person");
  }
}

// C. class Student that extends person

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(super.name, super.age, super.address, this.studentID, this.grade, this.courseScores);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    double result = courseScores.reduce((value, element) => value + element);
    return result / courseScores.length;
  }
}

// D. class Teacher extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(super.name, super.age, super.address, this.teacherID, this.coursesTaught);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    for (String course in coursesTaught) {
      print('- $course');
    }
  }
}

//E. class Student Management System

class StudentManagementSystem {
  Student student = Student("John Doe", 20, "123 main Street", "", "", [90, 85, 82]);
  //The StudentID and grade are not provided in the question, so they have been left blank here.

  displayStudentinfo() {
    print("Student Information: ");

    student.displayRole();
    print("Name: ${student.name}");
    print("Age: ${student.age}");
    print("Adress: ${student.address}");
    print("Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}");
  }

  Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", "", ['Math', 'English', 'Bangla']);
//The teacherID are not provided in the question, so they have been left blank here.

  displayTeacherinfo() {
    print("Teacher Information: ");
    teacher.displayRole();
    print("Name: ${teacher.name}");
    print("Age: ${teacher.age}");
    print("Address: ${teacher.address}");
    print("Couress Taught: ");
    teacher.displayCourses();
  }
}

void main() {
  StudentManagementSystem studentManagementSystem = StudentManagementSystem();

  //Print Student Information
  studentManagementSystem.displayStudentinfo();

  //Print Teacher Information
  studentManagementSystem.displayTeacherinfo();
}
