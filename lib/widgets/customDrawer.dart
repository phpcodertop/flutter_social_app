import 'package:flutter/material.dart';
import 'package:flutter_social_app/data/data.dart';
import 'package:flutter_social_app/screens/login_screen.dart';
import 'package:flutter_social_app/screens/main_screen.dart';
import 'package:flutter_social_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
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
              Image(
                image: AssetImage(
                  currentUser.backgroundImageUrl,
                ),
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
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      currentUser.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.chat),
            'Chat',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.location_on),
            'Map',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your Profile', 
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser)),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.settings),
            'Settings',
            () {},
          ),
          Expanded(
            child: Align(
              child: _buildDrawerOption(
                const Icon(Icons.logout),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
              ),
              alignment: FractionalOffset.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
