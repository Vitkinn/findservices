import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:findservices/src/modules/profile/domain/repositories/i_user_profile_repository.dart';

abstract class ILoadCurrentUserProfileUsecase {
  Future<Either<Failure, ProfileEditModel>> call();
}

class LoadCurrentUserProfileUsecase extends ILoadCurrentUserProfileUsecase {
  final IUserProfileRepository repository;

  LoadCurrentUserProfileUsecase({required this.repository});

  @override
  Future<Either<Failure, ProfileEditModel>> call() async {
    return repository.loadUserEditData();
  }
}
