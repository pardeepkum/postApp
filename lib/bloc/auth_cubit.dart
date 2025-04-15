import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/repository/auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> signUp(String email, String password, String username) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signUp(email, password, username);
      emit(AuthAuthenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.logIn(email, password);
      emit(AuthAuthenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void logout() async {
    await authRepository.logOut();
    emit(AuthInitial());
  }
}
