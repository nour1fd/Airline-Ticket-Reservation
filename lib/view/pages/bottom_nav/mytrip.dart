import 'package:flutter/material.dart';
import 'package:plane/cons.dart';
class MyTrip extends StatelessWidget {
  const MyTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$confirm",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange
              ),
              ),
              Divider(height: 2,
              color: Colors.black,
               thickness: 2.0,),
              SingleChildScrollView(
                child:
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return  Card(
                    );
                  },

                ),
              ),
              SizedBox(height: 30.0,),
              Text("$idflights"
                  ,style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent
              ),
              ),
              Divider(height: 2,
                color: Colors.black,
                thickness: 2.0,),
              ListView.builder(
                itemCount: 22,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return  Card(
                    child: ListTile(
                      onTap: () {
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                      ),
                      title: Text("title title"),
                      subtitle: Text("sub sub sub "),
                    ),
                  );
                },

              )



            ],
          ),
        ),
      ),

    );
  }
}
