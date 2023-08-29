part of 'add_item_cubit.dart';

abstract class AddItemState extends Equatable {
  const AddItemState();

  @override
  List<Object> get props => [];
}

class AddItemInitial extends AddItemState {}

class AddQuantitySuccessful extends AddItemState {
  final int value;
  const AddQuantitySuccessful(this.value);
}

class MinusQuantitySuccessful extends AddItemState {
  final int value;
  const MinusQuantitySuccessful(this.value);
}

class ReloadPage extends AddItemState {}

class SubmitAndDismiss extends AddItemState {}
