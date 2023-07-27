import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/animation_click.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/colors.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldCpn extends StatelessWidget {
  const TextFieldCpn({
    this.controller,
    required this.focusNode,
    required this.labelText,
    this.showSuffixIcon = false,
    this.showPrefixIcon = false,
    this.colorSuffixIcon,
    this.colorPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNext,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.functionPrefix,
    this.functionSuffer,
    this.enabled = true,
    this.hintText,
    this.labelStyle,
    this.customIsNext = true,
    this.customKeyboardType,
    this.validator,
    Key? key,
    this.onChangeCb,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(String? reason)? validator;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final String labelText;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final String? prefixIcon;
  final Color? colorPrefixIcon;
  final String? suffixIcon;
  final Color? colorSuffixIcon;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? functionPrefix;
  final Function()? functionSuffer;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool customIsNext;
  final String? customKeyboardType;
  final Function(dynamic callback)? onChangeCb;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? blueCrayola));
  }

  @override
  Widget build(BuildContext context) {
    final keyboardType = {
      'email': TextInputType.emailAddress,
      'number': TextInputType.number,
      null: TextInputType.text
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            maxLines: maxLines ?? (hasMutilLine ? null : 1),
            minLines: minLines,
            readOnly: readOnly,
            onChanged: (value) {
              // controller?.text = value;
              onChangeCb?.call(value);
            },
            maxLength: maxLength,
            textInputAction: customIsNext == true
                ? TextInputAction.next
                : TextInputAction.done,
            keyboardType: hasMutilLine
                ? TextInputType.multiline
                : keyboardType[customKeyboardType],
            onFieldSubmitted: (value) {
              focusNode.unfocus();
              FocusScope.of(context).requestFocus(focusNext);
            },
            style: h4(context: context, fontWeight: '600'),
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: h4(color: grayBlue),
              fillColor: grey100,
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              prefixIcon: showPrefixIcon
                  ? AnimationClick(
                      function: functionPrefix ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset(
                          prefixIcon ?? 'yogithesymbian',
                          height: 24,
                          width: 24,
                          color: colorPrefixIcon ?? dodgerBlue,
                        ),
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? AnimationClick(
                      function: functionSuffer ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset(
                          suffixIcon ?? 'yogithesymbian',
                          height: 24,
                          width: 24,
                          color: colorSuffixIcon ?? dodgerBlue,
                        ),
                      ),
                    )
                  : const SizedBox(),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              focusedBorder: createInputDecoration(context, color: yoBlue),
              enabledBorder: createInputDecoration(context),
              errorBorder: createInputDecoration(context, color: neonFuchsia),
              enabled: enabled,
            )),
      ],
    );
  }
}
