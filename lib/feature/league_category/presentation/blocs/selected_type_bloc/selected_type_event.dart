part of 'selected_type_bloc.dart';

abstract class SelectedTypeEvent extends Equatable {
  const SelectedTypeEvent();
}

class ChangeSelectedTypeEvent extends SelectedTypeEvent {
  final SelectedType selectedType;

  const ChangeSelectedTypeEvent({
    required this.selectedType,
  });

  ChangeSelectedTypeEvent copyWith({
    SelectedType? selectedType,
  }) {
    return ChangeSelectedTypeEvent(
      selectedType: selectedType ?? this.selectedType,
    );
  }

  @override
  List<Object> get props => [selectedType];
}