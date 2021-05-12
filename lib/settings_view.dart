import 'package:attendance_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key key, this.formData}) : super(key: key);

  final FormData formData;

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text('Email:'),
            TextFormField(
              onChanged: (newVal) => widget.formData.email = newVal,
              initialValue: widget.formData.email,
              textAlign: TextAlign.center,
              onTap: () {
                // print("$_email, $_studentId, $_firstName, $_lastName");
              },
            )
          ],
        ),
        Column(
          children: [
            Text('Student Id:'),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: widget.formData.studentId,
              textAlign: TextAlign.center,
              onChanged: (newVal) => widget.formData.studentId = newVal,
            )
          ],
        ),
        Column(
          children: [Text('First name:'), TextFormField(
            onChanged: (newVal) => widget.formData.firstName = newVal,
            initialValue: widget.formData.firstName,
            textAlign: TextAlign.center,
          )],
        ),
        Column(
          children: [Text('Last name:'), TextFormField(
            onChanged: (newVal) => widget.formData.lastName = newVal,
            initialValue: widget.formData.lastName,
            textAlign: TextAlign.center,
          )],
        ),
      ],
    );
  }
}
