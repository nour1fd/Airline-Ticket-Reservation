import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/business/view/view_cubit.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/view/auth/login.dart';
import 'package:plane/view/pages/bottom_nav/money.dart';
import 'package:plane/view/pages/drawer/edaitprofilee.dart';
import 'package:plane/view/pages/drawer/help.dart';
import 'package:plane/view/pages/drawer/privacy.dart';
import 'desine_flight.dart';
import 'drawer/creataccount.dart';
import 'drawer/feedback.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  late List<FlightModel> allcharacter;
  late List<FlightModel> allsearchedcharacter;
  bool issearching=false;
  final Searchtextcontroller=TextEditingController();

  Widget buildsearch(){
    return TextField(
      controller:Searchtextcontroller,
      cursorColor:Colors.deepOrangeAccent ,
      decoration: InputDecoration(
          hintText: "Where do you  want to go?",
          border: InputBorder.none
      ),
      style: TextStyle(color: Colors.black),
      onChanged: (searchedchracter){
        addSearchingofitemtosearchlist(searchedchracter );
      },
    );
  }
  void addSearchingofitemtosearchlist(String searchedchracter){
    allsearchedcharacter =allcharacter.where((character) =>
        character.arrivalsTo.toLowerCase().startsWith(searchedchracter)).toList();
    setState(() {});
  }

  List<Widget>buildabar(){
    if(issearching){
      return [IconButton(onPressed: (){clearsearch();Navigator.pop(context);},
          icon: Icon(Icons.clear,color: Colors.white,))];}else{return[
            IconButton(onPressed:startsearching, icon: Icon(Icons.search,color: Colors.white,))];}}

  void startsearching(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove:stopsearching
    ));
    setState(() {issearching=true;});}

  void stopsearching(){clearsearch();
    setState(() {issearching=false;
    });
  }

  void clearsearch(){
    setState(() {
      Searchtextcontroller.clear();
    });
  }

  Widget buildAppbarTitle(){
    return Text(("             "),style: TextStyle(fontWeight: FontWeight.w500),);
  }

  @override
  buildchRcterlist() {
    return Expanded(
      child: ListView.builder(
        itemCount: Searchtextcontroller.text.isEmpty?allcharacter.length:allsearchedcharacter.length,
        itemBuilder: (context, index) {
          return FlightTile(flightModel:Searchtextcontroller.text.isEmpty?
          allcharacter[index]:allsearchedcharacter[index]);
        },
      ),
    );
  }


  Widget buildloadedList() {
    return Container(
      color: Colors.white70,
      child: Column(

          children: [
            SizedBox(height: 20.0,),
        Text(" All flights in our system ",
            style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 25.0,
          )),
            buildchRcterlist(),

          ]),
    );
  }

  void initState() {
    super.initState();
    BlocProvider.of<ViewCubit>(context).gettll();
  }



  Widget buildBlockWidget() {
    return BlocBuilder<ViewCubit, ViewState>(builder: (context, state) {
      if (state is Viewloaded) {
        allcharacter = (state).flighting;
        return buildloadedList();
      } else {
        return CircularProgressIndicator(
          color: Colors.amberAccent,
        );
      }
    });
  }

  List<Widget> pages =[
    HomePage(),
    Money(),
    Help()
  ];
  int selectitem= 0;
  void onitemtap(int index){
    setState(() {
      selectitem=index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[index],));

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child:Container(
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Edaitprofile()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black12,
                          child:
                          Icon(Icons.person,color: Colors.black),
                        ),
                        Text(" Your profile ",style:TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      ],
                    ),

                  ),
                  Divider(color: Colors.deepOrangeAccent,thickness: 2.0,),
                  SizedBox(height:25 ,),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>CreatBank()));

                  } ,
                      child: Text("Account in our bank",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),
                  Divider(color: Colors.deepOrangeAccent,thickness: 1,),
                  SizedBox(height:45 ,),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Privacy()));

                  } ,
                      child: Text("Privacy Policy",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),
                  Divider(color: Colors.deepOrangeAccent,thickness:1,),
                  SizedBox(height:45 ,),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>Help()));

                  } ,
                      child: Text("Get Help",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),
                  Divider(color: Colors.deepOrangeAccent,thickness:1,),
                  SizedBox(height:45 ,),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>feedback()));

                  } ,
                      child: Text("Give us feedback",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),
                  Divider(color: Colors.deepOrangeAccent,thickness: 1,),
                  SizedBox(height:55 ,),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>LogIn()));
                  } ,
                      child: Text("Log out",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),
                  Divider(color: Colors.white,thickness: 1 ,)
                ],
              )
          ),
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: issearching?buildsearch():buildAppbarTitle(),

        actions:buildabar(),

      ),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black54,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home_filled),
            label: "Home",),

          BottomNavigationBarItem(
              icon:Icon(Icons.monetization_on_outlined),
              label: "Money"),
          BottomNavigationBarItem(
              icon:Icon(Icons.wifi_calling_outlined),
              label: "Conect Us")
        ],
        onTap:  onitemtap,
        currentIndex: selectitem,
      ),
      body:
      buildBlockWidget()

    );
  }
}