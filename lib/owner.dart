import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Owner extends StatefulWidget {
  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF000000),
                  Color(0xFF00008B),
                ])),
          ),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("details").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot details = snapshot.data.documents[index];
                return Container(
                    child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF000000),
                                Color(0xFF00008B),
                              ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("d");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              content: Text(
                                                  "Deleting its document will also delete its data"),
                                              title: Center(
                                                child: Text(
                                                    "Do You Want To Delete?"),
                                              ),
                                              actions: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18),
                                                    )),
                                                //SizedBox(width: 150,),
                                                GestureDetector(
                                                    onTap: () {
                                                      DocumentSnapshot ds =
                                                          snapshot.data
                                                              .documents[index];
                                                      db
                                                          .collection('details')
                                                          .doc(ds.documentID)
                                                          .delete()
                                                          .then((value) =>
                                                              Navigator.pop(
                                                                  context));
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18),
                                                      ),
                                                    ))
                                              ]);
                                        });
                                  }),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height / 2,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.height / 8),
                                Text(
                                  details['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height / 2,
                            child: Row(
                              children: [
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height /
                                        25),
                                Text(
                                  details['phone_Number'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height / 2,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height /
                                        7.8),
                                Text(
                                  details['email'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height / 2,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height /
                                        7.5),
                                Text(
                                  details['time'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height / 2,
                            child: Row(
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height /
                                        7.2),
                                Text(
                                  details['date'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ));
              },
            );
          },
        ));
  }
}
