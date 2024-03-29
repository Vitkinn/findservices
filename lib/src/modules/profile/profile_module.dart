import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:findservices/src/modules/profile/data/datasource/remote/user_profile_datasource.dart';
import 'package:findservices/src/modules/profile/data/repositories/user_profile_repository.dart';
import 'package:findservices/src/modules/profile/domain/usecases/load_current_user_profile.dart';
import 'package:findservices/src/modules/profile/domain/usecases/load_evaluations_usecase.dart';
import 'package:findservices/src/modules/profile/domain/usecases/load_profile_usecase.dart';
import 'package:findservices/src/modules/profile/domain/usecases/update_user_usecase.dart';
import 'package:findservices/src/modules/profile/presentation/controllers/profile_controller.dart';
import 'package:findservices/src/modules/profile/presentation/controllers/profile_edit_controller.dart';
import 'package:findservices/src/modules/profile/presentation/pages/profile_edit_page.dart';
import 'package:findservices/src/modules/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasource
        Bind.lazySingleton<IUserProfileDatasource>(
            (i) => UserProfileDatasource(restClient: i.get<RestClient>())),
        // Repository
        Bind.lazySingleton((i) => UserProfileRepository(datasource: i.get())),
        // Usecase
        Bind.lazySingleton((i) => LoadProfileUsecase(
              repository: i.get(),
              authController: i.get(),
            )),
        Bind.lazySingleton((i) => LoadCurrentUserEvaluationsUsecase(
              repository: i.get(),
              authController: i.get(),
            )),
        Bind.lazySingleton((i) => LoadCurrentUserProfileUsecase(
              repository: i.get(),
            )),
        Bind.lazySingleton((i) => UpdateUserUsecase(
              repository: i.get(),
              imageCompressController: i.get(),
              authController: i.get(),
            )),
        // Controller
        Bind.lazySingleton((i) => ProfileController(
              loadProfileUsercase: i.get(),
              loadEvaluationsUsecase: i.get(),
            )),
        Bind.lazySingleton((i) => ProfileEditController(
              loadCurrentUserProfileUsecase: i.get(),
              authController: i.get(),
              updateUserUsecase: i.get(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/profile_edit',
            child: (context, args) => const ProfileEditPage()),
      ];
}
