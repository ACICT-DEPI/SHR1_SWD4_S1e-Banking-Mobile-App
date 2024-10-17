import 'package:meta/meta.dart';

@immutable
abstract class WifiState {}

class ConnectionInitial extends WifiState {}

class Connected extends WifiState {}

class Disconnected extends WifiState {}
