import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/screens/categories/categories.dart';
import 'package:bethriftytoday/screens/currencies/currencies.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ThriftyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                DrawerHeader(user),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CategoriesScreen.routeName);
                  },
                  leading: Icon(Icons.category),
                  title: Text(S.of(context).thriftyDrawerTextCategories),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CurrenciesScreen.routeName);
                  },
                  leading: Icon(Icons.attach_money),
                  title: Text(S.of(context).thriftyDrawerTextCurrencies),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => ExportDialog(),
                    );
                  },
                  leading: Icon(Icons.import_export),
                  title: Text(S.of(context).thriftyDrawerTextExport),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, SettingsScreen.routeName);
                  },
                  leading: Icon(Icons.settings),
                  title: Text(S.of(context).thriftyDrawerTextSettings),
                ),
                Divider(),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationIcon: ThriftyLogo(
                        size: 80,
                        color: Theme.of(context).accentColor,
                      ),
                      applicationName: S.of(context).appName,
                      applicationLegalese:
                          S.of(context).thriftyDrawerTextAboutAppLegalese,
                      applicationVersion: await getVersionCode(),
                      children: [
                        SizedBox(height: 30),
                        Text(S.of(context).thriftyDrawerTextAboutFooter),
                      ],
                    );
                  },
                  leading: Icon(Icons.local_library),
                  title: Text(S.of(context).thriftyDrawerTextAbout),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Share.share(
                      S.of(context).thriftyDrawerMessageShare,
                      subject: S.of(context).appName,
                    );
                  },
                  leading: Icon(Icons.favorite),
                  title: Text(S.of(context).thriftyDrawerTextShare),
                ),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    var playStoreUrl =
                        'https://play.google.com/store/apps/details?id=today.bethrifty.app';
                    if (await canLaunch(playStoreUrl)) launch(playStoreUrl);
                  },
                  leading: Icon(Icons.rate_review),
                  title: Text(S.of(context).thriftyDrawerTextRate),
                ),
                Divider(),
                ListTile(
                  onTap: () => logout(context),
                  leading: Icon(Icons.exit_to_app),
                  title: Text(S.of(context).thriftyDrawerTextLogout),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FutureBuilder(
              initialData: '',
              future: getVersionCode(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  logout(BuildContext context) {
    AuthService authService = AuthService();
    Navigator.pop(context);
    authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 180,
        color: Theme.of(context).accentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 45),
            Text(
              user?.name ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              user?.email ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      clipper: WaveClipper(),
    );
  }
}
