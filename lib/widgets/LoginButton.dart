import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_river_pod/providers.dart';
import 'package:login_river_pod/state/login_state.dart';

class LoginButton extends StatelessWidget {

 final Function onPressed;

 const LoginButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(loginNotifierProvider.state);
        return state.when(
                () => LoginCustomButton(onPressed: onPressed,text: "Login",),
            loading: () => LoginCustomButton(onPressed: onPressed,text: "Logging In",),
            success: (logindata) => LoginCustomButton(onPressed: onPressed,text: "Success",),
            error: (message)=>LoginCustomButton(onPressed: onPressed,text: "Error",));
      },
    );

  }
}
class LoginCustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const LoginCustomButton({Key key, this.onPressed, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      child: Text("$text"),
    );

  }
}
