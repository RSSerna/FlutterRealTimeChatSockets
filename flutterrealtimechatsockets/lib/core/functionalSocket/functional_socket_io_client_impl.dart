import 'package:flutterrealtimechatsockets/core/constants/environments.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';

class FunctionalSocketIOClientImpl extends FunctionalSocket {
  static final FunctionalSocketIOClientImpl _instance =
      FunctionalSocketIOClientImpl._internal();

  FunctionalSocketIOClientImpl._internal() {
    initConfing();
    print('<FunctionalSocketIOClientImpls> creation');
  }

  factory FunctionalSocketIOClientImpl() => _instance;

  late Socket _service;
  @override
  void initConfing() {
    _service = io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': false,
      'forceNew': true
    });

    _service.onConnect((data) {
      eventSink.add(FunctionalSocketEvent(
          functionalSocketEventEnum: FunctionalSocketEventEnum.onConnected,
          data: data));
      print('connected');
    });

    _service.onDisconnect((data) {
      eventSink.add(FunctionalSocketEvent(
          functionalSocketEventEnum: FunctionalSocketEventEnum.onDisconected,
          data: data));
      print('disconected');
    });

    _service.on('active-bands', (data) {
      eventSink.add(FunctionalSocketEvent(
          functionalSocketEventEnum: FunctionalSocketEventEnum.activeBands,
          data: data));
    });
  }

  @override
  void connect() {
    _service.connect();
  }

  @override
  void disconnect() {
    _service.disconnect();
  }

  @override
  bool sendData(String event, [dynamic data]) {
    if (_service.disconnected) {
      return false;
    }
    try {
      _service.emit(event, data);
    } catch (e) {
      throw const SocketException();
    }
    return true;
  }
}
