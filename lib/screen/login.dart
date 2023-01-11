import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1536147210925-5cb7a7a4f9fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Nnx8fGVufDB8fHx8&w=1000&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          child: TextFormField(
                            controller: _email,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.email('Value is not email'),
                                Validatorless.required('filed is required')
                              ],
                            ),
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
                            vertical: 16,
                          ),
                          child: TextFormField(
                            controller: _password,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.min(6, 'field min 6'),
                                Validatorless.required('filed is required')
                              ],
                            ),
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
                                  showPassword == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
                            ),
                            obscureText: showPassword == false ? true : false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 36,
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
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Login',
                                style: GoogleFonts.karla(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const Cadastro()),
                                  ));
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              'I don’t have account',
                              style: GoogleFonts.karla(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
      ),
    );
  }
}
