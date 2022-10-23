import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final String title;
  final PageController pageController;
  final List<Post> posts;

  PostsCarousel(
      {required this.title, required this.pageController, required this.posts});

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(
                post.imageUrl,
              ),
              height: 400.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            height: 110.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              color: Colors.white54,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  post.location,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          post.likes.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.comment,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          post.comments.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        ),
      ],
    );
  }
}
