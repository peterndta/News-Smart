// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import '../components/back_to_top_button.dart';
import 'food.dart';
import 'package:flutter/material.dart';

class TestInfiniteScroll extends StatefulWidget {
  @override
  State<TestInfiniteScroll> createState() => _TestInfiniteScrollState();
}

class _TestInfiniteScrollState extends State<TestInfiniteScroll> {
  final controller = ScrollController();

  final List<Food> foods = [
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short descriptionnnnnnnnnnnnnn ...',
      mail: '',
    ),
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short description ...',
      mail: '',
    ),
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short description ...',
      mail: '',
    ),
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short description ...',
      mail: '',
    ),
  ];

  // @override
  // void initState() {
  //   scrollController.addListener(() {
  //     //scroll listener
  //     double showoffset =
  //         10.0; //Back to top botton will show on scroll offset 10.0
  //     if (scrollController.offset > showoffset) {
  //       showbtn = true;
  //       setState(() {
  //         //update state
  //       });
  //     } else {
  //       showbtn = false;
  //       setState(() {
  //         //update state
  //       });
  //     }
  //   });
  //   super.initState();
  // }
  Future fetch() async {
    setState(() {
      foods.add(
        //add chỉ add dc 1 item, muốn add 2 trở lên phải dùng addAll và trả về 1 list các item
        Food(
          image:
              'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
          name: 'Chicken fry Burrito',
          author: 'Tommy',
          content: 'short descriptionnnnnnnnnnnnnn ...',
          mail: '',
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //physics: NeverScrollableScrollPhysics(),
      controller: controller,
      shrinkWrap: true,
      itemCount: foods.length + 1,
      itemBuilder: ((context, index) {
        if (index < foods.length) {
          final food = foods[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                      top: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(food.image),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.end,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[600]),
                          Icon(Icons.star, color: Colors.amber[600]),
                          Icon(Icons.star, color: Colors.amber[600]),
                          Icon(Icons.star, color: Colors.amber[600]),
                          Icon(Icons.star, color: Colors.amber[600]),
                        ],
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(food.content)),
                      Row(
                        children: [
                          Text('by '),
                          Text(
                            food.author,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
