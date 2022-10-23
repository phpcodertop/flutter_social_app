import 'package:flutter/material.dart';
import 'package:flutter_social_app/data/data.dart';

import '../models/user_model.dart';

class UserFollowing extends StatelessWidget {
  const UserFollowing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(user.profileImageUrl),
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
