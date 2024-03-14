import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/usecases/try_logout.dart';

class HomeService with ChangeNotifier {
  bool _isOnline = false;
  bool get isOnline => _isOnline;
  set isOnline(bool value) {
    _isOnline = value;
    notifyListeners();
  }

  final TryLogOut tryLogOut;
  final FunctionalSocket functionalSocket;

  HomeService({required this.tryLogOut, required this.functionalSocket}) {
    functionalSocket.eventStream.listen((event) {
      FunctionalSocketEventEnum eventEnum = event.functionalSocketEventEnum;
      switch (eventEnum) {
        case FunctionalSocketEventEnum.onConnected:
          print('Connected Bloc');
          isOnline = true;
          break;
        case FunctionalSocketEventEnum.onDisconected:
          print('Disconnected Bloc');
          isOnline = false;
          break;
        default:
      }
    });
  }

  Future<bool> logout() async {
    final failureOrLogIn = await tryLogOut(NoParams());
    bool ok = true;
    failureOrLogIn.fold((failure) {
      print('Send False: ${failure.toString()}');
      ok = false;
      return false;
    }, (logOutResponse) {
      functionalSocket.disconnect();
    });
    print('Send True');
    return ok;
  }
}
