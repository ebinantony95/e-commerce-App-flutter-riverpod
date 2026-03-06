import 'package:firebase_auth/firebase_auth.dart';
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

class CreateAccount extends ConsumerStatefulWidget {
  const CreateAccount({super.key});

  @override
  ConsumerState<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount> {
  // global form key to identify the state changes in the form
  final _formKey = GlobalKey<FormState>();
  // text editing controllers
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
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
            // background image.....................
            Positioned.fill(
              child: Image.asset(
                isdark ? Myimages.getStartedDark : Myimages.getStartedLight,
                fit: BoxFit.cover,
              ),
            ),
            // dark overlay........................
            DarkOverlay(),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    LogoSen(),
                    // name..........
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        controller: nameController,
                        validator: AuthValidators.name,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hint: Text(Textstrings.name),
                        ),
                      ),
                    ),

                    SizedBox(height: AppSizes.spaceBWfields),
                    // email filed.......
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        controller: emailController,
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
                        validator: AuthValidators.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hint: Text(Textstrings.passwordHind),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBWfields * 2),

                    // create acc button..........
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
                                      .createAcc(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                        name: nameController.text.trim(),
                                      );
                                } on FirebaseAuthException catch (e) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message!)),
                                  );
                                }
                              },
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(Textstrings.createACC),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBWfields),

                    SizedBox(height: AppSizes.spaceBWfields * 2),

                    // already have acc........
                    Text(
                      Textstrings.alreayHaveACC,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: AppSizes.spaceBWfields),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isdark ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          context.goNamed('login');
                        },
                        child: Text(
                          Textstrings.login,
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
