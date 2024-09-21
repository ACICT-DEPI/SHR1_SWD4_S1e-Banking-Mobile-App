part of 'home_screen_cubit.dart';

abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final HomeModel homeModel;

  HomeScreenLoaded({
    required this.homeModel,
  });
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError({required this.message});
}
