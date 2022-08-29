import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/admin/loginadmin.dart';
import 'package:plane/business/log_up/login_cubit.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/shared/cachhelper.dart';
import 'package:plane/view/pages/home_page.dart';

import 'register.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var formkey = GlobalKey<FormState>();

  var user_nameController = TextEditingController();

  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              print("login done");
              print(state.loginModel.data.user.name);

              cachHelper.Savedataa(
                  key: "username", value: state.loginModel.data.user.userName);
              cachHelper.Savedataa(
                  key: "email", value: state.loginModel.data.user.email);
              cachHelper.Savedataa(
                  key: "name", value: state.loginModel.data.user.name);
              cachHelper.Savedataa(
                      key: "token", value: state.loginModel.data.token)
                  .then((value) {
                token = state.loginModel.data.token;
                name = state.loginModel.data.user.userName;
                email=state.loginModel.data.user.email;
                user_name=state.loginModel.data.user.userName;
                userId=state.loginModel.data.user.id;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              });
            }
          },
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "LOGIN",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        "login now to browse our hot offers",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(color: Colors.black54),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                          "assets/images/alder.png")),
                                ],
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
//username
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return "can not be empty";
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                  controller: user_nameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                    ),
                                    label: const Text(
                                      'Username',
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 20.0,
                              ),

                              //password
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'password not can Empty';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                    ),
                                    label: const Text(
                                      'password',
                                    ),
                                  ),
                                  onFieldSubmitted: (value) {
                                    if (formkey.currentState!.validate()) {
                                      cubit.userlogin(
                                          user_name: user_nameController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),

                              const SizedBox(
                                height: 25.0,
                              ),

                              ConditionalBuilder(
                                condition: state is! LoginLoading,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.deepOrangeAccent,
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            cubit.userlogin(
                                                user_name:
                                                    user_nameController.text,
                                                password:
                                                    passwordController.text);

                                            // Navigator.push
                                            //   (context, MaterialPageRoute(
                                            //     builder: (BuildContext context)=>HomePage()));
                                          }
                                        },
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                fallback: (BuildContext context) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.amber,
                                  ));
                                },
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Register()));
                                    },
                                    child: const Text(
                                      'Register Now',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 240, top: 40),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.black12,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LogInAdmin()));
                                  },
                                  child: const Text(
                                    "Login as admin ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ]),
                      )),
                ),
              ),
            );
          },
        ));
  }
}
