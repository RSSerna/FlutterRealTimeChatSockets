import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/constants/router_paths.dart';
import 'package:flutterrealtimechatsockets/core/widgets/custom_elevated_button_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/custom_input_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/labels_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/logo_widget.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LogoWidget(
                  text: 'Messenger',
                ),
                const LoginForm(),
                LabelsWidget(
                  subtitle: 'Local: No tienes cuenta?',
                  onTap: () {
                    context.push(RouterPaths.register);
                  },
                  title: 'Local:  Crear una ahora!',
                ),
                const Text(
                  'Local: Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          hintText: 'Local: Email',
          iconData: Icons.email_outlined,
          textInputType: TextInputType.emailAddress,
          textEditingController: emailCtrl,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          hintText: 'Local: Password',
          iconData: Icons.lock_outline,
          textInputType: TextInputType.visiblePassword,
          textEditingController: passwordCtrl,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(
          text: 'Local: Log In',
          onPressed: () {},
        )
      ]),
    );
  }
}


