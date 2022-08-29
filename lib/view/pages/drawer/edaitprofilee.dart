import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plane/cons.dart';

class Edaitprofile extends StatefulWidget {
  const Edaitprofile({Key? key}) : super(key: key);

  @override
  _EdaitprofileState createState() => _EdaitprofileState();
}

class _EdaitprofileState extends State<Edaitprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      elevation: 0.0,
          foregroundColor: Colors.indigo,),
    body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello ! ,",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: Colors.black54
            ),),
            SizedBox(height: 10.0,),
            Divider(height: 2,color: Colors.deepOrangeAccent,thickness: 2,),
            SizedBox(height: 30.0,),
            Row(
              children: [
                CircleAvatar(child:
                Icon(Icons.perm_contact_cal_outlined,size: 40.0,color: Colors.black26,),
                  backgroundColor: Colors.white30,
                ),
                Column(
                  children: [
                    Text("   Your Name",
                      style: TextStyle(
                      color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 20.0
                    ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("$name",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,fontWeight: FontWeight.w400,fontSize: 18.0
                      ),),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30.0,),
            Row(
              children: [
                CircleAvatar(child:
                Icon(Icons.drive_file_rename_outline,size: 40.0,color: Colors.black26,),
                  backgroundColor: Colors.white30,
                ),

                Column(
                  children: [
                    Text("  Your user_name",
                      style: TextStyle(
                          color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 20.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("$user_name",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,fontWeight: FontWeight.w400,fontSize: 18.0
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                CircleAvatar(child:
                Icon(Icons.phone,size: 40.0,color: Colors.black26,),
                  backgroundColor: Colors.white30,
                ),
                Column(
                  children: [
                    Text("  Your Email",
                      style: TextStyle(
                          color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 20.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("$email",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,fontWeight: FontWeight.w400,fontSize: 18.0
                      ),),
                  ],
                ),
              ],
            ),

          ],
              ),
      ),
    ),
    );
  }
}
