import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_reservation/home_screen.dart';
import 'package:flutter/material.dart';


import 'message.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  var _formKey = GlobalKey<FormState>();
  var textColor = Colors.white;


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
 //   var now = DateTime.now();
   /* String formatDate = DateFormat.yMMMd().format(now);
    String formatTime = DateFormat('mm:ss').format(now);*/

    return Scaffold(
        body: Stack(children: [
      Opacity(
        opacity: 0.6,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "asset/customer_page_background.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF000000),
                Color(0xFF00008B),
              ])),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7,
              left: MediaQuery.of(context).size.height / 19),
          width: MediaQuery.of(context).size.width / 1.2,
          child: CarouselSlider.builder(
              itemCount: 1,
              options: CarouselOptions(
                height: 550.0,
                initialPage: 1,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
              itemBuilder: (BuildContext context, int item) =>
                  SingleChildScrollView(
                    child: Container(
                        child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Fill Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  controller: name,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      labelText: "Name",
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000),
                                      ),
                                      filled: true,
                                      fillColor: textColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Color(0xFF00008B),
                                      )),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: phoneNumber,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold),
                                    filled: true,
                                    fillColor: textColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.call,
                                      color: Color(0xFF00008B),
                                    ),
                                  ),
                                  validator: (val) {
                                    if(val.isEmpty ){
                                      return "Please enter phone number";
                                    }
                                    else if(val.length<10){
                                      return "Please enter correct number";
                                    }
                                   return null;
                                  }
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  controller: email,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      hintText: 'customer@gmail.com',
                                      labelStyle: TextStyle(
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold),
                                      filled: true,
                                      fillColor: textColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Color(0xFF00008B),
                                      )),
                                  validator: (val) => val.isEmpty
                                      ? "Please type a exact time"
                                      : null,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: time,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: 'Time',
                                    hintText: '10:10',
                                    labelStyle: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold),
                                    filled: true,
                                    fillColor: textColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.access_time,
                                      color: Color(0xFF00008B),
                                    ),
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? "Please type a exact time"
                                      : null,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  controller: date,
                                  keyboardType: TextInputType.datetime,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: 'Date',
                                    hintText: '24/12/2020',
                                    labelStyle: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold),
                                    filled: true,
                                    fillColor: textColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFF00008B),
                                    ),
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? "Please type a Today Date"
                                      : null,
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              GestureDetector(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50.0,
                                    color: Color(0xFF000000),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Map<String, dynamic> data = {
                                      "name": name.text,
                                      "phone_Number": phoneNumber.text,
                                      "email": email.text,
                                      "time": time.text,
                                      "date": date.text,
                                    };
                                    if(_formKey.currentState.validate()){
                                      FirebaseFirestore.instance
                                          .collection("details")
                                          .add(data)
                                          .then((value) => Message.showMessage(
                                          "Thanks For Visit."))
                                          .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen())));
                                    }
                                  else{
                                      Message.showMessage("Please fill correct details");
                                    }
                                  }),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )),
                  )))
    ]));
  }
}
