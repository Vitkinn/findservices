import 'package:image_picker/image_picker.dart';
import 'package:findservices/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:findservices/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:findservices/src/modules/profile/data/models/user_profile_model.dart';
import 'package:findservices/src/modules/user_registration/data/models/image_id_model.dart';

abstract class IUserProfileDatasource {
  Future<UserProfileModel> loadUserProfile(String userId);
  Future<ProfileEvaluationModel> loadProfileEvaluations(String userId);
  Future<ProfileEditModel> loadUserEdit();
  Future<ProfileEditModel> editUser(ProfileEditModel data);
  Future<ImageIdModel> uploadPhoto(XFile photo);
}
