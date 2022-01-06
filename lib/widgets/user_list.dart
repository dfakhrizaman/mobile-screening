import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/second_page_vm.dart';
import 'package:suitmedia_test/pages/third_page_vm.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<ThirdPageViewModel>(context, listen: false);
    model.populateList();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThirdPageViewModel>(context);
    final secondPageViewModel = Provider.of<SecondPageViewModel>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.atEdge) {
          if (notification.metrics.pixels == 0) {
            print('At top');
          } else {
            if (model.isAllLoaded == false) {
              model.appendList();
              model.setAllLoaded();
              print('At bottom and loaded second page');
            }
          }
        }
        return true;
      },
      child: model.getLength == 0
          ? const Text('The Data is Empty :(')
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      secondPageViewModel
                          .updateSelectedUser(model.getFullName(index));
                      // Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          model.getAvatarUrl(index),
                        ),
                      ),
                      title: Text(model.getFullName(index)),
                      subtitle: Text(model.getEmail(index)),
                    ),
                  ),
                );
              },
              itemCount: model.getLength,
            ),
    );
  }
}
