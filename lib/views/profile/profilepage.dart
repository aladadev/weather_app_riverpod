import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/profile_model.dart';
import 'package:weather_app/providers/profile_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final profile = ref.watch(profileFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: profile.when(
        data: (data) {
          if (data != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      data.name.toString(),
                      style: textStyle.labelLarge,
                    ),
                    leading: const Icon(
                      Icons.man_3_rounded,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChangeNameDialog(data);
                          },
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      data.email.toString(),
                      style: textStyle.labelLarge,
                    ),
                    leading: const Icon(
                      Icons.email,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      data.id.toString(),
                      style: textStyle.labelLarge,
                    ),
                    leading: const Icon(Icons.numbers_rounded),
                  ),
                ],
              ),
            );
          }
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ChangeNameDialog extends ConsumerStatefulWidget {
  const ChangeNameDialog(this.profile, {super.key});
  final ProfileModel profile;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeNameDialogState();
}

class _ChangeNameDialogState extends ConsumerState<ChangeNameDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameEditingController = TextEditingController();

  @override
  void initState() {
    _nameEditingController.text = widget.profile.name;
    super.initState();
  }

  onSave() async {
    if (_formKey.currentState!.validate()) {
      final profileState = widget.profile.copyWith(
        name: _nameEditingController.text.trim(),
      );
      EasyLoading.show(status: 'Updating Profile!');
      await ProfileProvider.updateProfile(profileState).then((value) {
        if (value) {
          ref.invalidate(profileFutureProvider);
        }
      });

      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: const Text('Change Name'),
        content: TextFormField(
          controller: _nameEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your name';
            }
            return null;
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await onSave();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.change_circle_rounded,
            ),
            label: const Text('Change'),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
            label: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
