import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/pages/user_profile.dart';
import 'package:reciapp/pages/user_recipes_page.dart';
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
  const RecipeReviewItem({super.key, required this.post, required this.page});

  final GetPosts post;
  final String page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RecipeDetailPage(id: post.id),
        ));
      },
      splashColor: const Color.fromARGB(255, 211, 210, 210),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
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
                  id: post.id,
                  title: post.name,
                  start: post.averageRating,
                  description: post.description,
                  author: post.userName,
                  page: page,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

deleteRecipe(BuildContext context, String postId, String page) async {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Deleting...')
              ],
            ),
          ),
        );
      });
  int data = await deletePosts(postId).whenComplete(() {
    Navigator.of(context).pop();
  });
  if (data == 200) {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 40.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Deleted')
                ],
              ),
            ),
          );
        });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (page == 'user_recipes_page') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserRecipesPage(),
        ));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserProfile(),
        ));
      }
    });
  } else {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red,
                    size: 40.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Fail to delete')
                ],
              ),
            ),
          );
        });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}

showAlertDialog(
    BuildContext context, String title, String postId, String page) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(color: Colors.grey),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Delete",
      style: TextStyle(color: Colors.red),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      deleteRecipe(context, postId, page);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Delete Recipe"),
    content: Text("Are you sure to continue deleting \"$title\" recipe"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    super.key,
    required this.id,
    required this.page,
    required this.title,
    required this.start,
    required this.description,
    required this.author,
  });

  final String page;
  final String id;
  final String title;
  final int start;
  final String description;
  final String author;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  maxLines: 1,
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
                color: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showAlertDialog(
                      context, widget.title, widget.id, widget.page);
                },
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          SimpleStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: widget.start == null ? 0.0 : (widget.start * 1.0),
            size: 11,
            spacing: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              widget.description,
              softWrap: false,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 8.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Container(
            alignment: Alignment.centerRight,
            child: Text.rich(
              overflow: TextOverflow.fade,
              softWrap: false,
              TextSpan(
                children: <InlineSpan>[
                  const WidgetSpan(
                    child: Text(
                      'By',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' ${widget.author}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
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

class ListAuthRecipeReview extends StatelessWidget {
  final List<GetPosts> list;
  final double heightValue;
  final ScrollController scrollController;
  final bool hasMore;
  final String page;

  const ListAuthRecipeReview(this.heightValue, this.list, this.scrollController,
      this.hasMore, this.page);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    page: page,
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: hasMore
                          ? const CircularProgressIndicator()
                          : const Text('No more data to load'),
                    ),
                  );
                }
              },
            )
            //   ),
            ));
  }
}
