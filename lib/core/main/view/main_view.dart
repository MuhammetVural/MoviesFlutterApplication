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
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Colors.transparent,
        
        bottom: PreferredSize(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Text("Sezin Karagün", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 17),),
              CircleAvatar()
            ],
          ),
        ), preferredSize: Size.fromHeight(30)),
        
      ),
    );
      // child: ElevatedButton(
      //     onPressed: () {
      //       fAuth.signOut();
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (c) => const LoginView()));
      //     },
      //     child: Text("Sign out")),
    
  }
}
