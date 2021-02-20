import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/vehicles/vehicles_event.dart';
import 'package:hitchhike/src/blocs/vehicles/vehicles_state.dart';
import 'package:meta/meta.dart';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  VehiclesBloc({@required this._repository}) : super(VehiclesLoadInProgress());

  @override
  Stream<VehiclesState> mapEventToState(VehiclesEvent event) async* {
    if (event is VehiclesLoadedEvent) {
      yield* _mapVehiclesLoadedToState();
    }
  }

  Stream<VehiclesState> _mapVehiclesLoadedToState() async* {
    try {
      final vehicles = await this._repository.loadVehicles();
      yield VehiclesLoadSuccess(
        vehicles.map(Vehicle.fromEntity).toList(),
      );
    } catch (_) {
      yield VehiclesLoadFailure();
    }
  }

  Stream<VehiclesState> _mapTodoAddedToState(VehicleAddedEvent) event) async* {
    if (state is VehiclesLoadSuccess) {
      final List<Todo> updatedTodos =
          List.from((state as TodosLoadSuccess).todos)..add(event.todo);
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }
}
