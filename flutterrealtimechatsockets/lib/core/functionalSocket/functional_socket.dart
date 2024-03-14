import 'dart:async';

abstract class FunctionalSocket {
  void initConfing();
  bool sendData(String event, [dynamic data]);
  void connect();
  void disconnect();
  final StreamController<FunctionalSocketEvent> _eventController =
      StreamController<FunctionalSocketEvent>.broadcast();

  //Preguntar a Luis como inicializarlos sin ser un getter
  Stream<FunctionalSocketEvent> get eventStream => _eventController.stream;
  StreamSink<FunctionalSocketEvent> get eventSink => _eventController.sink;

  dispose() {
    _eventController.close();
  }
}

enum FunctionalSocketEventEnum { onConnected, onDisconected, activeBands }

class FunctionalSocketEvent {
  final FunctionalSocketEventEnum functionalSocketEventEnum;
  final dynamic data;

  const FunctionalSocketEvent(
      {required this.functionalSocketEventEnum, required this.data});
}
