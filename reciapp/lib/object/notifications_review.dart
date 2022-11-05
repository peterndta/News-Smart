import 'package:flutter/material.dart';
import 'package:reciapp/object/notification_item.dart';

class NotificationsReviewItem extends StatelessWidget {
  const NotificationsReviewItem({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => NotificationsDetailPage(id: post.id),
      //   ));
      // },
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
                  image: NetworkImage(notification.imageUrl),
                ),
              ),
              Expanded(
                flex: 3,
                child: NotificationsDetail(
                  name: notification.name,
                  message: notification.message,
                  createDate: notification.createDate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsDetail extends StatelessWidget {
  const NotificationsDetail({
    super.key,
    required this.name,
    required this.message,
    required this.createDate,
  });

  final String name;
  final String message;
  final String createDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            overflow: TextOverflow.fade,
            softWrap: false,
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              message,
              overflow: TextOverflow.fade,
              softWrap: false,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              createDate,
              overflow: TextOverflow.fade,
              softWrap: false,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListNotificationsReview extends StatelessWidget {
  final List<NotificationItem> list;
  final double heightValue;
  final ScrollController scrollController;
  final bool hasMore;

  const ListNotificationsReview(
      this.heightValue, this.list, this.scrollController, this.hasMore,
      {super.key});

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
                  final notification = list[index];
                  return NotificationsReviewItem(
                    notification: notification,
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
