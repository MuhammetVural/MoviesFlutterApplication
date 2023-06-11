import 'package:flutter/material.dart';
import 'package:movie_flutter_application/extensions/global.dart';

import '../../auth/login/view/login_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            fAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => const LoginView()));
          },
          child: Text("Sign out")),
    );
  }
}
