import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'conection_state.dart'; // Needed for async/await functions

class ConnectionScreenCubit extends Cubit<WifiState> {
  final Connectivity _connectivity = Connectivity();

  ConnectionScreenCubit() : super(ConnectionInitial()) {
    _checkInitialConnection();
    _listenToConnectivityChanges();
  }

  // Check the initial connection state
  Future<void> _checkInitialConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      emit(Disconnected());
    } else {
      emit(Connected());
    }
  }

  // Listen to connectivity changes
  void _listenToConnectivityChanges() {
    _connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.none) {
        emit(Disconnected());
      } else {
        emit(Connected());
      }
    });
  }


}
