import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/usecases/try_renew_token.dart';

class LoadingService with ChangeNotifier {
  final TryRenewToken tryRenewToken;
  final FunctionalSocket functionalSocket;

  LoadingService({required this.tryRenewToken, required this.functionalSocket});

  Future<bool> isLoggedIn() async {
    print("TryLoading");
    final failureOrRenew = await tryRenewToken(NoParams());

    bool ok = true;
    failureOrRenew.fold((failure) {
      print("Failure");
      ok = false;
      return false;
    }, (_) {
      functionalSocket.connect();
      print("Ok");
    });
    print("WhyPrint");
    return ok;
  }
}
