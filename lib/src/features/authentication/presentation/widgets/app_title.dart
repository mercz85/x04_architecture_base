import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(
      height * 0.01, //8
      height * 0, //20
      height * 0.01, //8
      height * 0.015, //12
    );
    double iconSize = height * 0.15; //80
    double sizedBoxHeight = height * 0.05; //40
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'titleIcon',
            // child: Icon(
            //   Icons.lock,
            //   size: iconSize, //80,
            // ),
            child: CircleAvatar(
              radius: iconSize / 2 + 2,
              backgroundColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                radius: iconSize / 2,
                child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/sirena.png'),
                  radius: iconSize / 2,
                  backgroundColor: Colors.white.withOpacity(
                      0.9), //Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizedBoxHeight, //40
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
