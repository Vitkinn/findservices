import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';

abstract class IAuthController {
  void login(LogedUserEntity user);
  String? getToken();
  bool isAuthenticated();
  String getCurrentUserId();
}
