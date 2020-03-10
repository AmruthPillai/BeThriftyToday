import 'package:bethriftytoday/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ExportDialog extends StatefulWidget {
  const ExportDialog({
    Key key,
  }) : super(key: key);

  @override
  _ExportDialogState createState() => _ExportDialogState();
}

class _ExportDialogState extends State<ExportDialog> {
  bool loading = false;
  String downloadLink;
  String format = 'csv';
  DateTime startDate, endDate;
  TextEditingController _startDateCtrl = TextEditingController();
  TextEditingController _endDateCtrl = TextEditingController();

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
            S.of(context).exportBottomSheetHeadingText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _startDateCtrl,
            readOnly: true,
            onTap: () async {
              startDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime.now(),
              );

              if (startDate != null) {
                setDate(_startDateCtrl, startDate);
              }
            },
            decoration: InputDecoration(
              labelText: S.of(context).exportBottomSheetLabelTextStartDate,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _endDateCtrl,
            readOnly: true,
            onTap: () async {
              endDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime.now(),
              );

              if (endDate != null) {
                setDate(_endDateCtrl, endDate);
              }
            },
            decoration: InputDecoration(
              labelText: S.of(context).exportBottomSheetLabelTextEndDate,
            ),
          ),
          SizedBox(height: 5),
          isDatePeriodValid()
              ? Container()
              : Text(
                  S.of(context).exportBottomSheetTextDateValidationError,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(height: 20),
          DropdownButtonFormField(
            value: format,
            onChanged: (v) {
              setState(() => format = v);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
            ),
            items: [
              DropdownMenuItem(
                value: 'csv',
                child: Text('Comma Separated Values (CSV)'),
              ),
              DropdownMenuItem(
                value: 'json',
                child: Text('JavaScript Object Notation (JSON)'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ThriftyButton(
            title: S.of(context).exportBottomSheetButtonTextExport,
            onPressed: (isDatePeriodValid() && downloadLink == null && !loading)
                ? () => beginExport(user)
                : null,
          ),
          SizedBox(height: 20),
          loading
              ? LinearProgressIndicator(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                )
              : Container(),
          downloadLink != null
              ? FlatButton.icon(
                  onPressed: () async {
                    if (await canLaunch(downloadLink))
                      await launch(downloadLink);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textColor: Theme.of(context).accentColor,
                  icon: Icon(Icons.cloud_download),
                  label: Text(
                    S.of(context).exportBottomSheetButtonTextDownload,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  setDate(TextEditingController ctrl, DateTime date) {
    setState(() => ctrl.text = new DateFormat.yMMMMd().format(date));
  }

  bool isDatePeriodValid() {
    if (startDate == null || endDate == null) return false;
    var difference = endDate.difference(startDate);
    if (difference.isNegative) return false;
    if (difference.inDays == 0 && (startDate.day == endDate.day)) return false;
    return true;
  }

  Future beginExport(User user) async {
    setState(() => loading = true);
    var url =
        'https://us-central1-be-thrifty-today.cloudfunctions.net/export/$format?uid=${user.uid}&startDate=${startDate.toIso8601String()}&endDate=${endDate.toIso8601String()}';
    var res = await http.get(url);
    setState(() => loading = false);
    setState(() => downloadLink = res.body);
  }
}
