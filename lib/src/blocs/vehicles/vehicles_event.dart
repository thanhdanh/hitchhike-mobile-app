import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class VehiclesEvent extends Equatable {
  const VehiclesEvent();

  @override
  List<Object> get props => [];
}

@immutable
class VehiclesLoadedEvent extends VehiclesEvent {}

@immutable
class VehicleAddedEvent extends VehiclesEvent {
  final Vehicle vehicle;

  const VehicleAddedEvent(this.vehicle);

  @override
  List<Object> get props => [vehicle];

  @override
  String toString() => 'VehicleAdded { vehicle: $vehicle }';
}
