part of 'home_screen_cubit.dart';

abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenSuccess extends HomeScreenState {
  final HomeModel homeModel;

  HomeScreenSuccess({
    required this.homeModel,
  });
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError({required this.message});
}
