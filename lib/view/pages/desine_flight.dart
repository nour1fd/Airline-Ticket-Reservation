import 'package:flutter/material.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/view/pages/detailsforoneflight.dart';

class FlightTile extends StatelessWidget {
  final FlightModel flightModel;

  const  FlightTile({required this.flightModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Card(shadowColor: Colors.deepOrangeAccent,
        elevation: 5.0,
        color: Colors.white70,
        child: ListTile(
          onTap: () {
            Navigator.push
              (context, MaterialPageRoute(
                builder: (BuildContext context)=>DetailsForFlightUser(flightModel: flightModel,)));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(flightModel.id.toString(),
              style: TextStyle(
                  color: Colors.deepOrangeAccent
              ),),
          ),
          title: Row(
            children: [
              Text(flightModel.departuresFrom+"    --->    "+ flightModel.arrivalsTo,
                style: (
                    TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    )
                ),
              )
            ],
          ),
          subtitle: Text(flightModel.dateTime.toString()),
        ),
      ),
    );




  }
}
// final ViewFlightgetx viewController = Get.put(ViewFlightgetx());
//   late List<FlightModel> allcharacter;
//   late List<FlightModel> allsearchedcharacter;
//   bool issearching=false;
//   final Searchtextcontroller=TextEditingController();
//   Widget buildsearch(){
//     return TextField(
//       controller:Searchtextcontroller,
//       cursorColor:Colors.pink ,
//       decoration: InputDecoration(
//           hintText: "find what you want",
//           border: InputBorder.none
//       ),
//       style: TextStyle(color: Colors.deepOrangeAccent),
//       onChanged: (searchedchracter){
//         addSearchingofitemtosearchlist(searchedchracter );
//       },
//     );
//   }
//   void addSearchingofitemtosearchlist(String searchedchracter){
//     allsearchedcharacter =allcharacter.where((character) =>
//         character.arrivalsTo.toLowerCase().startsWith(searchedchracter)).toList();
//     setState(() {
//
//     });
//   }
//   List<Widget>buildabar(){
//     if(issearching){
//       return [IconButton(onPressed: (){
//         clearsearch();
//         Navigator.pop(context);
//       },
//           icon: Icon(Icons.clear,color: Colors.deepOrangeAccent,))];
//     }else{
//       return[
//         IconButton(onPressed:startsearching
//             , icon: Icon(Icons.search,color: Colors.green,))
//       ];
//     }
//   }
//   void startsearching(){
//     ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
//         onRemove:stopsearching
//     ));
//     setState(() {
//       issearching=true;
//     });
//   }
//
//   void stopsearching(){
//     clearsearch();
//     setState(() {
//       issearching=false;
//     });
//   }
//   void clearsearch(){
//     setState(() {
//       Searchtextcontroller.clear();
//     });
//   }
//   Widget buildAppbarTitle(){
//     return Text(("B.B"));
//   }
//
//   @override
//   buildchRcterlist() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: Searchtextcontroller.text.isEmpty?allcharacter.length:allsearchedcharacter.length,
//         itemBuilder: (context, index) {
//           return FlightTile(flightModel:Searchtextcontroller.text.isEmpty?
//           allcharacter[index]:allsearchedcharacter[index]);
//         },
//       ),
//     );
//   }
//
//
//   Widget buildloadedList() {
//     return Container(
//       color: Colors.lightGreenAccent,
//       child: Column(
//           children: [
//             buildchRcterlist(),
//
//           ]),
//     );
//   }
//
//   void initState() {
//     super.initState();
//     BlocProvider.of<ViewCubit>(context).gettll();
//   }
//
//
//
//   Widget buildBlockWidget() {
//     return BlocBuilder<ViewCubit, ViewState>(builder: (context, state) {
//       if (state is Viewloaded) {
//         allcharacter = (state).flighting;
//         return buildloadedList();
//       } else {
//         return CircularProgressIndicator(
//           color: Colors.lightGreen,
//         );
//       }
//     });
//   }
//
//
//
//
//
//   List<Widget> pages =[
//     HomePage()
//     ,MyTrip(),
//     Money(),
//     Help()
//   ];
//   int selectitem= 0;
//   void onitemtap(int index){
//     setState(() {
//       selectitem=index;
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => pages[index],));
//
//     });
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child:Container(
//           child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: ListView(
//                 children: [
//                   MaterialButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Edaitprofile()));
//                     },
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.black12,
//                           child:
//                           Icon(Icons.person,color: Colors.black),
//                         ),
//                         Text(" Your profile ",style:TextStyle(
//                           fontSize: 25.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         )
//                       ],
//                     ),
//
//                   ),
//                   Divider(color: Colors.deepOrangeAccent,thickness: 2.0,),
//                   SizedBox(height:25 ,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>CreatBank()));
//
//                   } ,
//                       child: Text("Account in our bank",style:TextStyle(
//                         fontSize:20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       )
//                   ),
//                   Divider(color: Colors.deepOrangeAccent,thickness: 1,),
//                   SizedBox(height:45 ,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Privacy()));
//
//                   } ,
//                       child: Text("Privacy Policy",style:TextStyle(
//                         fontSize:20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       )
//                   ),
//                   Divider(color: Colors.deepOrangeAccent,thickness:1,),
//                   SizedBox(height:45 ,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Help()));
//
//                   } ,
//                       child: Text("Get Help",style:TextStyle(
//                         fontSize:20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       )
//                   ),
//                   Divider(color: Colors.deepOrangeAccent,thickness:1,),
//                   SizedBox(height:45 ,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>feedback()));
//
//                   } ,
//                       child: Text("Give us feedback",style:TextStyle(
//                         fontSize:20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       )
//                   ),
//                   Divider(color: Colors.deepOrangeAccent,thickness: 1,),
//                   SizedBox(height:55 ,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>LogIn()));
//                   } ,
//                       child: Text("Log out",style:TextStyle(
//                         fontSize:20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       )
//                   ),
//                   Divider(color: Colors.white,thickness: 1 ,)
//                 ],
//               )
//           ),
//         ),
//
//       ),
//       appBar: AppBar(
//         title: issearching?buildsearch():buildAppbarTitle(),
//
//         actions:buildabar(),
//
//       ),
//       bottomNavigationBar:BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         fixedColor: Colors.deepOrangeAccent,
//         items:const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon:Icon(Icons.home_filled),
//             label: "Home",),
//           BottomNavigationBarItem(
//               icon:Icon(Icons.wallet_travel_outlined),
//               label: "My Trips"),
//           BottomNavigationBarItem(
//               icon:Icon(Icons.monetization_on_outlined),
//               label: "Money"),
//           BottomNavigationBarItem(
//               icon:Icon(Icons.wifi_calling_outlined),
//               label: "Conect Us")
//         ],
//         onTap:  onitemtap,
//         currentIndex: selectitem,
//       ),
//       body:
//       buildBlockWidget()
//
//     );
//   }