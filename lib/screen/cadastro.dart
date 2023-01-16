import 'package:clone_heberlove/components/container_image.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              controller: _name,
                              maxLength: 40,
                              validator: Validatorless.multiple(
                                [
                                  Validatorless.required('filed is required'),
                                  Validatorless.min(4, 'field min 4')
                                ],
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.karla(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const OutlineInputBorder(),
                                labelText: 'Your Name',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              controller: _email,
                              maxLength: 20,
                              validator: Validatorless.multiple([
                                Validatorless.email('Value is not email'),
                                Validatorless.required('filed is required')
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.karla(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const OutlineInputBorder(),
                                labelText: 'Email',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              controller: _phone,
                              maxLength: 11,
                              validator: Validatorless.multiple([
                                Validatorless.number('Value not a number'),
                                Validatorless.max(11, 'fild max 11'),
                                Validatorless.min(11, 'fild min 11'),
                                Validatorless.required('filed is required')
                              ]),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.karla(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const OutlineInputBorder(),
                                labelText: 'Phone',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              controller: _password,
                              maxLength: 20,
                              validator: Validatorless.multiple([
                                Validatorless.required('filed is required'),
                                Validatorless.min(6, 'field min 6')
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.karla(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                    child: Icon(
                                      color: Colors.black,
                                      showPassword == false
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    }),
                              ),
                              obscureText: showPassword == false ? true : false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              controller: _comfirmPassword,
                              maxLength: 20,
                              validator: Validatorless.multiple([
                                Validatorless.required('filed is required'),
                                Validatorless.min(6, 'field min 6'),
                                Validatorless.compare(
                                    _password, 'Passwords do not match')
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.karla(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const OutlineInputBorder(),
                                labelText: 'Repeat Password',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              obscureText: showPassword == false ? true : false,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Register',
                                style: GoogleFonts.karla(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              'I have an account',
                              style: GoogleFonts.karla(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
