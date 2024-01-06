import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/layout/shopLayout.dart';
import 'package:z_shop/modules/registration/cubit/cubit/login_cubit.dart';
import 'package:z_shop/modules/registration/cubit/cubit/login_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z_shop/shared/chach_helper.dart';
import 'package:z_shop/shared/componants/componants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
//var    _tabController = TabController(vsync: , length: myTabs.length);
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.status == true) {
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel?.data?.token);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ShopLayout()));
            } else {
              showToast(state.loginModel?.message, Colors.red);
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Stack(children: [
                Align(
                  alignment: AlignmentDirectional(-2.7, -1.2),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 1.3,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 138, 30, 184),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(20, -1),
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 205, 93),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(2.7, -1.2),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 1.3,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 55, 198, 214),
                        shape: BoxShape.circle),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical:
                                    MediaQuery.of(context).size.height / 6),
                            child: TabBar(
                              controller: tabController,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.yellow,
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.yellow,
                              tabs: [
                                Text('Sign In '),
                                Text('Sign Up '),
                              ],
                            ),
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: tabController,
                            children: [
                              Container(
                                height: 300,
                                width: 100,
                                color: Colors.red.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        color: Colors.white,
                                      ),
                                      onTap: () {},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: SingleChildScrollView(
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              Text('Login Screen'),
                                              myTextFormFiled(
                                                  hint: 'Email',
                                                  controller: emailController),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              myTextFormFiled(
                                                  isVisibile:
                                                      LoginCubit.get(context)
                                                          .isVisibile,
                                                  suffixWidget: IconButton(
                                                      onPressed: () {
                                                        LoginCubit.get(context)
                                                            .changePasswordVidibility();
                                                      },
                                                      icon: Icon(LoginCubit.get(
                                                              context)
                                                          .suffix)),
                                                  hint: 'Password',
                                                  controller:
                                                      passwordController),
                                              state is! LoginLoadingState
                                                  ? MaterialButton(
                                                      onPressed: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          LoginCubit.get(
                                                                  context)
                                                              .userLogin(
                                                                  email:
                                                                      emailController
                                                                          .text,
                                                                  password:
                                                                      passwordController
                                                                          .text);
                                                        }
                                                      },
                                                      color: Colors.green,
                                                      child: Text('Login'),
                                                    )
                                                  : CircularProgressIndicator(),
                                              MaterialButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Don\'t have account ?',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.amber.withOpacity(0.3),
                              ),
                            ],
                          ))
                        ],
                      )),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}

Widget myTextFormFiled(
    {String? hint,
    bool? isVisibile,
    TextEditingController? controller,
    Widget? suffixWidget}) {
  return TextFormField(
    controller: controller,
    obscureText: isVisibile ?? false,
    decoration: InputDecoration(
        suffix: suffixWidget, hintText: hint, border: OutlineInputBorder()),
  );
}
