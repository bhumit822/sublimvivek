import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.textStyle,
    this.keyboardType,
    this.borderColor,
    this.fillColor,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final List<TextInputFormatter?>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      enabled: enabled,
      borderRaduis: 10,
      hintStyle: style ??
          AppTextStyle.regular12.copyWith(color: AppColors.textGrayColor),
      textStyle: textStyle ?? AppTextStyle.regular12,
      controller: controller,
      style: style,
      prefixIcon: prefixIcon,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      borderColor: borderColor,
      textInputAction: textInputAction,
      // inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.borderRaduis,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    this.autovalidateMode,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.borderColor,
    this.filledColor,
    this.enabled,
    this.ObscureText,
    this.border,
    this.readonly,
    this.textAlign = TextAlign.left,
    this.contentPadding,
  }) : super(key: key);

  final Key? fieldKey;
  final bool? readonly;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? borderColor;

  final Color? filledColor;
  bool? ObscureText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  double? borderRaduis;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;
  final BorderSide? border;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return textFormField(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      obscureText: ObscureText ?? false,
      fieldKey: fieldKey,
      focusNode: focusNode,
      hintText: hintText,
      controller: controller,
      borderRaduis: borderRaduis ?? 10,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      enabled: enabled ?? true,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      border: border,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(20, 15, 10, 15),
      textStyle: AppTextStyle.semiBold14
          .copyWith(color: AppColors.blackColor, fontWeight: FontWeight.w500),
      hintStyle: hintStyle ??
          AppTextStyle.regular12.copyWith(color: AppColors.textGrayColor),
      borderColor: borderColor,
      filledColor: filledColor,
    );
  }
}

// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget({
//     Key? key,
//     this.fieldKey,
//     this.hintText,
//     this.textStyle,
//     this.hintStyle,
//     this.validator,
//     this.prefixIcon,
//     required this.controller,
//     this.focusNode,
//     this.maxLines,
//     this.maxLength,
//     this.suffixIcon,
//     this.onTap,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.textInputAction,
//     this.keyboardType,
//     this.borderColor,
//     this.filledColor,
//     this.enabled,
//     this.readonly,
//     this.scropadding,
//     this.textAlign = TextAlign.left,
//     this.contentPadding,
//   }) : super(key: key);
//   final EdgeInsets? scropadding;
//   final Key? fieldKey;
//   final bool? readonly;
//   final String? hintText;
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final Color? borderColor;
//   final Color? filledColor;
//   final FormFieldValidator<String?>? validator;
//   final ValueChanged<String?>? onFieldSubmitted;
//   final ValueChanged<String?>? onChanged;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final GestureTapCallback? onTap;
//   final int? maxLines;
//   final int? maxLength;
//   final TextInputAction? textInputAction;
//   final TextInputType? keyboardType;
//   final TextAlign textAlign;
//   final bool? enabled;
//   final EdgeInsetsGeometry? contentPadding;

//   @override
//   Widget build(BuildContext context) {
//     return textFormField(
//       fieldKey: fieldKey,
//       focusNode: focusNode,
//       hintText: hintText,
//       scropadding: scropadding,
//       controller: controller,
//       borderRaduis: 10,
//       keyboardType: keyboardType ?? TextInputType.text,
//       validator: validator,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       maxLength: maxLength,
//       maxLines: maxLines,
//       enabled: enabled ?? true,
//       textInputAction: textInputAction,

//       textAlign: textAlign,
//       onTap: onTap,
//       onFieldSubmitted: onFieldSubmitted,
//       onChanged: onChanged,
//       contentPadding:
//           contentPadding ?? const EdgeInsets.fromLTRB(20, 15, 10, 15),
//       textStyle: textStyle,
//       hintStyle:
//           hintStyle ?? AppTextStyle.regular12.copyWith(color: AppColors.textGrayColor),
//       borderColor: borderColor,
//       filledColor: filledColor,
//     );
//   }
// }

