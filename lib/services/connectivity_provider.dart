import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityState {
  final ConnectivityStatus status;

  ConnectivityState(this.status);
}

final connectivityProvider = StateNotifierProvider<ConnectivityProvider, ConnectivityState>((ref) {
  return ConnectivityProvider(Connectivity(), ref);
});

class ConnectivityProvider extends StateNotifier<ConnectivityState> {
  final Connectivity connectivity;

  ConnectivityProvider(this.connectivity,  ref)
      : super(ConnectivityState(ConnectivityStatus.disconnected)) {
    checkConnectivity();
    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        state = ConnectivityState(ConnectivityStatus.disconnected);
      } else {
        state = ConnectivityState(ConnectivityStatus.connected);
      }
    });
  }

  Future<void> checkConnectivity() async {
    var result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      state = ConnectivityState(ConnectivityStatus.disconnected);
    } else {
      state = ConnectivityState(ConnectivityStatus.connected);
    }
  }
}
