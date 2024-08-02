import 'package:edge_pro/module/user/data/models/user.dart';
import 'package:edge_pro/module/user/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  User? currentUser;

  TextEditingController firstNameController = TextEditingController();

  TextEditingController middleNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  static UserBloc of(context) => BlocProvider.of(context);

  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<GetCachedUserEvent>((event, emit) => _getCashedUserHandler(event, emit));
    on<CacheUserEvent>((event, emit) => _cacheUser(event, emit));
    on<RemoveCachedUserEvent>((event, emit) => _removeCachedUserHandler(event, emit));
    on<CallApiEvent>((event, emit) => _callApiHander(event, emit));
// ========================================================================
  }

// =======================================================================================
  _getCashedUserHandler(GetCachedUserEvent event, Emitter<UserState> emit) async {
    final response = await userRepository.getCachedUser();
    response.fold(
      (failure) => emit(NoUserCashedState()),
      (user) async {
        currentUser = user;
        emit(GetCachedUserSuccessState());
      },
    );
  }

// =======================================================================================

  _cacheUser(CacheUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingCacheUserState());
    final response = await userRepository.cacheUser(user: event.user);
    response.fold(
      (failure) => emit(FailedCashedUserState()),
      (user) async {
        currentUser = event.user;
        emit(SuccessCashedUserState());
      },
    );
  }

  // =======================================================================================
  _removeCachedUserHandler(RemoveCachedUserEvent event, Emitter<UserState> emit) async {
    await userRepository.removeCachedUser();
    currentUser = null;
  }

  _callApiHander(CallApiEvent event, Emitter<UserState> emit) async {
    emit(LoadingCallApiState());
    await Future.delayed(const Duration(seconds: 2), () {
      debugPrint('Success Call Api');
      debugPrint('User Name: ${currentUser!.firstName} ${currentUser!.middleName} ${currentUser!.lastName}  ${currentUser!.address}');
    });
    add(RemoveCachedUserEvent());
    emit(SuccessCallApiState());
  }

  void clearControllers() {
    firstNameController.clear();
    middleNameController.clear();
    lastNameController.clear();
    addressController.clear();
  }
}
