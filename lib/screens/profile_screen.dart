import 'package:flutter/material.dart';
import 'package:flutter_social_app/models/user_model.dart';
import 'package:flutter_social_app/widgets/customDrawer.dart';
import 'package:flutter_social_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow:  [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                            color: Colors.black26)
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          widget.user.profileImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
