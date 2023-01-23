import 'package:clone_heberlove/components/container_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

import '../components/buttons.dart';
import '../components/input.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          const ContainerImage(),
          Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 400,
                  height: 720,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(233, 252, 239, 0.5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 36,
                            ),
                            child: Text(
                              "Sign to your account",
                              style: GoogleFonts.karla(
                                color: const Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                backgroundColor:
                                    const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Input(
                            type: TextInputType.emailAddress,
                            controller: _email,
                            label: 'Email',
                            validetion: Validatorless.multiple(
                              [
                                Validatorless.email('Value is not email'),
                                Validatorless.required('filed is required')
                              ],
                            ),
                            prefixoIcone: Icons.email,
                            hideText: false,
                            suffixoIcon: false,
                          ),
                          Input(
                            controller: _password,
                            type: TextInputType.number,
                            label: 'Password',
                            validetion: Validatorless.multiple(
                              [
                                Validatorless.min(6, 'field min 6'),
                                Validatorless.required('filed is required')
                              ],
                            ),
                            prefixoIcone: Icons.lock,
                            hideText: true,
                            suffixoIcon: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 26,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.karla(
                                  color: const Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  backgroundColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Buttons(
                              func: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  // Navigator.pop(context);
                                }
                              },
                              text: 'Login',
                            ),
                            Buttons(
                              text: 'I don’t have account',
                              func: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => const Cadastro()),
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
