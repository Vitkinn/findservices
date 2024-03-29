import 'package:findservices/src/modules/service_requests/data/models/send_service_request_model.dart';
import 'package:findservices/src/modules/service_requests/data/models/service_request_model.dart';

abstract class IServiceRequestDatasource {
  Future<ServiceRequestModel> sendServiceRequest(
      SendServiceRequestModel entity);
}
