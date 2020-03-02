import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/screens/onboarding/currency_setup.dart';
import 'package:bethriftytoday/services/database/user_db.dart';
import 'package:bethriftytoday/shared/onboarding_header.dart';
import 'package:bethriftytoday/shared/thrifty_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSetupScreen extends StatefulWidget {
  static const String routeName = '/profile-setup';

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen>
    with AfterLayoutMixin<ProfileSetupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void afterFirstLayout(BuildContext context) async {
    updateStatusBarColor();

    Future.delayed(Duration(milliseconds: 500), () {
      var user = Provider.of<User>(context, listen: false);
      _nameController.text = user.name;
      _emailController.text = user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              OnboardingHeader(),
              SizedBox(height: 30),
              Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/person.png'),
              ),
              SizedBox(height: 15),
              Text(
                'Who are you?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: TextField(
                  enabled: false,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
              ),
              Spacer(),
              ThriftyButton(
                title: 'NEXT',
                onPressed: () async {
                  await UserDatabaseService(user)
                      .updateUserName(_nameController.text);
                  Navigator.pushNamed(context, CurrencySetupScreen.routeName);
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
