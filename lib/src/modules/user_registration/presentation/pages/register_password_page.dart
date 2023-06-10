import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class RegisterPasswordPage extends StatefulWidget {
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void advance() {
    Modular.to.navigate('/register_password');
  }

  void cancel() {
    Modular.to.navigate('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      children: [
                        ReturnButton(onTap: cancel),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: AppBanner(
                      title: 'Por fim, vamos definir a sua senha!',
                      titleSize: 18,
                      titleHexColor: '808080'),
                ),
                const SizedBox(height: 120),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Informe a sua senha',
                  obscureText: true,
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    '(Deve ter no mínimo 8 dígito e conter '
                    'pelo menos uma letra, um número e um caractere especial.)',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirme a sua senha',
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: 150,
          child: SaveCancelButtons(
              saveText: 'Finalizar', onSaveTap: advance, onCancelTap: cancel)),
    );
  }
}