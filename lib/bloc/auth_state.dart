import 'package:equatable/equatable.dart';

import '../model/user_model.dart';


abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final AppUser user;
  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}
class AuthError extends AuthState {
  final String error;
  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}
