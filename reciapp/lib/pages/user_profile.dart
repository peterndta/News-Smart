import 'package:flutter/material.dart';
import 'package:reciapp/pages/user_rating_page.dart';
import 'package:reciapp/pages/user_recipes_page.dart';
import '../components/head_bar.dart';
import '../components/copyright.dart';
import '../components/sidebar_menu.dart';
import 'collection_page.dart';
import '../object/recipe_review.dart';

class IconDetail extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int number;
  final String text;
  final dynamic page;
  const IconDetail({
    super.key,
    required this.color,
    required this.number,
    required this.icon,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 40,
          color: color,
          icon: Icon(icon),
          tooltip: text,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => page,
            ));
          },
        ),
        Text(
          '$number',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
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
          "will be your summer go-to staple. 10-minute is all you need to whip...",
      author: 'John',
    ),
    ReciepReview(
      image:
          'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
      title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
      start: 4.5,
      description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
          "will be your summer go-to staple. 10-minute is all you need to whip...",
      author: 'John',
    ),
    ReciepReview(
      image:
          'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
      title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
      start: 4,
      description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
          "will be your summer go-to staple. 10-minute is all you need to whip...",
      author: 'John',
    ),
    ReciepReview(
      image:
          'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
      title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
      start: 4,
      description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
          "will be your summer go-to staple. 10-minute is all you need to whip...",
      author: 'John',
    ),
    ReciepReview(
      image:
          'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574',
      title: 'Light and refreshing, Zaru Soba (Cold Soba Noodles)',
      start: 4,
      description: "Light and refreshing, Zaru Soba (Cold Soba Noodles)"
          "will be your summer go-to staple. 10-minute is all you need to whip...",
      author: 'John',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Image(
                        image: AssetImage('assets/nonAvatar.png'),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jason',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 20),
                        Text('Email: example@example.com')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 2.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IconDetail(
                    icon: Icons.assignment,
                    color: Colors.red,
                    number: 3,
                    text: "Press to your recipes",
                    page: UserRecipesPage(),
                  ),
                  IconDetail(
                    icon: Icons.bookmark,
                    color: Colors.blue,
                    number: 20,
                    text: "Press to your bookmarks",
                    page: CollectionPage(),
                  ),
                  IconDetail(
                    icon: Icons.star_outlined,
                    color: Colors.yellow,
                    number: 15,
                    text: "Press to your ratings",
                    page: UserRatingsPage(),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: const [
                  Icon(Icons.assignment),
                  Text(
                    ' Recently Recipes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
            ListRecipeReview(0.5, _listReciepReviews)
          ]),
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}
