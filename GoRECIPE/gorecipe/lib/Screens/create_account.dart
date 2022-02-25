import 'package:flutter/material.dart';

//place holder for create account page

//linked to the create account button on login page

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  int _counter = 0;
  bool _passwordVisible = false;
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Fields and text to create later on
    const headerText = Text(
      "Create Account",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final firstNameField = SizedBox(
      width: 150.0,
      child: TextField(
        controller: firstNameController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            fillColor: Colors.green,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "First",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
    );
    final lastNameField = SizedBox(
      width: 150.0,
      child: TextField(
        controller: lastNameController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            fillColor: Colors.green,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Last",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
    );
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.green,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final passwordField = TextField(
      controller: passwordController,
      obscureText: !_passwordVisible,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.green,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
    final confirmPasswordField = TextField(
      controller: confirmPasswordController,
      obscureText: !_passwordVisible,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.green,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final createAccountButton = MaterialButton(
      child: Text("Create Account",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text that the user has entered by using the
              // TextEditingController.
              content: Text(
                  'First Name: ${firstNameController.text}\nLast Name: ${lastNameController.text} \nEmail: ${emailController.text} \nPassword: ${passwordController.text} \nConfirm Password: ${confirmPasswordController.text}'),
            );
          },
        );
      },
    );

    final passwordCheckbox = CheckboxListTile(
      title: const Text('Show Password'),
      value: _passwordVisible,
      onChanged: (bool? value) {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
    //Scaffold that holds create account field/button children

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/ingredients.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.2), BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Declaring sizes of field boxes
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(height: 15.0),
                headerText,
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    firstNameField,
                    const SizedBox(width: 10.0),
                    lastNameField,
                  ],
                ),
                const SizedBox(
                  height: 35.0,
                ),
                emailField,
                const SizedBox(
                  height: 35.0,
                ),
                passwordField,
                const SizedBox(
                  height: 15.0,
                ),
                confirmPasswordField,
                passwordCheckbox,
                const SizedBox(
                  height: 50.0,
                ),
                createAccountButton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
