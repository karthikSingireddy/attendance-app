import 'package:attendance_app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormView extends StatelessWidget {
  const FormView({Key key, this.formData}) : super(key: key);

  final FormData formData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(flex: 3),
          ElevatedButton(
              onPressed: () {
                submitForm(formData, 'In');
              },
              child: Text('Sign in')),
          Spacer(flex: 1),
          ElevatedButton(onPressed: () {
            submitForm(formData, 'Out');
          }, child: Text('Sign out')),
          Spacer(flex: 1),
          ElevatedButton(
              onPressed: () {
                submitForm(formData, "Just logging my attendance because I'm attending the meeting virtually.");
              },
              child: Text('Virtual')),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}

void submitForm(FormData data, String status) async {
  print(data.toString());
  print(status);
  var bodyData = Map<String, dynamic>();
  bodyData['emailAddress'] = data.email;
  bodyData['entry.1657263090'] = data.studentId;
  bodyData['entry.720071653'] = data.firstName;
  bodyData['entry.850615166'] = data.lastName;
  bodyData['entry.1414163169'] = status;

  http.post(
    Uri.parse("https://docs.google.com/forms/u/1/d/e/1FAIpQLSd3ErVHO5XBq0kd1IFAlKTsZ5_q52xzqAVGWYAVqMVirIc1Yg/formResponse"),
    body: bodyData,
  );
}
