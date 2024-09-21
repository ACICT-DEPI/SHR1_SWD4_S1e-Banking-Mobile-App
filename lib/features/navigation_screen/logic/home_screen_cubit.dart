import 'package:bank_app/features/navigation_screen/data/repo/home_screen_repository.dart';
import 'package:bloc/bloc.dart';

import '../data/models/home_model.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenRepository homeScreenRepository = HomeScreenRepository();

  HomeScreenCubit() : super(HomeScreenInitial()) {
    _initialize();
  }

  void _initialize() async {
    try {
      // Use await to get the actual values from the futures
      final userModel = await homeScreenRepository.getUserModel();
      final transactions = await homeScreenRepository.getTransactions();
      final cards = await homeScreenRepository.getUserCards();

      if (userModel != null && transactions != null && cards != null) {
        emit(HomeScreenLoaded(
          homeModel: HomeModel(
            userModel: userModel,
            transactions: transactions,
            cards: cards,
          ),
        ));
      } else {
        emit(HomeScreenError(message: 'Failed to load data'));
      }
    } catch (e) {
      // Handle any errors that occur during fetching
      emit(HomeScreenError(message: e.toString()));
    }
  }
}
