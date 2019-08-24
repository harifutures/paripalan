import 'package:flutter/material.dart';
import '../models/department.dart';

class Departments with ChangeNotifier {
  List<Department> _departmentsList = [
    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Guntur',
      mandal: 'Mangalagiri',
      village: 'Kaza',
      role: 'Sarpanch/President'
    ),
    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Guntur',
      mandal: 'Mangalagiri',
      village: 'Kaza',
      role: 'VRO'
    ),
    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Guntur',
      mandal: 'Mangalagiri',
      village: 'Kaza',
      role: 'Grama Volunteer'
    ),
  
    Department(
      id: '1',
      departmentName: 'MRO Office',
      description: 'Revenue Office',
      state: 'AP',
      district: 'Guntur',
      mandal: 'Mangalagiri',
      village: 'Kaza',
      role: 'MRO/Tasildar'
    ),
    Department(
      id: '1',
      departmentName: 'MRO Office',
      description: 'Revenue Office',
      state: 'AP',
      district: 'Guntur',
      mandal: 'Mangalagiri',
      village: 'Kaza',
      role: 'Survayer'
    ),

    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Krishna',
      mandal: 'Avanigadda',
      village: 'Kotha peta',
      role: 'Sarpanch/President'
    ),
    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Krishna',
      mandal: 'Avanigadda',
      village: 'Kotha peta',
      role: 'VRO'
    ),
    Department(
      id: '1',
      departmentName: 'Panchayati',
      description: 'Grama Panchayati',
      state: 'AP',
      district: 'Krishna',
      mandal: 'Avanigadda',
      village: 'Kotha peta',
      role: 'Grama Volunteer'
    ),
  
    Department(
      id: '1',
      departmentName: 'MRO Office',
      description: 'Revenue Office',
      state: 'AP',
      district: 'Krishna',
      mandal: 'Avanigadda',
      village: 'Kotha peta',
      role: 'MRO/Tasildar'
    ),
    Department(
      id: '1',
      departmentName: 'MRO Office',
      description: 'Revenue Office',
      state: 'AP',
      district: 'Krishna',
      mandal: 'Avanigadda',
      village: 'Kotha peta',
      role: 'Survayer'
    ),

  ];

  List<Department> get departmentList {
    return [..._departmentsList];
  }

  Department findById(String id) {
    return _departmentsList.firstWhere((dept) => dept.id == id);
  }

}