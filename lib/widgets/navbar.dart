import 'package:pwa_website/utils/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkModel {
  LinkModel(this.name, this.url);

  final String name;
  final String url;
}

class NavBar extends StatelessWidget {
  final List<Map<String, String>> navLinks = [
    {'name': 'Home', 'url': '/'},
    {'name': 'Blog', 'url': 'https://webneko.dev'},
  ];

  List<Widget> navItem() {
    return navLinks.map((link) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ElevatedButton(
          onPressed: () async {
            await launch(link['url']);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text(
            link['name'],
            style: const TextStyle(fontFamily: 'Montserrat-Bold'),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC86DD7),
                          Color(0xFF3023AE),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    )
                ),
                child: const Center(
                  child: Text('F',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      )
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                  'Flutter for Web',
                  style: TextStyle(fontSize: 26)
              )
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[...navItem()]
            )
          else
            Image.network('assets/flutter.png', width: 26, height: 26)
        ],
      ),
    );
  }
}
