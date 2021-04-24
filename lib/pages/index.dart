import 'package:pwa_website/utils/responsive_layout.dart';
import 'package:pwa_website/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeBodyChild(),
      smallScreen: SmallBodyChild(),
    );
  }
}

class LargeBodyChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: .6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                      text: 'Flutter for ',
                      style:
                      TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                      children: [
                        TextSpan(
                            text: 'Web',
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                            ),
                        )
                      ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 20),
                  child: Text('PWA boilerplate'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SmallBodyChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                  text: 'Flutter for ',
                  style:
                  TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                  children: [
                    TextSpan(
                      text: 'Web',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text('PWA boilerplate'),
            ),
          ],
        ),
      ),
    );
  }
}
