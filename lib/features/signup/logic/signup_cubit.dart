import 'package:complete_app/features/signup/data/models/signup_request_body.dart';
import 'package:complete_app/features/signup/data/repos/signup_repo.dart';
import 'package:complete_app/features/signup/logic/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();


  void emitSignupStates () async {
    emit(const SignupState.loading());
    var data = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      )
    );
    data.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (errorMessage) {
      emit(SignupState.failure(errorMessage.apiErrorModel.message ?? "Something went wrong"));
    },);
  }
}
