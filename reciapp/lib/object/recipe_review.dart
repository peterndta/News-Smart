import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

import '../login_support/check_auth.dart';
import '../pages/recipe_detail.dart';
import 'get_posts_homepage.dart';

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
  const RecipeReviewItem({super.key, required this.post});

  final GetPosts post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final getUserID = Provider.of<UserInfoProvider>(context, listen: false);
        Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecipeDetailPage(id: post.id, token: getUserID.token),
            ));
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
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.02,
                  height: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.cover,
                  image: NetworkImage(post.imageUrl),
                ),
              ),
              Expanded(
                flex: 3,
                child: RecipeDetail(
                  title: post.name,
                  start: post.averageRating,
                  description: post.description,
                  author: post.userName,
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
  final int start;
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
            rating: start * 1.0,
            size: 13,
            spacing: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              description,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Container(
            alignment: Alignment.centerRight,
            child: Text.rich(
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
          ),
        ],
      ),
    );
  }
}

class ListRecipeReview extends StatelessWidget {
  final List<GetPosts> list;
  final double heightValue;
  final ScrollController scrollController;
  final bool hasMore;

  const ListRecipeReview(
      this.heightValue, this.list, this.scrollController, this.hasMore,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
            height: MediaQuery.of(context).size.height * heightValue,
            child: Scrollbar(
                thickness: 7,
                radius: const Radius.circular(20),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: list.length + 1,
                  itemBuilder: (context, index) {
                    if (index < list.length) {
                      final post = list[index];
                      return RecipeReviewItem(
                        post: post,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: hasMore
                              ? CircularProgressIndicator()
                              : Text('No more data to load'),
                        ),
                      );
                    }
                  },
                )
                //   ),
                ));
  }
}
