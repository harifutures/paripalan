import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:paripalan/screens/myService_requests_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../models/serviceRequest.dart';
import '../models/service.dart';
import '../models/role.dart';
import '../models/user.dart';

class MyRequestsProvider with ChangeNotifier {

  static var uuid = Uuid();
  List<ServiceRequest> _myRequestList = [
   /* ServiceRequest (
      serviceRequestId: uuid.v4(),
      service: Service(serviceId: 1, serviceName: "Ration Card"),
      role: Role(roleId: 1,roleName: "Sarpanch"),
      user: User(userId: 1),
      serviceRequestDescription: "Please Send my Ration card.",
      status: "Pending",
      createdDate: DateTime.now(),
      updatedDate: DateTime.now()
    ),*/
  ];

  List<ServiceRequest> get myRequestsList {
    return [..._myRequestList];
  }

  Future<void> fetchMyRequests() async {
    const url = 'https://paripalan-db.firebaseio.com/myServiceRequests.json';
    try {
      final response = await http.get(url);
      /*
       Response gives a Map of Maps i.e Map<key, Map<key, value>>,
       we can not use Map<key, Object> or Map<key, Map> to fetch the data,
       instead telling teh flutter as we are getting some dynamic value
       and we loop through it later.
       */
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ServiceRequest> loadedRequests = [];
      extractedData.forEach((serviceReqId, serviceReqData) {
        Service service;
        Role role;
        if(null != serviceReqData['service']) {
          final extractServiceData = json.decode(
              serviceReqData['service']) as Map<String, dynamic>;
          if(null != extractServiceData) {
            service = Service(
              serviceId: extractServiceData['serviceId'],
              serviceName: extractServiceData['serviceName'],
            );
          }
        }
        if(null != serviceReqData['role']) {
          final extractRoleData = json.decode(serviceReqData['role']) as Map<String, dynamic>;
          if(null != extractRoleData) {
            role = Role(
              roleId: extractRoleData['roleId'],
              roleName: extractRoleData['roleName']
            );
          }
        }

        //loadedRequests.add(ServiceRequest(
        loadedRequests.insert(0, ServiceRequest(
          serviceRequestId: serviceReqId,
          service: service,
          role: role,
          user: null,
          serviceRequestDescription: serviceReqData['serviceRequestDescription'],
          status: serviceReqData['status'],
          createdDate: DateTime.parse(serviceReqData['createdDate']),
          updatedDate: DateTime.parse(serviceReqData['updatedDate']),

        ));
      });
      _myRequestList = loadedRequests;
      notifyListeners();
    } catch (error) {
      throw (error);
    }

  }

  List<ServiceRequest> findServicesByDivisionId(int userId) {
    return _myRequestList.where((serviceReq) => serviceReq.user.userId == userId).toList();
  }


  Future<void> addServiceRequest(
      Service serviceParam,
      Role roleParam,
      String serviceDescription,
      String statusParam
      ) async {
    print("======In addService 1====");
    const url = 'https://paripalan-db.firebaseio.com/myServiceRequests.json'; //a collection with 'myServiceRequests' (kind of table) is created in fire base DB.
    //await Future.delayed(Duration(seconds: 2));
    var serviceRequestId = uuid.v4();
    try {
      final response = await http
          .post(
        url,
        body: json.encode({
          //'serviceRequestId': serviceRequestId,
          'service': json.encode({
            if(null != serviceParam && null != serviceParam.serviceId)
              'serviceId': serviceParam.serviceId,
            if(null != serviceParam && null != serviceParam.serviceName)
              'serviceName': serviceParam.serviceName
          }),
          'role': json.encode({
            'roleId': roleParam.roleId,
            'roleName': roleParam.roleName,
          }),
          //"user": User(userId: 1),
          'serviceRequestDescription': serviceDescription,
          'status': statusParam,
          'createdDate': DateTime.now().toString(),
          'updatedDate': DateTime.now().toString()
        }),
      );

      // This final block is called only after 'await post()' call is just like in case of using '.then()'.
      final requestsList = ServiceRequest(
          //print(json.decode(response.body)['name']);
          serviceRequestId: json.decode(response.body)['name'], // This is an unique id generated by FireBase for each record.
          service: serviceParam,
          role: roleParam,
          serviceRequestDescription: serviceDescription,
          status: statusParam
      );
      //_myRequestList.add(requestsList);
      _myRequestList.insert(0, requestsList);
      notifyListeners();
    } catch(error) {
      print(error);
      throw error;
    }

  }
}