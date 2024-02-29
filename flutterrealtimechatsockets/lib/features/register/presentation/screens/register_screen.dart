import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterrealtimechatsockets/core/l10n/generated/l10n.dart';
import 'package:flutterrealtimechatsockets/core/widgets/custom_elevated_button_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/custom_input_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/labels_widget.dart';
import 'package:flutterrealtimechatsockets/core/widgets/logo_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                LogoWidget(
                  text: L10n.of(context).register,
                ),
                const _LoginForm(),
                LabelsWidget(
                  subtitle: L10n.of(context).haveAccount,
                  onTap: () {
                    context.pop();
                  },
                  title: L10n.of(context).loginNow,
                ),
                Text(
                  L10n.of(context).termsAndConditions,
                  style: const TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          hintText: L10n.of(context).email,
          iconData: Icons.email_outlined,
          textInputType: TextInputType.emailAddress,
          textEditingController: emailCtrl,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          hintText: L10n.of(context).password,
          iconData: Icons.lock_outline,
          textInputType: TextInputType.visiblePassword,
          textEditingController: passwordCtrl,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(
          text: L10n.of(context).register,
          onPressed: () {},
        )
      ]),
    );
  }
}
