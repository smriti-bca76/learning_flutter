import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  final _form = FormGroup({
    'name': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        Validators.pattern(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$'),
      ],
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'comment': FormControl<String>(),
    'termsAccepted': FormControl<bool>(validators: [Validators.requiredTrue]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Reactive Form Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ReactiveForm(
        formGroup: _form,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReactiveTextField<String>(
                  key: const Key('name'),
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Email Cannot be empty',
                    ValidationMessage.minLength: (_) =>
                        'Field must be at least 3 characters long',
                    ValidationMessage.pattern: (_) =>
                        'Incorrect pattern: invalid characters',
                  },
                ),
                const SizedBox(height: 4),
                ReactiveTextField<String>(
                  key: const Key('email'),
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Please enter some text',
                    ValidationMessage.email: (_) =>
                        'Incorrect pattern: invalid email',
                  },
                ),
                const SizedBox(height: 4),
                ReactiveTextField<String>(
                  key: const Key('comment'),
                  formControlName: 'comment',
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  maxLines: 5,
                  maxLength: 120,
                ),
                const SizedBox(height: 4),
                ReactiveCheckboxListTile(
                  key: const Key('termsAccepted'),
                  formControlName: 'termsAccepted',
                  title: const Text('Accept terms and conditions'),
                ),
                const SizedBox(height: 4),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => ElevatedButton(
                    onPressed: form.valid
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${form.value['name']}'),
                                    Text('Email: ${form.value['email']}'),
                                    Text('Comment: ${form.value['comment']}'),
                                  ],
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 137, 176, 158),
                              ),
                            );
                          }
                        : null,
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
