// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reciapp/components/filter_course.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

import '../components/sidebar_menu.dart';
import '../object/food_list.dart';
import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../object/recipe_review.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String tag = "Newest";
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
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Form(
                  child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Please enter'
                            : null;
                      },
                      controller: keywords,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search Key',
                        alignLabelWithHint: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.024,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: tag,
                          isDense: true,
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                                child: Text("Newest"), value: "Newest"),
                            DropdownMenuItem(
                                child: Text("Oldest"), value: "Oldest"),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              tag = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ])),
            ),
            ListRecipeReview(0.72, _listReciepReviews)
          ],
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}

// class RecipeReviewItem extends StatelessWidget {
//   const RecipeReviewItem({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.start,
//     required this.description,
//   });

//   final String image;
//   final String title;
//   final double start;
//   final String description;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print('Click on card');
//       },
//       splashColor: const Color.fromARGB(255, 211, 210, 210),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5.0),
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           decoration: const BoxDecoration(
//               border:
//                   Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Image.network(image),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: RecipeDetail(
//                   title: title,
//                   start: start,
//                   description: description,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ReciepReview {
//   final String image;
//   final String title;
//   final double start;
//   final String description;

//   ReciepReview({
//     @required required this.image,
//     @required required this.title,
//     @required required this.start,
//     @required required this.description,
//   });
// }

// class RecipeDetail extends StatelessWidget {
//   const RecipeDetail({
//     super.key,
//     required this.title,
//     required this.start,
//     required this.description,
//   });

//   final String title;
//   final double start;
//   final String description;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 14.0,
//             ),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//           SimpleStarRating(
//             allowHalfRating: true,
//             starCount: 5,
//             rating: start,
//             size: 15,
//             spacing: 10,
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//           Text(
//             description,
//             style: const TextStyle(fontSize: 10.0),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListRecipeReview extends StatelessWidget {
//   final List<ReciepReview> list;

//   const ListRecipeReview(this.list, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return (list.isEmpty)
//         ? Container(
//             padding: const EdgeInsets.all(5),
//             alignment: Alignment.topLeft,
//             child: const Text(
//               'No posts were found.',
//               style: TextStyle(fontSize: 20),
//             ))
//         : SizedBox(
//             height: MediaQuery.of(context).size.height * 0.72,
//             child: Scrollbar(
//               thickness: 7,
//               radius: const Radius.circular(20),
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return RecipeReviewItem(
//                     image: list[index].image,
//                     title: list[index].title,
//                     start: list[index].start,
//                     description: list[index].description,
//                   );
//                 },
//                 itemCount: list.length,
//               ),
//             ),
//           );
//   }
// }
