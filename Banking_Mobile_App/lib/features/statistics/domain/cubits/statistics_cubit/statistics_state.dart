import '../../../data/models/statistics_model.dart';

abstract class StatisticsState {}

class StatisticsInitialState extends StatisticsState {}

class StatisticsLoadingState extends StatisticsState {}

class StatisticsSuccessState extends StatisticsState {
  final StatisticsModel statisticsModel;

  StatisticsSuccessState({required this.statisticsModel});
}

class StatisticsFailedState extends StatisticsState {
  final String errMessage;

  StatisticsFailedState({required this.errMessage});
}
