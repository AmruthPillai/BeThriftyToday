import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/currency.dart';
import 'package:bethriftytoday/services/database/currency_database.dart';
import 'package:bethriftytoday/shared/currency_circle.dart';
import 'package:bethriftytoday/shared/onboarding_header.dart';
import 'package:flutter/material.dart';

class CurrencySetupScreen extends StatefulWidget {
  static const String routeName = '/currency-setup';

  @override
  _CurrencySetupScreenState createState() => _CurrencySetupScreenState();
}

class _CurrencySetupScreenState extends State<CurrencySetupScreen>
    with AfterLayoutMixin<CurrencySetupScreen> {
  @override
  void afterFirstLayout(BuildContext context) async {
    updateStatusBarColor();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset('assets/images/currency.png'),
              ),
              SizedBox(height: 15),
              Text(
                'What\'s your currency?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              CurrencyGridView(),
              Spacer(),
              RequestCurrencyButton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestCurrencyButton extends StatelessWidget {
  const RequestCurrencyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Don\'t see your currency?',
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 3),
          Text(
            'Request for it here.',
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class CurrencyGridView extends StatelessWidget {
  const CurrencyGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CurrencyDatabaseService().currencies,
      builder: (context, AsyncSnapshot<List<Currency>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 2,
            mainAxisSpacing: 40,
            shrinkWrap: true,
            children: snapshot.data
                .map((currency) => CurrencyCircle(currency))
                .toList(),
          );
        }

        return Container();
      },
    );
  }
}
