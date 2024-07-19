part of 'add_expenes_cubit.dart';

@immutable
sealed class AddExpenesState {}

final class AddExpenesInitial extends AddExpenesState {}

final class AddExpenesLoading extends AddExpenesState {}

final class AddExpenesSuccess extends AddExpenesState {}

final class AddExpenesError extends AddExpenesState {
  final String message;
  AddExpenesError(this.message);
}
