import 'package:hive_flutter/hive_flutter.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';

class AuthLocalDataSourceHive implements AuthLocalDataSource {
  static const String authTokenHiveBoxKey = 'auth_token_hive_box_key';
  static const String authTokenHiveElementKey = 'auth_token_hive_element_key';

  @override
  void setAuthToken({required String authToken}) async {
    try {
      await Hive.openBox<String>(authTokenHiveBoxKey);
      var box = Hive.box<String>(authTokenHiveBoxKey);
      box.put(authTokenHiveElementKey, authToken);
    } catch (e) {
      // For this demo we don't care if persisting the token fails.
    }
  }
}
