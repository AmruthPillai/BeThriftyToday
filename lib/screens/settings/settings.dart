import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var settings = Provider.of<SettingsProvider>(context);

    updateStatusBarColor(context);

    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: UserDatabaseService(user).userDocument,
        ),
      ],
      child: Scaffold(
        body: Consumer<User>(
          builder: (context, user, _) => SafeArea(
            child: ListView(
              children: <Widget>[
                ThriftyAppBar(canGoBack: true),
                SizedBox(height: 20),
                buildHeader('Preferences'),
                buildAccentColorSelector(settings),
                buildThemeSelector(settings),
                buildBiometricsSwitch(settings),
                Divider(),
                buildHeader('Account'),
                buildNameSetting(user),
                buildEmailSetting(user),
                buildCurrencySetting(user),
                Divider(),
                buildHeader('Danger Zone'),
                buildDeleteAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildNameSetting(User user) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        'Name',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user?.name ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
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
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        'Email',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user?.email ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  ListTile buildCurrencySetting(User user) {
    return ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        'Currency',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '${user?.currency?.symbol} (${user?.currency?.name})' ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
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
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  ListTile buildDeleteAccount() {
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
      onTap: () {
        showDialog(
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
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    AuthService().deleteUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                      (route) => false,
                    );
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
      },
    );
  }

  FutureBuilder<bool> buildBiometricsSwitch(SettingsProvider settings) {
    return FutureBuilder<bool>(
      initialData: false,
      future: _localAuth.canCheckBiometrics,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var enabled = snapshot.data;

          return ListTile(
            enabled: enabled,
            leading: Icon(
              Icons.fingerprint,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              'Biometric Fortification',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle:
                Text('Asks for your fingerprint everytime you open the app.'),
            trailing: Switch(
              value: settings.biometricsEnabled,
              activeColor: Theme.of(context).accentColor,
              onChanged: enabled
                  ? (value) {
                      settings.setBiometricsEnabled(value);
                    }
                  : null,
            ),
            onTap: () {
              settings.setBiometricsEnabled(!settings.biometricsEnabled);
            },
          );
        }

        return Container();
      },
    );
  }

  ListTile buildThemeSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.brightness_medium,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        'Theme',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<ThemeOptions>(
        onChanged: settings.setTheme,
        value: settings.themePref,
        items: [
          DropdownMenuItem(
            value: ThemeOptions.light,
            child: Text('Light'),
          ),
          DropdownMenuItem(
            value: ThemeOptions.dark,
            child: Text('Dark'),
          ),
          DropdownMenuItem(
            value: ThemeOptions.amoled,
            child: Text('AMOLED'),
          ),
        ],
      ),
    );
  }

  ListTile buildAccentColorSelector(SettingsProvider settings) {
    List<Color> colorOptions = [
      Color(0xFF1B54A9),
      Colors.red[800],
      Colors.pink[600],
      Colors.teal[600],
      Colors.green[800],
      Colors.deepOrange[800],
      Colors.deepPurple[700],
    ];

    return ListTile(
      leading: Icon(
        Icons.color_lens,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        'Accent Color',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<Color>(
        underline: Container(),
        onChanged: settings.setAccentColor,
        value: settings.accentColor,
        items: colorOptions
            .map(
              (x) => DropdownMenuItem(
                value: x,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: x,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
