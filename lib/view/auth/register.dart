import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/business/sing/singup_cubit.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/shared/cachhelper.dart';
import 'package:plane/view/auth/login.dart';
import 'package:plane/view/pages/home_page.dart';
class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var fullnamecontroller =TextEditingController();
  var emailcontroller =TextEditingController();
  var user_namecontroller =TextEditingController();
  var passwordcontroller =TextEditingController();

  var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>SingupCubit(),
      child: BlocConsumer<SingupCubit,SingupState>(
        listener: (context, state) {
          if(state is SingupSuccess) {

            print("Login done");
            print(state.loginModel.data.token);
            cachHelper.Savedataa(
                key: "id", value: state.loginModel.data.user.id);
            cachHelper.Savedataa(
                key: "username", value: state.loginModel.data.user.userName);
            cachHelper.Savedataa(
                key: "email", value: state.loginModel.data.user.email);
            cachHelper.Savedataa(
                key: "name", value: state.loginModel.data.user.name);
            cachHelper.Savedataa(key: "token",
                value: state.loginModel.data.token).then((value){
              token=state.loginModel.data.token;
              name=state.loginModel.data.user.name;
              email=state.loginModel.data.user.email;
              user_name=state.loginModel.data.user.userName;
              userId=state.loginModel.data.user.id;
              Navigator.push
                (context, MaterialPageRoute(
                  builder: (BuildContext context)=>HomePage()));
            }
            );
          }
        },
        builder: (context, state) {
          SingupCubit cubit =SingupCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              //automaticallyImplyLeading: false,
              backgroundColor: Colors.black12,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Hello!          ",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30.0
                            ),
                            ),
                            Text("Singup to    ",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30.0)
                            ),
                            Text("get started",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30.0)
                            )
                          ],
                        ),
                        SizedBox(width: 30.0,),
                        Image.asset("assets/images/alder.png",height: 130,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(height: 15.0,),
                          //name
                          TextFormField(
                            controller: fullnamecontroller,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value!.isEmpty)
                                return "add your name";
                              return null;
                            },
                            decoration:  InputDecoration(
                              // focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: Colors.deepOrangeAccent)
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "Full Name "
                            ),

                          ),
                          SizedBox(height: 10.0,),
                          // TextFormField(
                          //   controller:user_namecontroller ,
                          //   keyboardType: TextInputType.text,
                          //   validator: (value) {
                          //     if(value!.isEmpty)
                          //       return "add your user_name";
                          //     return null;
                          //   },
                          //   decoration:  InputDecoration(
                          //     // focusedBorder: OutlineInputBorder(
                          //     //     borderSide: BorderSide(
                          //     //         color: Colors.deepOrangeAccent)
                          //     // ),
                          //     // enabledBorder: OutlineInputBorder(
                          //     //     borderSide: BorderSide(color: Colors.deepOrangeAccent)
                          //     // ),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(15.0),
                          //       ),
                          //       labelText: "User_name "
                          //   ),
                          //
                          // ),
                          TextFormField(
                            controller:user_namecontroller ,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if(value!.isEmpty)
                                return "add your user_name";
                              return null;
                            },
                            decoration:  InputDecoration(
                              // focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: Colors.deepOrangeAccent)
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "user_name "
                            ),

                          ),
                          SizedBox(height: 10.0,),

                          //email
                          TextFormField(
                            controller:emailcontroller ,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value!.isEmpty)
                                return "add your email";
                              return null;
                            },
                            decoration:  InputDecoration(
                              // focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: Colors.deepOrangeAccent)
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "email "
                            ),

                          ),
                          SizedBox(height: 10.0,),


                          //password
                          TextFormField(
                            controller:passwordcontroller ,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if(value!.isEmpty)
                                return "add your password";
                              return null;
                            },
                            decoration:  InputDecoration(
                              // focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: Colors.deepOrangeAccent)
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "Password "
                            ),

                          ),
                          SizedBox(height: 10.0,),
                          //phone
                          SizedBox(height: 10.0,),


                          ConditionalBuilder(
                            condition: state is!SingupLoading,
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                color: Colors.  deepOrangeAccent,
                                child: MaterialButton(
                                  onPressed: () {
                                    if(formkey.currentState!.validate()){
                                      cubit.userRegister(email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                        name: fullnamecontroller.text,
                                        user_name:user_namecontroller.text,

                                      );

                                    }
                                  },

                                  child: Text(
                                    'Sing up',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                            fallback: (BuildContext context) {
                              return  Center(child:
                              CircularProgressIndicator(color:Colors.amber ,)
                              );
                            },

                          ),



                          Row(
                            children: [
                              Text("Already have an account ?"),
                              TextButton(onPressed: () {

                                Navigator.pushReplacement
                                  (context, MaterialPageRoute
                                  ( builder: (BuildContext context)=>LogIn()));
                              },
                                  child: Text("Sing in",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent
                                    ),))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          );
        },
      ),

    );

  }
}
