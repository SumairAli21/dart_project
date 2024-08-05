import 'dart:io';

void main() {
  EmployeeSystem obj = EmployeeSystem();

  while (true) {
    print("====== WELCOME TO EMPLOYEE MANAGEMENT SYSTEM ======");
    print('1. Add Employee');
    print('2. Employees List');
    print('3. Update Employee');
    print('4. Delete Employee');
    print('5. Exit');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        obj.addEmployee();
        break;
      case '2':
        obj.listEmployees();
        break;
      case '3':
        obj.updateEmployee();
        break;
      case '4':
        obj.deleteEmployee();
        break;
      case '5':
        print('Exiting...');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

class EmployeeSystem {
  List<Employee> employees = [];

  void addEmployee() {
    print('Enter the employee Name:');
    String name = stdin.readLineSync()!;
    print('Enter the employee ID:');
    String id = stdin.readLineSync()!;
    print('Enter the employee Salary:');
    String salary = stdin.readLineSync()!;
    print('Enter the employee Address:');
    String address = stdin.readLineSync()!;
    print('Enter the employee Phone Number:');
    String phoneNo = stdin.readLineSync()!;

    Employee employee = Employee(id: id, name: name, salary: salary, address: address, phoneNo: phoneNo);
    employees.add(employee);
    print('Employee added successfully.');
  }

  void listEmployees() {
    if (employees.isEmpty) {
      print('No employees found.');
    } else {
      for (var employee in employees) {
        print(employee);
      }
    }
  }

  void updateEmployee() {
    print('Enter the employee ID to update:');
    String? updateId = stdin.readLineSync();
    if (updateId == null || updateId.isEmpty) {
      print('Invalid ID.');
     
    }

    Employee? employee = employees.firstWhere(
      (emp) => emp.id == updateId,
      orElse: () => Employee(id: '', name: '', salary: '', address: '', phoneNo: ''),
    );

    if (employee.id == '') {
      print('Employee not found.');
      
    }

    print('Updating Employee: ${employee.name}');
    print('Enter new name (leave blank to keep current):');
    String? name = stdin.readLineSync();
    if (name != null && name.isNotEmpty) employee.name = name;

    print('Enter new salary (leave blank to keep current):');
    String? salary = stdin.readLineSync();
    if (salary != null && salary.isNotEmpty) employee.salary = salary;

    print('Enter new address (leave blank to keep current):');
    String? address = stdin.readLineSync();
    if (address != null && address.isNotEmpty) employee.address = address;

    print('Enter new phone number (leave blank to keep current):');
    String? phoneNo = stdin.readLineSync();
    if (phoneNo != null && phoneNo.isNotEmpty) employee.phoneNo = phoneNo;

    print('Employee updated successfully.');
  }

  void deleteEmployee() {
    print('Enter the employee ID to delete:');
    String? deleteId = stdin.readLineSync();
    if (deleteId == null || deleteId.isEmpty) {
      print('Invalid ID.');
      return;
    }

    employees.removeWhere((emp) => emp.id == deleteId);
    print('Employee deleted successfully.');
  }
}

class Employee {
  String id;
  String name;
  String salary;
  String address;
  String phoneNo;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
    required this.address,
    required this.phoneNo,
  });

  @override
  String toString() {
    return 'Employee{id: $id, name: $name, salary: $salary, address: $address, phoneNo: $phoneNo}';
  }
}
