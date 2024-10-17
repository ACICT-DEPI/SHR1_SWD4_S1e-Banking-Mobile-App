abstract class ServiceState {}

class ServiceInitialState extends ServiceState {}

class ServiceLoadingState extends ServiceState {}

class ServiceSuccessState extends ServiceState {}

class ServiceFailedState extends ServiceState {
  final String message;

  ServiceFailedState({required this.message});
}
