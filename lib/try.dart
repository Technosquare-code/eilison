import 'package:flutter/material.dart';

class Post {
  final String title;
  bool liked;
  int likeCount;

  Post(this.title, this.liked, this.likeCount);
}

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Post> posts = [
    Post('Post 1', false, 0),
    Post('Post 2', false, 0),
    Post('Post 3', false, 0),
  ];

  void updatePostLikedStatus(int index, bool liked) {
    setState(() {
      posts[index].liked = liked;
      if (liked) {
        posts[index].likeCount++;
      } else {
        posts[index].likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              bool? updatedLikedStatus = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(
                    post: posts[index],
                    onUpdate: (liked, likeCount) {
                      updatePostLikedStatus(index, liked);
                      posts[index].likeCount = likeCount;
                    },
                  ),
                ),
              );
              if (updatedLikedStatus != null) {
                updatePostLikedStatus(index, updatedLikedStatus);
              }
            },
            child: PostWidget(post: posts[index]),
          );
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text('Likes: ${post.likeCount}'),
      trailing: IconButton(
        icon: Icon(
          post.liked ? Icons.favorite : Icons.favorite_border,
          color: post.liked ? Colors.red : null,
        ),
        onPressed: () {
          // Toggle like status
          post.liked = !post.liked;
          // Update the parent widget
          final _ListViewScreenState? listViewScreenState =
              context.findAncestorStateOfType<_ListViewScreenState>();
          if (listViewScreenState != null) {
            final postIndex = listViewScreenState.posts.indexOf(post);
            listViewScreenState.updatePostLikedStatus(postIndex, post.liked);
          }
        },
      ),
    );
  }
}

class PostDetailScreen extends StatefulWidget {
  final Post post;
  final Function(bool, int) onUpdate;

  const PostDetailScreen({Key? key, required this.post, required this.onUpdate})
      : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool liked = false;
  int likeCount = 0;

  @override
  void initState() {
    liked = widget.post.liked;
    likeCount = widget.post.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PostWidget(post: widget.post),
            ElevatedButton(
              onPressed: () {
                // Toggle like status
                liked = !liked;
                // Update the like count
                if (liked) {
                  likeCount++;
                } else {
                  likeCount--;
                }
                // Update the parent widget
                widget.onUpdate(liked, likeCount);
                setState(() {});
              },
              child: Text(liked ? 'Unlike' : 'Like'),
            ),
          ],
        ),
      ),
    );
  }
}
