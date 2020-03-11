import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenciesScreen extends StatefulWidget {
  static const String routeName = '/currencies';

  @override
  _CurrenciesScreenState createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  bool editMode = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var currencyProvider = Provider.of<CurrencyProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(S.of(context).currenciesScreenAppBarTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => resetCurrencies(currencyProvider),
          )
        ],
      ),
      body: Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25,
            children: <Widget>[
              ...currencyProvider.currencies
                  .map((x) => CurrencyCircle(
                        currency: x,
                        onPressed: () {
                          if (x.id.contains('custom')) {
                            currencyProvider.delete(x);
                          }
                        },
                      ))
                  .toList(),
              buildAddCurrencyButton(currencyProvider),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton buildAddCurrencyButton(
    CurrencyProvider currencyProvider,
  ) {
    return FloatingActionButton(
      elevation: 0,
      heroTag: 'add_currency',
      onPressed: () => setState(() => editMode = true),
      child: Theme(
        data: ThemeData(),
        child: editMode
            ? TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                onSubmitted: (v) async {
                  await currencyProvider.insert(Currency(
                    id: 'custom_${UniqueKey().toString()}',
                    name: v,
                    symbol: v,
                  ));

                  setState(() => editMode = false);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )
            : Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
      ),
    );
  }

  resetCurrencies(CurrencyProvider currencyProvider) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        S.of(context).currenciesScreenSnackbarTextResetCurrenciesConfirmation,
      ),
      action: SnackBarAction(
          label:
              S.of(context).currenciesScreenSnackbarTextResetCurrenciesAction,
          onPressed: () async {
            await currencyProvider.reset();

            _scaffoldKey.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                S
                    .of(context)
                    .currenciesScreenSnackbarTextResetCurrenciesSuccess,
              ),
            ));
          }),
    ));
  }
}
