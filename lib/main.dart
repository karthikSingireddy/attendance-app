
import 'package:attendance_app/form_view.dart';
import 'package:attendance_app/nav_bar.dart';
import 'package:attendance_app/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Attendance App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FormData _formData = FormData();
  int currentIndex = 0;

  Widget _getCurrentView() {
    if(currentIndex == 0)
      return FormView(formData: _formData,);
    return SettingsView(formData: _formData);
  }

  @override
  Widget build(BuildContext context) {

    Widget floatingButton;
    if(currentIndex == 1) {
      floatingButton = FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _formData.save,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: _getCurrentView(),
      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: floatingButton,
    );
  }
}

class FormData {
  String email;
  String studentId;
  String firstName;
  String lastName;

  FormData() {
    load();
  }

  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    studentId = prefs.getString('studentId') ?? '';
    firstName = prefs.getString('firstName') ?? '';
    lastName = prefs.getString('lastName') ?? '';
  }

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('studentId', studentId);
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
  }

  String toString() {
    return "$email, $studentId, $firstName, $lastName";
  }
}