class OutlineTextFormFieldWidget extends StatelessWidget {
  const OutlineTextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.enabled,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      enabled: enabled,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textStyle: textStyle,
      hintStyle: hintStyle,
    );
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.filledColor,
    this.hintStyle,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        enabled: enabled,
        fieldKey: fieldKey,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        hintText: hintText,
        hintStyle: AppTextStyle.semiBold14,
        textStyle: AppTextStyle.semiBold14,
        filledColor: AppColors.textWhiteColor,
        borderColor: Colors.transparent);
  }
}

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onFieldSubmit;
  final Function(String?)? onFieldChange;
  final Function()? onSubmit;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  TextEditingController? controller;

  SearchBar({
    Key? key,
    this.hintText,
    this.onFieldSubmit,
    this.onSubmit,
    this.onFieldChange,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      onFieldSubmitted: onFieldSubmit,
      hintText: hintText ?? "Search here...",
      hintStyle: AppTextStyle.semiBold14,
      prefixIcon: prefixIcon ??
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: AppColors.blackColor,
            ),
            splashRadius: 5,
            onPressed: onSubmit,
          ),
      onChanged: onFieldChange,
      borderColor: Colors.red,
      filledColor: AppColors.textWhiteColor,
    );
  }
}

TextFormField textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final double? borderRaduis = 0,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Color? borderColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.sentences,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? border,
  final EdgeInsetsGeometry? contentPadding,
  final bool? readonly,
  final InputBorder? errorBorder,
  final AutovalidateMode? autovalidateMode,
}) {
  return TextFormField(
    // scrollPadding:
    //     EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom - 20),
    autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
    key: fieldKey,
    readOnly: readonly ?? false,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: AppColors.blackColor,
    cursorHeight: 20,
    style: textStyle ?? AppTextStyle.regular12,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(20, 18, 10, 18),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis!),
        borderSide: border ?? BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis),
        borderSide: border ?? BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis),
        borderSide: border ?? BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis),
        borderSide: border ?? BorderSide.none,
      ),
      errorMaxLines: 5,
      fillColor: filledColor ?? AppColors.textWhiteColor,
      filled: true,
      hintStyle: hintStyle ??
          AppTextStyle.semiBold14.copyWith(color: AppColors.textGrayColor),
      hintText: hintText,
      enabled: enabled ?? true,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

