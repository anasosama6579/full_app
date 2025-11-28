import 'package:complete_app/features/login/data/models/login_request_body.dart';
import 'package:complete_app/features/login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (errorHandler) {
        emit(LoginState.failure(
            errorHandler.apiErrorModel.message ?? "Something went wrong"));
      },
    );
  }
}
