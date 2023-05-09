import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc/repository/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        //utils bata yeuta toastbar dekhauna sakincha error ko lai yeha
        print(error.toString());
      }
    });
  }
}


//9,10 and 11