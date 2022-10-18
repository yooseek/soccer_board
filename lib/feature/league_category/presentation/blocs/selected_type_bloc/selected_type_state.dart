part of 'selected_type_bloc.dart';

enum SelectedType {
  team,
  player
}

class SelectedTypeState extends Equatable {
  final SelectedType selectedType;

  const SelectedTypeState({
    required this.selectedType,
  });

  factory SelectedTypeState.initial() {
    return SelectedTypeState(selectedType: SelectedType.team);
  }

  SelectedTypeState copyWith({
    SelectedType? selectedType,
  }) {
    return SelectedTypeState(
      selectedType: selectedType ?? this.selectedType,
    );
  }

  @override
  List<Object> get props => [selectedType];
}
