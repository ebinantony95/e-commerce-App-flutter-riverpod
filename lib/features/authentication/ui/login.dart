import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/reusable_widgets/logo_sen.dart';
import 'package:sneakcom_ecom/common/styles/dark_overlay.dart';
import 'package:sneakcom_ecom/features/authentication/core/screen_controllers/auth_controller.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';
import 'package:sneakcom_ecom/util/constants/sizes.dart';
import 'package:sneakcom_ecom/util/constants/text_strings.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';
import 'package:sneakcom_ecom/util/validators/auth_validators.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  // global form key to identify the state changes in the form
  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authColtrollerProvider);
    final isdark = Helpers.isDarkMode(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // background image
            Positioned.fill(
              child: Image.asset(
                isdark ? Myimages.getStartedDark : Myimages.getStartedLight,
                fit: BoxFit.cover,
              ),
            ), // dark overlay
            DarkOverlay(),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    // logo.......
                    LogoSen(),

                    // email filed.......
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),

                        validator: AuthValidators.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hint: Text(Textstrings.emailHind),
                        ),
                      ),
                    ),

                    // password.......
                    SizedBox(height: AppSizes.spaceBWfields),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),

                        validator: AuthValidators.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hint: Text(Textstrings.passwordHind),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBWfields * 2),

                    // login button..........
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (!_formKey.currentState!.validate()) return;
                                try {
                                  await ref
                                      .read(authColtrollerProvider.notifier)
                                      .login(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      );
                                } catch (e) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Enter valid email and password",
                                      ),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              },
                        child: Text(Textstrings.login),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBWfields),

                    // create acc .............
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isdark ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          context.goNamed('createAcc');
                        },
                        child: Text(
                          Textstrings.createACC,
                          style: TextStyle(
                            color: isdark ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
