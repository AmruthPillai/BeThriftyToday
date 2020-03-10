import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/category.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionBottomSheet extends StatefulWidget {
  final Transaction transaction;

  const TransactionBottomSheet({
    Key key,
    this.transaction,
  }) : super(key: key);

  @override
  _TransactionBottomSheetState createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
  String id;
  double amount;
  String description;
  DateTime timestamp;
  Category selectedCategory;

  var _descriptionNode = FocusNode();
  var _amountNode = FocusNode();

  bool isExpense = true;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  setIsExpense(bool value) => setState(() => isExpense = value);
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    setDate(date);

    if (widget.transaction != null) {
      id = widget.transaction.id;
      amount = widget.transaction.amount;
      _amountController.text = amount.abs().toStringAsFixed(0);
      timestamp = widget.transaction.timestamp;
      setDate(timestamp);
      description = widget.transaction.description;
      _descriptionController.text = description;
      selectedCategory = widget.transaction.category;
      isExpense = selectedCategory.type == 'expense';
    }
  }

  setDate(DateTime date) {
    timestamp = date;
    _dateController.text = DateFormat().add_yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: ListView(
        children: <Widget>[
          Text(
            (widget.transaction == null)
                ? S.of(context).transactionBottomSheetTextHeadingAdd
                : S.of(context).transactionBottomSheetTextHeadingUpdate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          buildTypeSelector(),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              buildCategorySelector(),
              SizedBox(height: 20),
              TextField(
                focusNode: _descriptionNode,
                controller: _descriptionController,
                textCapitalization: TextCapitalization.words,
                onChanged: (v) => setState(() => description = v),
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_amountNode),
                decoration: InputDecoration(
                  labelText:
                      S.of(context).transactionBottomSheetLabelTextDescription,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                focusNode: _amountNode,
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                onChanged: (v) => setState(() => amount = double.parse(v)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    isExpense ? Icons.remove : Icons.add,
                    color: Theme.of(context).accentColor,
                  ),
                  labelText:
                      S.of(context).transactionBottomSheetLabelTextAmount,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                  );

                  if (date != null) {
                    setState(() => setDate(date));
                  }
                },
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: S.of(context).transactionBottomSheetLabelTextDate,
                ),
              ),
              SizedBox(height: 20),
              ThriftyButton(
                title: (widget.transaction == null)
                    ? S.of(context).transactionBottomSheetButtonTextAdd
                    : S.of(context).transactionBottomSheetButtonTextUpdate,
                onPressed: (this.selectedCategory != null)
                    ? this.addTransaction
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  addTransaction() async {
    FocusScope.of(context).unfocus();
    var user = Provider.of<User>(context, listen: false);

    Transaction transaction = Transaction(
      id: id,
      amount: amount * (selectedCategory.type == 'expense' ? -1 : 1),
      description: description,
      timestamp: timestamp,
      category: selectedCategory,
    );

    if (widget.transaction != null) {
      TransactionDatabaseService(user).updateTransaction(transaction);
    } else {
      TransactionDatabaseService(user).addTransaction(transaction);
    }

    Navigator.pop(context);
  }

  Widget buildCategorySelector() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) {
        var categories = categoryProvider.categories
            .where((x) => x.type == (isExpense ? 'expense' : 'income'))
            .toList();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (selectedCategory != null)
                ? Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        child: CategorySelector(
                          isSelected: false,
                          category: selectedCategory,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                : Container(),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                  itemExtent: 90,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var x = categories[index];
                    return CategorySelector(
                      category: x,
                      isSelected: x.name == selectedCategory?.name,
                      onPressed: () => setState(() => selectedCategory = x),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Container buildTypeSelector() {
    return Container(
      width: double.infinity,
      height: 45,
      child: Row(
        children: <Widget>[
          TransactionTypeSelector(
            title: S.of(context).transactionBottomSheetButtonTextExpense,
            isSelected: isExpense,
            onPressed: () => setIsExpense(true),
          ),
          TransactionTypeSelector(
            title: S.of(context).transactionBottomSheetButtonTextIncome,
            isSelected: !isExpense,
            onPressed: () => setIsExpense(false),
          ),
        ],
      ),
    );
  }
}
