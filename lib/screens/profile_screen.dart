import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movieapp/main.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  ProfileScreen({Key key, @required this.username}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.all(16),
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFE4E9F4),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ProfilePic(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          "${widget.username}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            // alignment: Alignment.centerRight,
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  // PostModel.publish(controllerJudul.text, isi);
                },
                // onPressed: () {},
                icon: Icon(Icons.exit_to_app),
                label: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFF2995B2))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfilePic(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFFEDB72),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/icon_Camera.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
