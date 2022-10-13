import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ReciepReview {
  final String image;
  final String title;
  final double start;
  final String description;
  final String author;

  ReciepReview({
    @required required this.image,
    @required required this.title,
    @required required this.start,
    @required required this.description,
    @required required this.author,
  });
}

class RecipeReviewItem extends StatelessWidget {
  const RecipeReviewItem({
    super.key,
    required this.image,
    required this.title,
    required this.start,
    required this.description,
    required this.author,
  });

  final String image;
  final String title;
  final double start;
  final String description;
  final String author;

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
                  author: author,
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
    required this.author,
  });

  final String title;
  final double start;
  final String description;
  final String author;

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
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          SimpleStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: start,
            size: 13,
            spacing: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            description,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 10.0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const WidgetSpan(
                  child: Text(
                    'By',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    ' $author',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListRecipeReview extends StatelessWidget {
  final List<ReciepReview> list;
  final double heightValue;

  const ListRecipeReview(
    this.heightValue,
    this.list,
    {super.key}
    );

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
            height: MediaQuery.of(context).size.height * heightValue,
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
                    author: list[index].author,
                  );
                },
                itemCount: list.length,
              ),
            ),
          );
  }
}
