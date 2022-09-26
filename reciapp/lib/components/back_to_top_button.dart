// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  ScrollController scrollController;
  bool showbtn;

  BackToTopButton(this.scrollController, this.showbtn);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000), //show/hide animation
      opacity: showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
      child: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
              //go to top of scroll
              0, //scroll offset to go
              duration: Duration(milliseconds: 500), //duration of scroll
              curve: Curves.fastOutSlowIn //scroll type
              );
        },
        child: Icon(Icons.arrow_upward),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
      ),
    );
  }
}

// ADD IN EACH PAGE BEFORE USING THIS BUTTON

// ScrollController scrollController = ScrollController();
//   bool showbtn = false;

//   @override
//   void initState() {
//     scrollController.addListener(() { //scroll listener 
//         double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0

//         if(scrollController.offset > showoffset){
//               showbtn = true;
//               setState(() {
//                 //update state 
//               });
//         }else{
//              showbtn = false;
//               setState(() {
//                 //update state 
//               });
//         }
//     });
//     super.initState();
//   }
