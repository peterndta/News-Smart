import 'package:flutter/material.dart';
import 'package:reciapp/object/notification_item.dart';

class NotificationsReviewItem extends StatelessWidget {
  const NotificationsReviewItem({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
  final DateTime createDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            overflow: TextOverflow.fade,
            maxLines: 2,
            '$name is removed by Admin',
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14.0, color: Colors.red),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              message,
              overflow: TextOverflow.fade,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              getDateRemain(createDate),
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

getDateRemain(DateTime reportDate) {
  var now = DateTime.now();
  var diffDate = now.difference(reportDate);
  if (diffDate.inDays == 0) {
    return "Reported 1 day";
  }
  return "Reported ${diffDate.inDays} days";
}

class ListNotificationsReview extends StatelessWidget {
  final List<NotificationItem> list;
  final double heightValue;
  final ScrollController scrollController;
  final bool hasMore;
  final String sortKey;

  const ListNotificationsReview(this.heightValue, this.list,
      this.scrollController, this.hasMore, this.sortKey,
      {super.key});

  @override
  Widget build(BuildContext context) {
    if (sortKey == 'Oldest') {
      list.sort((a, b) => a.createDate.compareTo(b.createDate));
    } else {
      list.sort((a, b) => b.createDate.compareTo(a.createDate));
    }
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
