import 'package:flutter/material.dart';
import '../components/copyright.dart';
import '../object/recipe_review.dart';

class UserRatingsPage extends StatefulWidget {
  const UserRatingsPage({super.key});

  @override
  State<UserRatingsPage> createState() => _UserRatingsPageState();
}

class _UserRatingsPageState extends State<UserRatingsPage> {
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
        title: const Text('User Ratings'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.orange,
        backgroundColor: Colors.white,
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