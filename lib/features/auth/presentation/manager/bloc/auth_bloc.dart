import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler

      // Sing up 
      if(event is SingUpEvent){

        emit(SingUpLoaing());

        try{
          FirebaseAuth.instance.
          createUserWithEmailAndPassword(
            email: event.email, password: event.passowrd);

            emit(SingUpSuccess());
        }on FirebaseAuthException catch(e){
          if (e.code == 'weak-password') {
              emit(SingUpFailuer(errMessage: 'The password provided is too weak.'));
          } 
          else if (e.code == 'email-already-in-use') {
              emit(SingUpFailuer(errMessage: 'The account already exists for that email.'));
            }
        }catch (e) {
            emit(SingUpFailuer(errMessage: 'There was an error please try again'));
          }
      }


      // Login

      else if(event is LoginEvent){

        try{

          FirebaseAuth.instance.
          signInWithEmailAndPassword(
            email: event.email, password: event.passowrd);
            emit(LoginSuccess());
        }on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              emit(LoginFailuer(errMessage: 'No user found for that email.'));

            } else if (e.code == 'wrong-password') {
              emit(LoginFailuer(errMessage: 'Wrong password provided for that user.'));
            }
          } catch(e){
            emit(LoginFailuer(errMessage: 'Somthing went wrong'));
          }
      }

    });
  }
}
