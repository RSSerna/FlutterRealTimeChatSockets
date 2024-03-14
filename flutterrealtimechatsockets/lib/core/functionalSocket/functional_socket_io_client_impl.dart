import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/constants/environments.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';

class FunctionalSocketIOClientImpl extends FunctionalSocket {
  static FunctionalSocketIOClientImpl? _instance;

  FunctionalSocketIOClientImpl._internal(SecureStorage? secureStorage) {
    print('<FunctionalSocketIOClientImpls> creation');
    if (secureStorage != null) {
      secureStorageImpl = secureStorage;
    }
  }

  factory FunctionalSocketIOClientImpl({SecureStorage? secureStorage}) {
    _instance ??= FunctionalSocketIOClientImpl._internal(secureStorage);
    return _instance!;
  }

  late Socket _service;
  late SecureStorage secureStorageImpl;

  @override
  void initConfing() {
    // _service = io(Environments.socketUrl, {
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    //   'forceNew': true,
    // });
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
  }

  @override
  void connect() async {
    // TODO: Ver como ponerle headers
    // _service.acks.addAll({ 'extraHeaders':
    //     {'x-token': await secureStorageImpl.read(key: Constants.securedToken)}});
    // print(_service.acks);
    // _service.connect();
    _service = io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': await secureStorageImpl.read(key: Constants.securedToken)
      }
    });

    initConfing();
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
