import 'package:flutter/material.dart';
import 'package:reciapp/components/filter_course.dart';
import 'package:reciapp/components/infinite_scroll.dart';

import '../components/sidebar_menu.dart';
import '../object/food_list.dart';
import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../object/recipe_review.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  TextEditingController keywords = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('User Bookmark'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              // alignment: Alignment.topCenter,
              // height: MediaQuery.of(context).size.height * 0.1,
              // child: Form(
              //     child: TextFormField(
              //         validator: (String? value) {
              //           return (value == null || value.isEmpty)
              //               ? 'Please enter'
              //               : null;
              //         },
              //         controller: keywords,
              //         decoration: const InputDecoration(
              //           prefixIcon: Icon(Icons.search),
              //           hintText: 'Search Key',
              //           alignLabelWithHint: false,
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5)),
              //           ),
              //         ))),
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: MediaQuery.of(context).size.height * 0.7,
              child: InfiniteScroll(),
            ),
            ListRecipeReview(0.72, _listReciepReviews)
          ],
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}