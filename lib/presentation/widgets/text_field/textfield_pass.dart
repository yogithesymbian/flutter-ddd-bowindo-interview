import 'package:flutter_wonderwoman_projectscoid/utils/colors.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldPassCpn extends StatefulWidget {
  const TextFieldPassCpn({
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.focusNext,
    this.customIsNext = true,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final String labelText;
  final bool customIsNext;

  @override
  State<TextFieldPassCpn> createState() => _TextFieldPassCpnState();
}

class _TextFieldPassCpnState extends State<TextFieldPassCpn> {
  bool _passwordVisible = false;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? isabelline));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            textInputAction:
                widget.customIsNext == true ? TextInputAction.next : null,
            onSubmitted: (value) {
              widget.focusNode.unfocus();
              FocusScope.of(context).requestFocus(widget.focusNext);
            },
            style: h4(context: context, fontWeight: '600'),
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: widget.labelText,
              contentPadding: const EdgeInsets.all(12),
              fillColor: grey100,
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: grayBlue,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              focusedBorder: createInputDecoration(context, color: blueCrayola),
              enabledBorder: createInputDecoration(context),
            )),
      ],
    );
  }
}
