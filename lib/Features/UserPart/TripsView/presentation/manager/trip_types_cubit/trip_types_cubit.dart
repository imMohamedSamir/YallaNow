import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';

part 'trip_types_state.dart';

class TripTypesCubit extends Cubit<TripTypesState> {
  TripTypesCubit(this.tripsRepo) : super(TripTypesInitial());
  final TripsRepo tripsRepo;

  void get() async {
    emit(TripTypesLoading());
    var results = await tripsRepo.getTypes();
    results.fold((fail) => emit(TripTypesFailure(errmsg: fail.errMessage)),
        (types) => emit(TripTypesSuccess(types: types)));
  }
}
