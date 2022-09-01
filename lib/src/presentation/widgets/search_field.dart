import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchField extends StatelessWidget {
  final void Function(bool)? onFocusChange;
  final FormGroup formGroup;
  final TextEditingController? controller;
  final void Function()? onSubmitted;
  final Widget? suffixIcon;

  const SearchField({
    Key? key,
    this.onFocusChange,
    required this.formGroup,
    this.controller,
    this.onSubmitted,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: onFocusChange,
        child: ReactiveForm(
          formGroup: formGroup,
          child: ReactiveTextField(
            textAlignVertical: TextAlignVertical.bottom,
            formControlName: 'searchLocation',
            strutStyle: StrutStyle.disabled,
            controller: controller,
            autofocus: false,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.search,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.42,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.42,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.42,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 2,
                ),
                child: suffixIcon,
              ),
              hintText: "Search by country, city...",
              hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              contentPadding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
              errorStyle: const TextStyle(
                fontSize: 0,
              ),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
            validationMessages: (control) => {
              ValidationMessage.required: 'Enter a location to search',
            },
          ),
        ),
      ),
    );
  }
}
