import 'package:equatable/equatable.dart';

class VehiclesState extends Equatable {
  const VehiclesState();

  @override
  List<Object> get props => [];
}

class VehiclesLoadInProgress extends VehiclesState {}

class VehiclesLoadSuccess extends VehiclesState {
  final List<Vehicle> vehicles;

  const VehiclesLoadSuccess([this.vehicles = const []]);

  @override
  List<Object> get props => [vehicles];

  @override
  String toString() => 'VehiclesLoadSuccess { todos: $vehicles }';
}

class VehiclesLoadFailure extends VehiclesState {}
