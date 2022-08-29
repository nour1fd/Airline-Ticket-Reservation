import 'package:flutter/material.dart';

class feedback extends StatelessWidget {
  const feedback({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.deepOrangeAccent,
      title: Text("FeedBck",
          style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w400
      )),
    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration:
              InputDecoration(
                hintText: "Name",
              ),
              ),
              SizedBox(height: 30.0,),
              TextField(decoration:
              InputDecoration(
                hintText: "Phone Number",
              ), ),
              SizedBox(height: 30.0,),
              TextField(decoration:
              InputDecoration(
                hintText: "Email",
              ), ),
              SizedBox(height: 30.0,),
              TextField(decoration:
              InputDecoration(
                hintText: "Write to us any issue or query ",
              ), ),
              SizedBox(height: 50.0,),
              Center(
                child: MaterialButton(onPressed: () {
                },
                  child: Text("SUMBIT",style: TextStyle(color: Colors.white),),
                  color: Colors.deepOrangeAccent,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
