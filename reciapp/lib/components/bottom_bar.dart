// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reciapp/pages/user_bookmark_page.dart';
import 'package:reciapp/pages/cooking_methods_page.dart';
import 'package:reciapp/pages/recipes_page.dart';
import '../pages/category_page.dart';

Widget bottomMenuBar(BuildContext context, String checkPage) {
  return BottomAppBar(
    elevation: 10,
    child: Container(
      color: Color.fromARGB(0, 157, 122, 17),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            checkPage == 'home'
                ? InkWell(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/Main_Reci_Logo.png'),
                          width: 28,
                          height: 28,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005),
                        checkPage == 'home'
                            ? Text(
                                'RECI',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : Text(
                                'RECI',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (_) => false);
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/Main_Reci_Logo.png'),
                          width: 28,
                          height: 28,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005),
                        checkPage == 'home'
                            ? const Text(
                                'RECI',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'RECI',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  ),
            checkPage == 'collection'
                ? InkWell(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.collections_bookmark_outlined,
                          color: Colors.orange,
                          size: 25,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'collection'
                            ? const Text(
                                'COLLECTION',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'COLLECTION',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookmarkPage()));
                    },
                    child: Column(
                      children: [
                        checkPage == 'collection'
                            ? const Icon(
                                Icons.collections_bookmark_outlined,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.collections_bookmark_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'collection'
                            ? const Text('COLLECTION',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9))
                            : const Text('COLLECTION',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9)),
                      ],
                    ),
                  ),
            checkPage == 'continent & use'
                ? InkWell(
                    child: Column(
                      children: [
                        checkPage == 'continent & use'
                            ? const Icon(
                                Icons.menu_book,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.menu_book,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'continent & use'
                            ? const Text(
                                'CON/USE',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'CON/USE',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RecipesPage()));
                    },
                    child: Column(
                      children: [
                        checkPage == 'continent & use'
                            ? const Icon(
                                Icons.menu_book,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.menu_book,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'continent & use'
                            ? const Text(
                                'CONT/USE',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'CONT/USE',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  ),
            checkPage == 'cooking method'
                ? InkWell(
                    child: Column(
                      children: [
                        checkPage == 'cooking method'
                            ? const Icon(
                                Icons.book_outlined,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.book_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'cooking method'
                            ? const Text(
                                'METHOD',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'METHOD',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CookingMethodsPage()));
                    },
                    child: Column(
                      children: [
                        checkPage == 'cooking method'
                            ? const Icon(
                                Icons.book_outlined,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.book_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'cooking method'
                            ? const Text(
                                'METHOD',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'METHOD',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  ),
            checkPage == 'category'
                ? InkWell(
                    child: Column(
                      children: [
                        checkPage == 'category'
                            ? const Icon(
                                Icons.soup_kitchen,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.soup_kitchen,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'category'
                            ? const Text(
                                'CATEGORY',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'CATEGORY',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryPage()));
                    },
                    child: Column(
                      children: [
                        checkPage == 'category'
                            ? const Icon(
                                Icons.soup_kitchen,
                                color: Colors.orange,
                                size: 25,
                              )
                            : const Icon(
                                Icons.soup_kitchen,
                                color: Colors.grey,
                                size: 25,
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        checkPage == 'category'
                            ? const Text(
                                'CATEGORY',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 9),
                              )
                            : const Text(
                                'CATEGORY',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    ),
  );
}
