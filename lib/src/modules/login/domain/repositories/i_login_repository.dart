import 'package:dartz/dartz.dart';
import 'package:findservices/src/modules/login/data/models/loged_user_model.dart';
import 'package:findservices/src/modules/login/data/models/login_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ILoginRepository {
  Future<Either<Failure, LogedUserModel>> login(LoginModel model);
}
