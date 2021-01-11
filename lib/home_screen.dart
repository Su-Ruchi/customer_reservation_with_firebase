import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_reservation/customer.dart';
import 'package:customer_reservation/owner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  Future<void> _login() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,   //owner@gmail.com
          password: password.text) //1234567
          .then((em) =>
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Owner())),
      );
    }
   catch(e){
      Message.showMessage("Owner Not Found");
   }
  }

FirebaseAuth auth = FirebaseAuth.instance;
  List<String> imageLink = [
    'asset/hotel_image.jpg',
    'asset/hotel_image_3.jpg',
    'asset/hotel_image_2.jpg',
    'asset/hotel_image_4.jpg'
  ];
  TextEditingController controller = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height,
            child: Stack(
      children: [
            Column(children: [
              ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Color(0xFF000000),
                          Color(0xFF00008B),
                        ])),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            initialPage: 1,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: imageLink.map((imageLink) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  imageLink,
                                  fit: BoxFit.cover,
                                ),
                              );
                            });
                          }).toList(),
                        ),
                      ],
                    ),
                  )),
              CircleAvatar(
                backgroundImage: AssetImage("asset/image_for_logo.png"),
                radius: 60,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF000000),
                          Color(0xFF00008B),
                        ]),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Customer()));
                  },
                  child: Text(
                    "Customer Reservation",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text("Fill Some Details.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 14)))
            ]),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
              child: DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  maxChildSize: 1,
                  minChildSize: 0.1,
                  builder: (context, controller) {
                    return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF000000),
                                Color(0xFF00008B),
                              ]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 20),
                            itemCount: 1,
                            controller: controller,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.height / 30),
                                child: Column(children: [
                                  Text(
                                    "For Owner",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.0),
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.0),
                                                  ),
                                                  child: TextFormField(
                                                    controller: email,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        labelText: "Email",
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Color(0xFF000000),
                                                            fontWeight:
                                                                FontWeight.bold),
                                                        filled: true,
                                                        fillColor: textColor,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0),
                                                          borderSide: BorderSide(
                                                            color:
                                                                Color(0xFF00008B),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0),
                                                          borderSide: BorderSide(
                                                            color:
                                                                Color(0xFF00008B),
                                                          ),
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.email,
                                                          color: Color(0xFF00008B),
                                                        )),
                                                    validator: (val) => val.isEmpty
                                                        ? "Please type an email"
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40.0,
                                                ),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.0),
                                                  ),
                                                  child: TextFormField(
                                                    controller: password,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        labelText: "Password",
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Color(0xFF000000),
                                                            fontWeight:
                                                                FontWeight.bold),
                                                        filled: true,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0),
                                                          borderSide: BorderSide(
                                                            color:
                                                                Color(0xFF00008B),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0),
                                                          borderSide: BorderSide(
                                                            color:
                                                                Color(0xFF00008B),
                                                          ),
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.vpn_key,
                                                          color: Color(0xFF00008B),
                                                        )),
                                                    validator: (val) => val.isEmpty
                                                        ? "Please type a password"
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40.0,
                                                ),

                                                GestureDetector(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topLeft,
                                                          end:
                                                              Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xFF000000),
                                                            Color(0xFF00008B),
                                                          ]),
                                                    ),
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    height: 50.0,
                                                    child: Center(
                                                      child: Text(
                                                        "Login",
                                                        style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    _login();
                                                  }
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                // SizedBox(height: 10.0,),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            }));
                  }),
            )
      ],
    ),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 70);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