TextFormField underLineTextFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final double? borderRaduis = 0,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Color? borderColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextStyle? LabelStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.sentences,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? border,
  final EdgeInsetsGeometry? contentPadding,
  final bool? readonly,
  final InputBorder? errorBorder,
  final AutovalidateMode? autovalidateMode,
}) {
  return TextFormField(
    // scrollPadding:
    //     EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom - 20),
    autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
    key: fieldKey,
    readOnly: readonly ?? false,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: cursorColor,
    cursorHeight: 20,

    style: textStyle ?? AppTextStyle.regular12,
    decoration: InputDecoration(
      labelStyle: LabelStyle,
      prefixIcon: prefixIcon,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(20, 18, 10, 18),
      errorBorder: UnderlineInputBorder(
        borderSide: border ?? BorderSide.none,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: border ?? BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: border ?? BorderSide.none,
      ),
      border: UnderlineInputBorder(
        borderSide: border ?? BorderSide.none,
      ),
      errorMaxLines: 5,
      fillColor: filledColor ?? AppColors.textWhiteColor,
      filled: true,
      hintStyle: hintStyle ??
          AppTextStyle.semiBold14.copyWith(color: AppColors.textGrayColor),
      hintText: hintText,
      enabled: enabled ?? true,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

// TextFormField textFormField({
//   final Key? fieldKey,
//   final String? hintText,
//   final String? labelText,
//   final String? helperText,
//   final String? initialValue,
//   final int? errorMaxLines,
//   final int? maxLines,
//   final int? maxLength,
//   final double? borderRaduis = 0,
//   final bool? enabled,
//   final bool autofocus = false,
//   final bool obscureText = false,
//   final Color? filledColor,
//   final Color? cursorColor,
//   final Color? borderColor,
//   final Widget? prefixIcon,
//   final Widget? suffixIcon,
//   final FocusNode? focusNode,
//   final TextStyle? style,
//   final TextStyle? textStyle,
//   final TextStyle? hintStyle,
//   final TextAlign textAlign = TextAlign.left,
//   final TextEditingController? controller,
//   final List<TextInputFormatter>? inputFormatters,
//   final TextInputAction? textInputAction,
//   final TextInputType? keyboardType,
//   final TextCapitalization textCapitalization = TextCapitalization.none,
//   final GestureTapCallback? onTap,
//   final FormFieldSetter<String?>? onSaved,
//   final FormFieldValidator<String?>? validator,
//   final ValueChanged<String?>? onChanged,
//   final ValueChanged<String?>? onFieldSubmitted,
//   final BorderSide? border,
//   final EdgeInsetsGeometry? contentPadding,
//   final bool? readonly,
//   final EdgeInsets? scropadding,
// }) {
//   return TextFormField(
//     scrollPadding: scropadding ?? EdgeInsets.zero,
//     key: fieldKey,
//     readOnly: readonly ?? false,
//     controller: controller,
//     focusNode: focusNode,
//     maxLines: maxLines,
//     initialValue: initialValue,
//     keyboardType: keyboardType,
//     textCapitalization: textCapitalization,
//     obscureText: obscureText,
//     enabled: enabled,
//     validator: validator,
//     maxLength: maxLength,
//     textInputAction: textInputAction,
//     inputFormatters: inputFormatters,
//     onTap: onTap,
//     onSaved: onSaved,
//     onChanged: onChanged,
//     onFieldSubmitted: onFieldSubmitted,
//     autocorrect: true,
//     autofocus: autofocus,
//     textAlign: textAlign,
//     cursorColor: AppColors.blackColor,
//     cursorHeight: 20,
//     style: textStyle ?? AppTextStyle.regular12,
//     decoration: InputDecoration(
//       prefixIcon: prefixIcon,
//       contentPadding:
//           contentPadding ?? const EdgeInsets.fromLTRB(20, 18, 10, 18),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(borderRaduis!),
//         borderSide: border ?? BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(borderRaduis),
//         borderSide: border ?? BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(borderRaduis),
//         borderSide: border ?? BorderSide.none,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(borderRaduis),
//         borderSide: border ?? BorderSide.none,
//       ),
//       errorMaxLines: 5,
//       fillColor: filledColor ?? AppColors.textWhiteColor,
//       filled: true,
//       hintStyle:
//           hintStyle ?? AppTextStyle.semiBold14.copyWith(color: AppColors.textGrayColor),
//       hintText: hintText,
//       enabled: enabled ?? true,
//       suffixIcon: suffixIcon,
//       labelText: labelText,
//       helperText: helperText,
//     ),
//   );
// }

TextFormField outlineTextField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: AppColors.textGrayColor,
    cursorHeight: 20,
    style: textStyle ?? AppTextStyle.regular12,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      border: outlineBorderDecoration,
      enabledBorder: outlineBorderDecoration,
      focusedBorder: outlineBorderDecoration,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.zero,
      ),
      hintText: hintText,
      hintStyle: hintStyle ?? AppTextStyle.regular12,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

OutlineInputBorder outlineBorderDecoration = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.iconSelectedColor, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ));



// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget({
//     Key? key,
//     this.fieldKey,
//     this.hintText,
//     this.validator,
//     this.prefixIcon,
//     this.controller,
//     this.focusNode,
//     this.maxLines,
//     this.maxLength,
//     this.suffixIcon,
//     this.onTap,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.textInputAction,
//     this.keyboardType,
//     this.filledColor,
//     this.hintStyle,
//     this.style,
//     this.focusBorder,
//     this.border,
//     this.enabledBorder,
//     this.cursorColor,
//     this.textAlign = TextAlign.left,
//   }) : super(key: key);

//   final Key? fieldKey;
//   final String? hintText;
//   final FormFieldValidator<String?>? validator;
//   final ValueChanged<String?>? onFieldSubmitted;
//   final ValueChanged<String?>? onChanged;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final GestureTapCallback? onTap;
//   final int? maxLines;
//   final int? maxLength;
//   final TextInputAction? textInputAction;
//   final TextInputType? keyboardType;
//   final TextAlign textAlign;
//   final Color? filledColor;
//   final Color? cursorColor;
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final BorderSide? focusBorder;
//   final BorderSide? border;
//   final BorderSide? enabledBorder;

