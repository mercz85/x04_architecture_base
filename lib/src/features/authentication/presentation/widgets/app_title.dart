import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            FontAwesomeIcons.hippo,
            color: Colors.deepPurpleAccent,
            size: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'APP TITLE',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
            // style: Theme.of(context)
            //     .textTheme
            //     .headlineMedium!
            //     .copyWith(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
