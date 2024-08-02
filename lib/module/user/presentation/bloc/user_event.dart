part of 'user_bloc.dart';

abstract class UserEvent{}

class CacheUserEvent extends UserEvent{
  final User user;

  CacheUserEvent({required this.user});
}
class GetCachedUserEvent extends UserEvent{}

class RemoveCachedUserEvent extends UserEvent{}


class CallApiEvent extends UserEvent{}