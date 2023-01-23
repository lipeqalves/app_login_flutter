import 'package:clone_heberlove/components/container_image.dart';
import 'package:clone_heberlove/components/input.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

import '../components/buttons.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _comfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
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
                              vertical: 10,
                            ),
                            child: Text(
                              "Create your account",
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
                              controller: _name,
                              type: TextInputType.name,
                              label: 'Your Name',
                              validetion: Validatorless.multiple(
                                [
                                  Validatorless.required('filed is required'),
                                  Validatorless.min(4, 'field min 4')
                                ],
                              ),
                              prefixoIcone: Icons.person,
                              hideText: false,
                              suffixoIcon: false),
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
                              suffixoIcon: false),
                          Input(
                              controller: _phone,
                              type: TextInputType.phone,
                              label: 'Phone',
                              validetion: Validatorless.multiple(
                                [
                                  Validatorless.number('Value not a number'),
                                  Validatorless.max(11, 'fild max 11'),
                                  Validatorless.min(11, 'fild min 11'),
                                  Validatorless.required('filed is required')
                                ],
                              ),
                              prefixoIcone: Icons.phone_android,
                              hideText: false,
                              suffixoIcon: false),
                          Input(
                              controller: _password,
                              type: TextInputType.number,
                              label: 'Password',
                              validetion: Validatorless.multiple(
                                [
                                  Validatorless.required('filed is required'),
                                  Validatorless.min(6, 'field min 6')
                                ],
                              ),
                              prefixoIcone: Icons.lock,
                              hideText: true,
                              suffixoIcon: true),
                          Input(
                            controller: _comfirmPassword,
                            type: TextInputType.number,
                            label: 'Repeat Password',
                            validetion: Validatorless.multiple(
                              [
                                Validatorless.required('filed is required'),
                                Validatorless.min(6, 'field min 6'),
                                Validatorless.compare(
                                    _password, 'Passwords do not match')
                              ],
                            ),
                            prefixoIcone: Icons.lock,
                            hideText: true,
                            suffixoIcon: true,
                          ),
                        ],
                      ),
                      Column(
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
                                Navigator.pop(context);
                              }
                            },
                            text: 'Register',
                          ),
                          Buttons(
                            func: () {
                              Navigator.pop(context);
                            },
                            text: 'I have an account',
                          ),
                        ],
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
