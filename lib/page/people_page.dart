import "package:flutter/material.dart";
import "package:hand_mademodel_api/model/user_model.dart";
import "package:hand_mademodel_api/service/user_service.dart";
class PeopleHome extends StatefulWidget {
  const PeopleHome({super.key});

  @override
  State<PeopleHome> createState() => _PeopleHomeState();
}

class _PeopleHomeState extends State<PeopleHome> {
  UserServices _services = UserServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: _services.fetchUserData(10),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError) {
            return Center(child: Text("Error"),);
          } else if(!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No data found"),);
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text("${snapshot.data![index].first} "),
                );
              },
            );
          }
        },
      ),
    );
  }
}
