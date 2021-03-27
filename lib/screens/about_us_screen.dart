import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Made with ❤️ by Aditya Narad',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            // color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
