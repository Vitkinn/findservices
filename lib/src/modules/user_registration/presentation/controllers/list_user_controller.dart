import 'package:flutter/cupertino.dart';
import 'package:findservices/src/modules/user_registration/domain/entities/user_entity.dart';
import 'package:findservices/src/modules/user_registration/domain/usecases/list_users_usecase.dart';

class ListUserController {
  final ListUsersUsecase listUsersUsecase;

  ListUserController({required this.listUsersUsecase});

  ValueNotifier<List<UserEntity>> users = ValueNotifier<List<UserEntity>>([]);

  Future<void> list() async {
    final result = await listUsersUsecase();

    result.fold((l) => null, (r) {
      users.value = r;
    });
  }
}
