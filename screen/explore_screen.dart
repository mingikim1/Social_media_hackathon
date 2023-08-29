import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/screen/home_screen.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탐색'),
      ),
      body: GridPostCard(),
    );
  }
}



class GridPostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridPostCardDetail()),
              );
            },
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.network('https://placekitten.com/200/200'),
              ),
            ),
          );
        },
    );
  }
}


class GridPostCardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('정보'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(),
            PostCard(),
          ],
        ),
      ),
    );
  }
}