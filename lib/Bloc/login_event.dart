part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class FetchLogin extends LoginEvent{
String email ;
String password;
FetchLogin({required this.email,required this.password});
}