import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reqresapp/app/app_theme.dart';
import 'package:reqresapp/app/modules/home/data/models/user.model.dart';
import 'package:reqresapp/app/modules/home/presenter/store/home.store.dart';
import 'package:reqresapp/app/modules/home/presenter/widgets/settingsButton.dart';
import 'package:reqresapp/app/modules/home/presenter/widgets/userItem.widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(
        builder: (_) => SettingsButton(
          email: controller.email,
          id: controller.id,
          onChanged: controller.clearData,
        ),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: ThemeLoginApp.appColor,
          ),
          Container(
            color: ThemeLoginApp.appColor,
            height: 100,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Reqres Users',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Observer(
                name: 'ListUsers',
                builder: (BuildContext context) {
                  return (controller.usersAPI != null ||
                          controller.usersAPI.length != 0)
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.5 / 3,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: controller.usersAPI.length,
                          itemBuilder: (ctx, index) {
                            return UserItem(user: controller.usersAPI[index]);
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
