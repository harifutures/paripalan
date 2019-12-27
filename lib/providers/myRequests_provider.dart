import 'package:flutter/foundation.dart';
import 'package:paripalan/screens/myService_requests_screen.dart';
import 'package:uuid/uuid.dart';
import '../models/serviceRequest.dart';
import '../models/service.dart';
import '../models/role.dart';
import '../models/user.dart';

class MyRequestsProvider with ChangeNotifier {

  static var uuid = Uuid();
  List<ServiceRequest> _myRequestList = [
    ServiceRequest (
      serviceRequestId: uuid.v4(),
      service: Service(serviceId: 1, serviceName: "Ration Card"),
      role: Role(roleId: 1,roleName: "Sarpanch"),
      user: User(userId: 1),
      serviceRequestDescription: "Please Send my Ration card.",
      status: "Pending",
      createdDate: DateTime.now(),
      updatedDate: DateTime.now()
    ),
  ];

  List<ServiceRequest> get myRequestsList {
    return [..._myRequestList];
  }

  List<ServiceRequest> findServicesByDivisionId(int userId) {
    return _myRequestList.where((serviceReq) => serviceReq.user.userId == userId).toList();
  }


  void addServiceRequest(
      Service serviceParam,
      Role roleParam,
      String serviceDescription,
      String statusParam
      ) {
      _myRequestList.add(
            ServiceRequest(
          serviceRequestId: uuid.v4(),
          service: serviceParam,
          role: roleParam,
          serviceRequestDescription: serviceDescription,
          status: statusParam
        ),
      );
    }
    notifyListeners();
}