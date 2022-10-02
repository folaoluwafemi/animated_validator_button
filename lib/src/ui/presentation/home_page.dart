import 'package:animated_button_validator/src/ui/presentation/widgets/animated_hover_listener.dart';
import 'package:animated_button_validator/src/ui/presentation/widgets/button.dart';
import 'package:animated_button_validator/src/ui/utils/extensions.dart';
import 'package:animated_button_validator/src/ui/utils/functions.dart';
import 'package:animated_button_validator/src/ui/utils/validators.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder<bool>(
                  valueListenable: fieldValidatedNotifier,
                  builder: (context, validated, _) {
                    return TextFormField(
                      decoration: Ui.fieldDecoration(validated: validated),
                      validator: (value) => Validators.emptyFieldValidator(
                        value,
                        onValidated: (validated) {
                          nameValidated = validated;
                          checkFieldsValidatedAndUpdateNotifier();
                        },
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    );
                  }),
              10.boxHeight,
              ValueListenableBuilder<bool>(
                  valueListenable: fieldValidatedNotifier,
                  builder: (context, validated, _) {
                    return TextFormField(
                      decoration: Ui.fieldDecoration(validated: validated),
                      validator: (value) => Validators.emailValidator(
                        value,
                        onValidated: (validated) {
                          emailValidated = validated;
                          checkFieldsValidatedAndUpdateNotifier();
                        },
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    );
                  }),
              10.boxHeight,
              ValueListenableBuilder<bool>(
                  valueListenable: fieldValidatedNotifier,
                  builder: (context, validated, _) {
                    return TextFormField(
                      decoration: Ui.fieldDecoration(validated: validated),
                      validator: (value) => Validators.lengthLimitValidator(
                        value,
                        8,
                        onValidated: (validated) {
                          passwordValidated = validated;
                          checkFieldsValidatedAndUpdateNotifier();
                        },
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                    );
                  }),
              20.boxHeight,
              ValueListenableBuilder<bool>(
                valueListenable: fieldValidatedNotifier,
                builder: (context, validated, _) {
                  return AnimatedHoverListener(
                    escapeHover: !validated,
                    child: Button(
                      width: 120,
                      color: validated ? Colors.green : null,
                      onPressed: onSubmitPressed,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool nameValidated = false;
  bool emailValidated = false;
  bool passwordValidated = false;

  bool get fieldsValidated =>
      nameValidated && emailValidated && passwordValidated;

  ValueNotifier<bool> fieldValidatedNotifier = ValueNotifier<bool>(false);

  void checkFieldsValidatedAndUpdateNotifier() {
    if (fieldsValidated) {
      if (!(fieldValidatedNotifier.value)) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          fieldValidatedNotifier.value = true;
        });
      }
    } else {
      if ((fieldValidatedNotifier.value)) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          fieldValidatedNotifier.value = false;
        });
      }
    }
  }

  void onSubmitPressed() {
    print('submit pressed');
  }
}


