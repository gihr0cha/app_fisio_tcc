import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../assets/colors/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? erroMessage;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    try {
      if (validateAndSave()) {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email!, password: _password!);
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "user-not-found":
            erroMessage = 'Nenhum usuário encontrado';
            break;
          case "wrong-password":
            erroMessage = 'Senha errada';
            break;
          default:
            erroMessage = 'Erro desconhecido';
        }
      } else {
        erroMessage = 'Erro desconhecido';
      }
      mensagem(context, erroMessage);
    }
  }

  void mensagem(BuildContext context, String? erroMessage) {
    final snackBar = SnackBar(
      content: Text(erroMessage!),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.greenApp, AppColors.gradienteBaixo],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 240,
                margin: const EdgeInsets.only(top: 150),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? 'lib/assets/images/LogoFisioConecta.png'
                      : 'lib/assets/images/LogoFisioConectaBranco.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gerenciamento de pacientes para fisioterapeutas.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          color: AppColors.blackApp,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteApp,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Digite seu email',
                          labelText: 'Email:',
                          labelStyle: const TextStyle(
                              color: AppColors.blackApp, fontSize: 18),
                        ),
                        cursorColor: AppColors.greyApp,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          color: AppColors.blackApp,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo é obrigatório.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteApp,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Senha:',
                          hintText: 'Digite sua senha',
                          labelStyle: const TextStyle(
                              color: AppColors.blackApp, fontSize: 18),
                        ),
                        cursorColor: AppColors.greyApp,
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () => context.go('/home'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenApp,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                                color: AppColors.whiteApp,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Não possui uma conta?',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greyApp),
                          ),
                          TextButton(
                            onPressed: () => context.go('/createAccount'),
                            child: const Text(
                              'Clique aqui!',
                              style: TextStyle(
                                color: AppColors.greyApp,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
