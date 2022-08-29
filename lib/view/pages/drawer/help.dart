import 'package:flutter/material.dart';

class Help extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.deepOrangeAccent,
      title: Text("Help Center",style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w400
      )),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("We are here for any Question >>",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),),
          Text("Just tell us your problem >>"
            ,style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 50.0,),
          TextField(
            decoration: InputDecoration(
            hintText: "ADLERcompanySupport@Gmail.com",
            icon:Icon(Icons.email,color: Colors.deepOrangeAccent,),
          ),
          style: TextStyle(color: Colors.indigo,
          fontSize: 15.0,
          fontWeight: FontWeight.w500),
          readOnly: true,
          cursorColor: Colors.deepOrangeAccent,),
          Image.asset("assets/images/help.jpg"),

        ],
      ),
    ),
    );
  }
}
