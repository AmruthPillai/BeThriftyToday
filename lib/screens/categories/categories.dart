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
          title: Text('Categories'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            tabs: <Widget>[
              Tab(
                child: Text('Income'),
              ),
              Tab(
                child: Text('Expense'),
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
              'Add New',
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
              onLongPress: (x.id.contains('custom'))
                  ? () async {
                      await categoryProvider.delete(x);

                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          'Your custom category has been deleted',
                          textAlign: TextAlign.center,
                        ),
                      ));
                    }
                  : () {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          'You can\'t delete an original category',
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
                      x.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
