import 'package:flutter/material.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';
import '../../../../../shared/components/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  dynamic data;

  RegisterPage(this.data, {super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState(data);
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final dynamic data;

  _RegisterPageState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  'lib/assets/images/FindServices.png',
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Cadastrar-se',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe seu nome completo',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe seu e-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Confirme seu e-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Informe seu CPF',
                  obscureText: false,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onTap: () => {},
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}