import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class WsClient {
  final String url = 'wss://stock-backend-r2qd.onrender.com/ws/prices';
  Uri get wsUrl => Uri.parse(url);

  WebSocketChannel? channel;

  void connect() {
    channel = WebSocketChannel.connect(wsUrl);
  }

  void disconnect() {
    channel?.sink.close();
  }

  void subscribeAll() {
    final subscribeMessage = jsonEncode({'action': 'subscribe_all'});
    channel?.sink.add(subscribeMessage);
  }

  Stream<dynamic>? get priceStream => channel?.stream;

  void subscribe(List<String> symbols) {
    channel?.sink.add(jsonEncode({'action': 'subscribe', 'symbols': symbols}));
  }

  void unsubscribe(List<String> symbols) {
    channel?.sink.add(
      jsonEncode({'action': 'unsubscribe', 'symbols': symbols}),
    );
  }
}
