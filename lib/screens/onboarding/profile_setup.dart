import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSetupScreen extends StatefulWidget {
  static const String routeName = '/profile-setup';

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen>
    with AfterLayoutMixin<ProfileSetupScreen> {
  bool isGuest = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void afterFirstLayout(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 500), () {
      var user = Provider.of<User>(context, listen: false);

      _nameController.text = user.name;
      _emailController.text = user.email;

      if (user.email == null || user.email.isEmpty)
        setState(() => this.isGuest = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          OnboardingHeader(),
          SizedBox(height: 50),
          Icon(
            Icons.person,
            size: 42,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 10),
          Text(
            S.of(context).profileSetupTextHeadline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: S.of(context).profileSetupLabelTextFullName,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              enabled: isGuest,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: S.of(context).profileSetupLabelTextEmailAddress,
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ThriftyButton(
              title: S.of(context).profileSetupButtonTextNext,
              onPressed: () async {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty) return;

                await UserDatabaseService(user)
                    .updateUserName(_nameController.text);
                await UserDatabaseService(user)
                    .updateUserEmail(_emailController.text);

                Navigator.pushReplacementNamed(
                  context,
                  CurrencySetupScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
