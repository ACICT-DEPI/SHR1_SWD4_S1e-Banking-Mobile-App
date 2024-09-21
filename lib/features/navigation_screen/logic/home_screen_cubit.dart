import 'package:bloc/bloc.dart';

import '../data/models/home_model.dart';
import '../data/repo/home_screen_repository.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenRepository homeScreenRepository = HomeScreenRepository();

  HomeScreenCubit() : super(HomeScreenInitial()) {
    initialize();
  }

  void initialize() async {
    emit(HomeScreenLoading());
    try {
      // Use await to get the actual values from the futures
      final userModel = await homeScreenRepository.getUserModel();
      final cards = await homeScreenRepository.getUserCards();
      final transactions = await homeScreenRepository.getTransactions();

      if (userModel != null && transactions != null && cards != null) {
        emit(
          HomeScreenSuccess(
            homeModel: HomeModel(
              userModel: userModel,
              transactions: transactions,
              cards: cards,
            ),
          ),
        );
      } else {
        emit(HomeScreenError(message: 'Failed to load data'));
      }
    } catch (e) {
      // Handle any errors that occur during fetching
      emit(
        HomeScreenError(message: e.toString()),
      );
    }
  }
}
