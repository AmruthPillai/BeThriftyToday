import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateNameDialog extends StatefulWidget {
  final String name;

  const UpdateNameDialog({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  _UpdateNameDialogState createState() => _UpdateNameDialogState();
}

class _UpdateNameDialogState extends State<UpdateNameDialog> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text(
            'Please enter a new name for your account',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: _nameController,
          ),
          SizedBox(height: 15),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  UserDatabaseService(user).updateUserName(
                    _nameController.text,
                  );
                  Navigator.pop(context);
                },
                textColor: Theme.of(context).accentColor,
                icon: Icon(Icons.sync),
                label: Text('Update'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
