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

class IconDetail extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int number;
  final String text;
  const IconDetail({
    super.key,
    required this.color,
    required this.number,
    required this.icon,
    required this.text,
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
            print('Press the button');
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
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 2.0))),
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconDetail(
                    icon: Icons.assignment,
                    color: Colors.red,
                    number: 3,
                    text: "Press to your recipes",
                  ),
                  IconDetail(
                    icon: Icons.bookmark,
                    color: Colors.blue,
                    number: 20,
                    text: "Press to your bookmarks",
                  ),
                  IconDetail(
                    icon: Icons.star_outlined,
                    color: Colors.yellow,
                    number: 15,
                    text: "Press to your ratings",
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
            ListRecipeReview(_listReciepReviews),
          ]),
        ),
      ),
      bottomNavigationBar: const Copyright(),
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
    return InkWell(
      onTap: () {
        print('Click on card');
      },
      splashColor: const Color.fromARGB(255, 211, 210, 210),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
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
      ),
    );
  }
}

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({
    super.key,
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
          SimpleStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: start,
            size: 15,
            spacing: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
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

  const ListRecipeReview(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return (list.isEmpty)
        ? Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.topLeft,
            child: const Text(
              'No posts were found.',
              style: TextStyle(fontSize: 20),
            ))
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.47,
            child: Scrollbar(
              thickness: 7,
              radius: const Radius.circular(20),
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
            ),
          );
  }
}
