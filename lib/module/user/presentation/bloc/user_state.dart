part of 'user_bloc.dart';
abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState{}
class NoUserCashedState extends UserState{}

///
class LoadingCacheUserState extends UserState {}

class FailedCashedUserState extends UserState{}
class SuccessCashedUserState extends UserState{}

//
class GetCachedUserSuccessState extends UserState{}


///
class ClearControllersState extends UserState{}

////////////
class LoadingCallApiState extends UserState{}
class FailedCallApiState extends UserState{}
class SuccessCallApiState extends UserState{}


class SuccessRemoveCachesUserState extends UserState{}
