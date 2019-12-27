import 'package:flutter/foundation.dart';
import 'package:paripalan/models/role.dart';
import 'package:paripalan/models/user.dart';
import 'package:uuid/uuid.dart';
import '../models/service.dart';
import '../models/role.dart';

class ServiceRequest with ChangeNotifier {

  final String serviceRequestId;
  final Service service;
  final Role role;
  final User user;
  String serviceRequestDescription;
  String status;
  DateTime createdDate;
  DateTime updatedDate;
  //TODO: Need to implement audio/voice record option for max of 1 min, final SomeAudioObject voiceServiceRequest;

  ServiceRequest({
   this.serviceRequestId,
   this.service,
   this.role,
   this.user,
   this.serviceRequestDescription,
   this.status,
   this.createdDate,
   this.updatedDate
  });
}