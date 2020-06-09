import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/home_screen.dart';
import 'package:social_media_ui/screens/login_screen.dart';
import 'package:social_media_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buldDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                currentUser.backgroundImageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          currentUser.profileImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _buldDrawerOption(
            Icon(Icons.dashboard),
            'HOME',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
          ),
          _buldDrawerOption(
            Icon(Icons.chat),
            'CHAT',
            () {},
          ),
          _buldDrawerOption(
            Icon(Icons.map),
            'MAP',
            () {},
          ),
          _buldDrawerOption(
            Icon(Icons.account_circle),
            'PROFILE',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen(currentUser)),
            ),
          ),
          _buldDrawerOption(
            Icon(Icons.settings),
            'SETTINGS',
            () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buldDrawerOption(
                Icon(Icons.directions_run),
                'LOGOUT',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
