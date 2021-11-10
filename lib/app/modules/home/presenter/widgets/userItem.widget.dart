import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reqresapp/app/app_theme.dart';
import 'package:reqresapp/app/modules/home/data/models/user.model.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  UserItem({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: user.avatar,
            progressIndicatorBuilder: (_, url, __) => _loadingItem(),
            errorWidget: (context, url, error) => _errorItem(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeLoginApp.appColor.withOpacity(0.75),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.firstname,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _loadingItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [ThemeLoginApp.kDefaultShadow],
      ),
      child: new Center(
        child: new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            ThemeLoginApp.kColorLightGrey,
          ),
          value: 2,
        ),
      ),
    );
  }

  _errorItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [ThemeLoginApp.kDefaultShadow],
      ),
      child: new Center(
        child: Icon(
          Icons.error,
          color: ThemeLoginApp.kColorLightGrey2,
          size: 40,
        ),
      ),
    );
  }
}
