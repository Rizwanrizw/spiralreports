import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SpiralReportsAuthUser {
  SpiralReportsAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UsersStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SpiralReportsAuthUser> spiralReportsAuthUserSubject =
    BehaviorSubject.seeded(SpiralReportsAuthUser(loggedIn: false));
Stream<SpiralReportsAuthUser> spiralReportsAuthUserStream() =>
    spiralReportsAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
