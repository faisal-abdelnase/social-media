import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_media_app/core/show_snack_bar.dart';
import 'package:social_media_app/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:social_media_app/features/auth/presentation/views/sing_up.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed_passowrd.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  late String email;
  late String passowrd;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading = true;
        }

        else if(state is LoginSuccess){
          Navigator.pushNamed(context, HomeScreen.id);
          isLoading = false;
        }

        else if(state is LoginFailuer){
          showSnaklBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Intsa app",
                        style: TextStyle(fontSize: 28),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormFiled(
                        hintText: "email",
                        iconData: Icons.email,
                        onChanged: (data) {
                          email = data;
                        },
                      ),
                      CustomTextFormFiledPassowrd(
                        onChanged: (data) {
                          passowrd = data;
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: Color(0xff2196F3),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            BlocProvider.of<AuthBloc>(context).
                          add(LoginEvent(email: email, passowrd: passowrd));
                          }
                        },
                        text: "Login",
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const SingUp()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue[600]),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
