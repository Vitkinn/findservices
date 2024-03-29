import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/modules/login/presentation/controllers/login_controller.dart';
import 'package:findservices/src/modules/shared/components/app_banner.dart';
import 'package:findservices/src/modules/shared/widgets/custom_button.dart';
import 'package:findservices/src/modules/shared/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<LoginController>();
    controller.passwordError.addListener(() {
      setState(() {});
    });
    controller.isLoading.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const AppBanner(title: 'Entrar'),
                      const SizedBox(height: 100),
                      CustomTextField(
                        controller: controller.userNameController,
                        requiredField: true,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Usuário',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        requiredField: true,
                        controller: controller.passwordController,
                        hintText: 'Senha',
                        obscureText: true,
                        errorText: controller.passwordError.value,
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: !controller.isLoading.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  hintText: 'Entrar',
                  color: '14cd84',
                  onTap: () => {controller.login()},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ainda não tem uma conta?',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: const Text(
                        'Registre-se aqui',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
                      ),
                      onTap: () => {controller.register()},
                    ),
                  ],
                ),
                const SizedBox(height: 15.0)
              ],
            ),
          ),
        ),
        if (controller.isLoading.value)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (controller.isLoading.value)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
