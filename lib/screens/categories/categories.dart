import 'package:bethriftytoday/config/colors.dart';
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Categories'),
          bottom: TabBar(
            indicatorColor: thriftyBlue,
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
        body: TabBarView(
          children: <Widget>[
            GridView.count(
              crossAxisCount: 5,
              children: <Widget>[
                ...buildCategories(
                  categoryProvider,
                  categoryProvider.categories.where((x) => x.type == 'income'),
                ),
                buildAddButton(() {
                  _scaffoldKey.currentState.showBottomSheet((context) {
                    return AddCategoryDialog('income');
                  });
                })
              ],
            ),
            GridView.count(
              crossAxisCount: 5,
              children: <Widget>[
                ...buildCategories(
                  categoryProvider,
                  categoryProvider.categories.where((x) => x.type == 'expense'),
                ),
                buildAddButton(() {
                  _scaffoldKey.currentState.showBottomSheet((context) {
                    return AddCategoryDialog('expense');
                  });
                })
              ],
            ),
          ],
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
                  ? () {
                      categoryProvider.delete(x);
                    }
                  : null,
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
                    SizedBox(height: 10),
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