//   @override
//   Widget build(BuildContext context) {
//     return textFormField(
//       fieldKey: fieldKey,
//       focusNode: focusNode,
//       hintText: hintText,
//       filledColor: filledColor,
//       style: style,
//       hintStyle: hintStyle,
//       controller: controller,
//       cursorColor: cursorColor,
//       keyboardType: keyboardType,
//       validator: validator,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       maxLength: maxLength,
//       maxLines: maxLines,
//       textInputAction: textInputAction,
//       textAlign: textAlign,
//       onTap: onTap,
//       onFieldSubmitted: onFieldSubmitted,
//       onChanged: onChanged,
//       focusBorder: focusBorder,
//       border: border,
//       enabledBorder: enabledBorder,
//     );
//   }
// }

// TextFormField textFormField({
//   final Key? fieldKey,
//   final String? hintText,
//   final String? labelText,
//   final String? helperText,
//   final String? initialValue,
//   final int? errorMaxLines,
//   final int? maxLines,
//   final int? maxLength,
//   final bool? enabled,
//   final bool autofocus = false,
//   final bool? obscureText,
//   final Color? filledColor,
//   final Color? cursorColor,
//   final prefixIcon,
//   final Widget? suffixIcon,
//   final FocusNode? focusNode,
//   final TextStyle? style,
//   final TextStyle? hintStyle,
//   final TextAlign textAlign = TextAlign.left,
//   final TextEditingController? controller,
//   final List<TextInputFormatter>? inputFormatters,
//   final TextInputAction? textInputAction,
//   final TextInputType? keyboardType,
//   final TextCapitalization textCapitalization = TextCapitalization.none,
//   final GestureTapCallback? onTap,
//   final FormFieldSetter<String?>? onSaved,
//   final FormFieldValidator<String?>? validator,
//   final ValueChanged<String?>? onChanged,
//   final ValueChanged<String?>? onFieldSubmitted,
//   final BorderSide? focusBorder,
//   final BorderSide? enabledBorder,
//   final BorderSide? border,
// }) {
//   return TextFormField(
//     key: fieldKey,
//     controller: controller,
//     focusNode: focusNode,
//     maxLines: maxLines ?? 1,
//     initialValue: initialValue,
//     keyboardType: keyboardType,
//     textCapitalization: textCapitalization,
//     obscureText: obscureText ?? false,
//     enabled: enabled,
//     validator: validator,
//     maxLength: maxLength,
//     textInputAction: textInputAction,
//     inputFormatters: inputFormatters,
//     onTap: onTap,
//     onSaved: onSaved,
//     onChanged: onChanged,
//     onFieldSubmitted: onFieldSubmitted,
//     autocorrect: true,
//     autofocus: autofocus,
//     textAlign: textAlign,
//     cursorColor: cursorColor ?? AppColors.blackColor,
//     cursorHeight: 20,
//     cursorWidth: 1,
//     style: style ??
        // const TextStyle(
        //   color: AppColors.blackColor,
        //   fontSize: 14,
        //   fontWeight: FontWeight.w400,
        // ),
//     decoration: InputDecoration(
//       prefixIcon: prefixIcon,
//       contentPadding: const EdgeInsets.fromLTRB(18, 17, 0, 17),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: border ?? BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: enabledBorder ?? BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: focusBorder ?? BorderSide.none,
//       ),
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(
//           color: red,
//         ),
//       ),
//       errorMaxLines: 5,
//       fillColor: filledColor ?? AppColors.textWhiteColor,
//       filled: true,
//       hintStyle: hintStyle ??
//           const TextStyle(
//             color: textFieldTitleColor,
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//           ),
//       hintText: hintText,
//       counterText: "",
//       suffixIcon: suffixIcon,
//       labelText: labelText,
//       helperText: helperText,
//     ),
//   );
// }
