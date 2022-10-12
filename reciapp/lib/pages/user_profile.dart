import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import '../components/head_bar.dart';
import '../components/copyright.dart';

import '../components/sidebar_menu.dart';

class ReciepReview {
  final String image;
  final String title;
  final double start;
  final String description;

  ReciepReview({
    @required required this.image,
    @required required this.title,
    @required required this.start,
    @required required this.description,
  });
}

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<ReciepReview> _listReciepReviews = [
    ReciepReview(
        image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
        title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
        start: 4,
        description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
            "will be your summer go-to staple. 10-minute is all you need to whip..."),
    ReciepReview(
        image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
        title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
        start: 4.5,
        description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
            "will be your summer go-to staple. 10-minute is all you need to whip..."),
    ReciepReview(
        image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
        title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
        start: 4,
        description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
            "will be your summer go-to staple. 10-minute is all you need to whip..."),
    ReciepReview(
        image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
        title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
        start: 4,
        description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
            "will be your summer go-to staple. 10-minute is all you need to whip..."),
    ReciepReview(
        image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
        title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
        start: 4,
        description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
            "will be your summer go-to staple. 10-minute is all you need to whip..."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image(
                      image: AssetImage('assets/nonAvatar.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jason',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 20),
                      Text('Email: example@example.com')
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 2.0))),
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.assignment,
                        color: Colors.red,
                        size: 40,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 40,
                      ),
                      Text(
                        '15',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.assignment),
                      Text(
                        ' Recently Recipes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  ),
                  ListRecipeReview(_listReciepReviews)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

class RecipeReviewItem extends StatelessWidget {
  const RecipeReviewItem({
    super.key,
    required this.image,
    required this.title,
    required this.start,
    required this.description,
  });

  final String image;
  final String title;
  final double start;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.network(image),
            ),
            Expanded(
              flex: 3,
              child: RecipeDetail(
                title: title,
                start: start,
                description: description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({
    required this.title,
    required this.start,
    required this.description,
  });

  final String title;
  final double start;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          // Text(
          //   '$start starts',
          //   style: const TextStyle(fontSize: 10.0),
          // ),
          SimpleStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: start,
            size: 15,
            spacing: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            description,
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

class ListRecipeReview extends StatelessWidget {
  final List<ReciepReview> list;

  ListRecipeReview(this.list);

  @override
  Widget build(BuildContext context) {
    return (list.length == 0)
        ? Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.topLeft,
            child: Text(
              'No posts were found.',
              style: TextStyle(fontSize: 20),
            ))
        : Container(
            height: 400,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return RecipeReviewItem(
                  image: list[index].image,
                  title: list[index].title,
                  start: list[index].start,
                  description: list[index].description,
                );
              },
              itemCount: list.length,
            ),
          );
  }
}
