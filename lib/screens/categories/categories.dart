import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/category.dart';
import 'package:bethriftytoday/shared/dialogs/add_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          title: Text(S.of(context).categoriesScreenAppBarTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => resetCategories(categoryProvider),
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            tabs: <Widget>[
              Tab(
                child: Text(S.of(context).categoriesScreenTabBarTextIncome),
              ),
              Tab(
                child: Text(S.of(context).categoriesScreenTabBarTextExpense),
              ),
            ],
          ),
        ),
        body: Builder(
          builder: (context) => TabBarView(
            children: <Widget>[
              GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  ...buildCategories(
                    categoryProvider,
                    categoryProvider.categories
                        .where((x) => x.type == 'income'),
                  ),
                  buildAddButton(() {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => AddCategoryDialog('income'),
                    );
                  })
                ],
              ),
              GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  ...buildCategories(
                    categoryProvider,
                    categoryProvider.categories
                        .where((x) => x.type == 'expense'),
                  ),
                  buildAddButton(() {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => AddCategoryDialog('expense'),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  resetCategories(CategoryProvider categoryProvider) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        S.of(context).categoriesScreenSnackbarTextResetCategoriesConfirmation,
      ),
      action: SnackBarAction(
          label:
              S.of(context).categoriesScreenSnackbarTextResetCategoriesAction,
          onPressed: () async {
            await categoryProvider.reset();

            _scaffoldKey.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                S
                    .of(context)
                    .categoriesScreenSnackbarTextResetCategoriesSuccess,
              ),
            ));
          }),
    ));
  }

  Widget buildAddButton(Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 32,
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).categoriesScreenButtonTextAddNew,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCategories(
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        .map((x) => InkWell(
              onLongPress: () async {
                await categoryProvider.delete(x);

                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                    S.of(context).categoriesScreenSnackbarTextDeleteMessage,
                    textAlign: TextAlign.center,
                  ),
                ));
              },
              child: Container(
                key: Key(x.id),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 32,
                      child: Image.asset(
                        'assets/categories/${x.icon}',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      S.of(context).categoryName(transformCategoryToKey(x)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
