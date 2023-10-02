import 'package:flutter/material.dart';
import 'package:neticket/Controllers/RouterController.dart';
import 'package:neticket/Usefull/Validators.dart';

Future<void> addBottomSheet(BuildContext context, Function action) async {
  return showDialog<void>(
    context: context,

    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Text("Add Router"),
          content: Container(
              height: 280,
              // Your bottom sheet content goes here
              child: addRouterWidget(context, action)));
    },
  );
}

Widget addRouterWidget(context, action) {
  TextEditingController urlController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  return Container(
    child: Column(
      children: [
        TextField(
          controller: urlController,
          decoration: const InputDecoration(
            hintText: 'hostname or Ip',
            prefixIcon: Icon(Icons.link),
          ),
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        TextField(
          controller: userNameController,
          decoration: const InputDecoration(
            hintText: 'Username',
            prefixIcon: Icon(Icons.verified_user_rounded),
          ),
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'password',
            prefixIcon: Icon(Icons.key),
          ),
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            //Action
            if (isValidText(userNameController.text) &&
                isValidText(urlController.text) &&
                isValidText(passwordController.text)) {
              if (RouterController.instance.addRouter(urlController.text,
                  userNameController.text, passwordController.text)) {
                action();
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Information provided are incorrect'),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Fill all the field'),
                ),
              );
            }
          },
          child: const Text('add Router'),
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}
