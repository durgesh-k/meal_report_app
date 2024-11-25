class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int orderCount;
  final String empId;
  final int departmentId;
  final bool isVeg;
  final bool isSaturdayOpted;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.orderCount,
    required this.empId,
    required this.departmentId,
    required this.isVeg,
    required this.isSaturdayOpted,
  });

  // Factory method to get a UserModel from JSON response from api
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['f_name'] ?? '',
      lastName: json['l_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'] ?? 0,
      orderCount: json['order_count'] ?? 0,
      empId: json['emp_id'] ?? '',
      departmentId: json['department_id'] ?? 0,
      isVeg: json['is_veg'] == 1,
      isSaturdayOpted: json['is_sat_opted'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'f_name': firstName,
      'l_name': lastName,
      'phone': phone,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'status': status,
      'order_count': orderCount,
      'emp_id': empId,
      'department_id': departmentId,
      'is_veg': isVeg ? 1 : 0,
      'is_sat_opted': isSaturdayOpted ? 1 : 0,
    };
  }
}
