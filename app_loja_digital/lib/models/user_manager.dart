import 'package:app_loja_digital/models/user.dart' as MyUser;
import 'package:firebase_auth/firebase_auth.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<void> signIn(MyUser.User user) async{
    try {
    final UserCredential result = await auth.signInWithEmailAndPassword(
      email: user.email, 
      password: user.password,
      );

        print("Usuário logado: ${result.user!.uid}");
    } on FirebaseAuthException catch (e){
      print("Erro FirebaseAuth: ${e.code} - ${e.message}");
    } catch (e) {
        print("Erro inesperado: $e");
      }
    }
  }