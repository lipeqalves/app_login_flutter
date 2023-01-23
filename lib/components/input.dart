import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String label = '';
  String? Function(String?) validetion;
  final IconData? prefixoIcone;
  bool hideText = false;
  bool suffixoIcon = false;
  TextInputType? type;

  Input({
    super.key,
    required this.controller,
    required this.label,
    required this.validetion,
    required this.prefixoIcone,
    required this.hideText,
    required this.suffixoIcon,
    this.type,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validetion,
        keyboardType: widget.type,
        decoration: InputDecoration(
          labelStyle: GoogleFonts.karla(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(),
          labelText: widget.label,
          prefixIcon: widget.prefixoIcone != null
              ? Icon(
                  widget.prefixoIcone,
                  color: Colors.black,
                )
              : null,
          suffixIcon: widget.suffixoIcon == true
              ? GestureDetector(
                  child: Icon(
                    widget.hideText == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      widget.hideText = !widget.hideText;
                    });
                  })
              : null,
        ),
        obscureText: widget.hideText,
      ),
    );
  }
}
