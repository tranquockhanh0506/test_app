import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonInput extends StatefulWidget {
  // Controller
  final TextEditingController controller;

  // OnTextChanged function
  final Function(String value)? onChanged;

  // Title label
  final String? title;

  // Suffix
  final Widget? suffixWidget;

  // Suffix
  final Widget? prefixWidget;

  // Enable hide input
  final bool isPassword;

  // Text style
  final TextStyle? style;

  // Prefix text
  final String? prefixText;

  // Prefix text
  final String? hintText;

  // Prefix text
  final int? maxLine;

  // Enable input
  final bool? isEnabled;

  // Enable require
  final bool? isEnabledRequire;

  // is padding left
  final bool? isPaddingLeft;

  // Callback check valid form
  final Function(String)? onCheckValue;

  // Enable check validate form
  final bool? isCheckValidate;
  final List<TextInputFormatter>? textInputFormater;

  // Field name when show validate empty
  final String? fieldName;

  // Input type
  final TextInputType? textInputType;

  // Custom error text
  final String? customErrorText;

  // max length
  final int? maxLength;

  // is focus
  final Function(bool)? isFocus;

  final BoxConstraints? prefixIconConstraints;

  // onTap

  final GestureTapCallback? onTap;

  // readOnly
  final bool? readOnly;

  final Widget? lable;
  final bool bgrColor;

  const CommonInput(
      {Key? key,
      this.textInputFormater,
      required this.controller,
      this.onChanged,
      this.title,
      this.suffixWidget,
      this.isPassword = false,
      this.isEnabled = true,
      this.isCheckValidate = false,
      this.prefixText,
      this.prefixIconConstraints,
      this.style,
      this.hintText,
      this.maxLine,
      this.isEnabledRequire,
      this.isPaddingLeft,
      this.onCheckValue,
      this.fieldName,
      this.textInputType,
      this.customErrorText,
      this.isFocus,
      this.prefixWidget,
      this.maxLength,
      this.onTap,
      this.readOnly,
      this.lable,
      this.bgrColor = false})
      : super(key: key);

  @override
  State<CommonInput> createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  // isFocus flag
  bool _isFocus = false;

  // Error text validate
  String? _errorText;

  // Check validate input form

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: widget.maxLine == null ? 60 : null,
              width: double.infinity,
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    if (widget.isFocus != null) {
                      widget.isFocus!(hasFocus);
                    }
                    _isFocus = hasFocus;
                  });
                  if (!hasFocus && widget.isCheckValidate!) {}
                },
                child: TextField(
                  readOnly: widget.readOnly ?? false,
                  key: widget.key,
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  cursorColor: Colors.black,
                  obscureText: widget.isPassword,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  keyboardType: widget.textInputType,
                  inputFormatters: widget.textInputFormater,
                  decoration: InputDecoration(
                    label: widget.lable,
                    filled: true,
                    fillColor: widget.bgrColor == true
                        ? Color(0xfff7f7f7)
                        : Colors.white,
                    enabled: widget.isEnabled ?? true,
                    hintText: widget.hintText,
                    hintStyle: widget.bgrColor == false
                        ? TextStyle(color: Color(0xff999999))
                        : TextStyle(
                      color: Color(0xffadb4c3),fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    prefixText: widget.prefixText,
                    prefixIcon: widget.prefixWidget,
                    suffixIcon: widget.suffixWidget,
                    prefixIconConstraints: widget.prefixIconConstraints,
                    isDense: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.only(
                        left: 100, top: 20, right: 20, bottom: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff28c1bc), width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff999999), width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.bgrColor == true
                                ? Color(0xfff7f7f7)
                                : Color(0xff999999),
                            width: 1),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onTap: widget.onTap,
                ),
              ),
            ),
            Visibility(
              visible: _isFocus && widget.title != null,
              child: Positioned(
                  top: -8,
                  left: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: widget.title ?? '',
                                    style: TextStyle(color: Color(0xff28c1bc))),
                                widget.isEnabledRequire == true
                                    ? TextSpan(
                                        text: '*',
                                        style:
                                            TextStyle(color: Color(0xffffaa00)))
                                    : const TextSpan(),
                              ],
                            ),
                          ),
                        )),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
