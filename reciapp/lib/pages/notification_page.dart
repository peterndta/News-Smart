import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciapp/object/notification_item.dart';
import 'package:reciapp/object/notifications_review.dart';
import '../components/bottom_bar.dart';
import '../login_support/user_preference.dart';
import '../object/user_info.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    fetchInfiniteNotifications(0);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfiniteNotifications(0);
      }
    });
    markReadNotifications();
  }

  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  final List<NotificationItem> _listNotifications = [];
  List<String> listSort = ['Newest', 'Oldest'];
  String sortKey = "Newest";

  Future fetchInfiniteNotifications(int pages) async {
    if (isLoading) return;
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    isLoading = true;
    const limit = 6;
    if (pages != 0) page = pages;
    print('Call: ' +
        'https://reciapp.azurewebsites.net/api/user/${userData.userID}/notifications/page/$page?PageSize=$limit');
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/user/${userData.userID}/notifications/page/$page?PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print(responseJson);
      if (!mounted) return;
      setState(() {
        isLoading = false;
        if (pages != 0) page = pages;
        page++;
        if (responseJson['data'].length < limit) {
          hasMore = false;
        }
        if (pages == 1) _listNotifications.clear();
        _listNotifications.addAll(responseJson['data']
            .map<NotificationItem>((p) => NotificationItem.fromJson(p))
            .toList());
      });
      print('Sucessfully');
    } else {
      print(json.decode(response.body));
      setState(() {
        hasMore = false;
      });
    }
  }

  Future markReadNotifications() async {
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    print('Call: ' +
        'https://reciapp.azurewebsites.net/api/user/${userData.userID}/mark-read');
    http.Response response = await http.put(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/user/${userData.userID}/mark-read'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: GoogleFonts.satisfy(
            color: const Color.fromARGB(255, 59, 59, 61),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.orange,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.only(right: 15),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: sortKey,
                    onChanged: (String? newValue) {
                      setState(() {
                        sortKey = newValue!;
                      });
                    },
                    items:
                        listSort.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ListNotificationsReview(
                0.7, _listNotifications, controller, hasMore, sortKey)
          ],
        ),
      ),
      bottomNavigationBar: bottomMenuBar(context, 'notifications'),
    );
  }
}
