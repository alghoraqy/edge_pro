
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get hasConnection;
}

class NetworkCheckerImpl implements NetworkChecker{
  final InternetConnectionChecker connectionChecker;

  NetworkCheckerImpl({required this.connectionChecker});


  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
  
  @override
  Stream<InternetConnectionStatus> get hasConnection =>connectionChecker.onStatusChange;

}