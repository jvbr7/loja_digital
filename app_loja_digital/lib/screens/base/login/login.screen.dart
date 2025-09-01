import 'package:app_loja_digital/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:app_loja_digital/helpers/validators.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 bool emailValid(String email) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType : TextInputType.emailAddress,
                    autocorrect: false,
                    validator:(email){
                      if(email == null || emailValid(email)){
                        return null;
                      }
                    },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: passController,
                    decoration: const InputDecoration(hintText: 'Senha'),
                    autocorrect: false,
                    obscureText: true,
                    validator:(pass){
                      if(pass == null || pass.isEmpty || pass.length < 6) {
                        return 'Senha invalida (mínimo 6 caracteres)';
                      }
                      return null;
                    },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        context.read<UserManager>().signIn(
                          User(
                            email: emailController.text,
                            password: passController.text,
                          )
                        );
                      }
                       // ação de recuperação de senha
                    },
                    child: const Text(
                      'Esqueci minha senha'
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: (){
                      if (formKey.currentState!.validate()) {
                        // Se todos os campos estiverem válidos
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login válido!')),
                        );
                      }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                ),
              ],
            ),
        ),
      ),
    ),
    );
  }
}
