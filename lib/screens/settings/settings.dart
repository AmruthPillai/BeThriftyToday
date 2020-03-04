import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/services/auth.dart';
import 'package:bethriftytoday/services/database/user_db.dart';
import 'package:bethriftytoday/services/settings.dart';
import 'package:bethriftytoday/shared/dialogs/currency_selection.dart';
import 'package:bethriftytoday/shared/dialogs/update_name.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_appbar.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var settings = Provider.of<SettingsProvider>(context);

    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: UserDatabaseService(user).userDocument,
        ),
      ],
      child: Scaffold(
        drawer: Drawer(
          child: ThriftyDrawer(),
        ),
        body: Consumer<User>(
          builder: (context, user, _) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ThriftyAppBar(canGoBack: true),
                SizedBox(height: 20),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildHeader('Preferences'),
                    buildDarkModeSwitch(settings),
                    Divider(),
                    buildHeader('Account'),
                    buildNameSetting(context, user),
                    buildEmailSetting(user),
                    buildCurrencySetting(context, user),
                    Divider(),
                    buildHeader('Danger Zone'),
                    buildDeleteAccount(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildNameSetting(BuildContext context, User user) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: thriftyBlue,
      ),
      title: Text(
        'Name',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user.name,
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => UpdateNameDialog(
            name: user.name,
          ),
        );
      },
    );
  }

  ListTile buildEmailSetting(User user) {
    return ListTile(
      enabled: false,
      leading: Icon(
        Icons.mail,
        color: thriftyBlue,
      ),
      title: Text(
        'Email',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user.email,
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  ListTile buildCurrencySetting(BuildContext context, User user) {
    return ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: thriftyBlue,
      ),
      title: Text(
        'Currency',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '${user.currency.symbol} (${user.currency.name})',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CurrencySelectionDialog(),
        );
      },
    );
  }

  Padding buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 4,
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: thriftyBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  ListTile buildDeleteAccount(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.delete_sweep,
        color: Colors.red[800],
      ),
      title: Text(
        'Delete Account',
        style: TextStyle(
          color: Colors.red[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Do you really want to delete your account?',
            ),
            content: Text(
              'You will lose all the data (including profile information and you transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No, I don\'t want to leave'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  try {
                    AuthService().deleteUser();
                  } catch (error) {
                    print('Something went wrong, please try again!');
                  }
                },
                child: Text(
                  'Yes, delete my data',
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );

        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      },
    );
  }

  ListTile buildDarkModeSwitch(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.brightness_medium,
        color: thriftyBlue,
      ),
      title: Text(
        'Dark Mode',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: settings.isDarkMode,
        activeColor: thriftyBlue,
        onChanged: (value) {
          settings.setDarkMode(value);
        },
      ),
      onTap: () {
        settings.setDarkMode(!settings.isDarkMode);
      },
    );
  }
}
