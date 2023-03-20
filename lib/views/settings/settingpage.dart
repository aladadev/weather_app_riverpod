import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/providers/auth_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text(
                'Sign Out!',
              ),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () async {
                await AuthProvider.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
