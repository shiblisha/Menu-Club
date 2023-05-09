import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Bloc/login_bloc.dart';
import 'Bottom Navigater/home.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController email =TextEditingController();
TextEditingController password =TextEditingController();
String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";
final form_key = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(pattern);
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginBlocLoading){
      showDialog(
          context: context,
          builder: (BuildContext a) => const Center(child: CircularProgressIndicator()));
    }
    if(state is LoginBlocLoaded){
      String token= BlocProvider.of<LoginBloc>(context).loginModel.payload!.accessToken.toString();
      userInfo(token);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (state is LoginBlocError){Navigator.of(context).pop();
    }
    // TODO: implement listener
  },
  child: SingleChildScrollView(
    child: Form(key: form_key,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight * 0.22,
              ),
              Center(
                  child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/logo_red.png"),
              )),
              SizedBox(
                height: mheight * 0.03,
              ),
              Center(
                  child: Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              )),
              SizedBox(
                height: mheight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.08),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              SizedBox(
                height: mheight * 0.01,
              ),
              Center(
                child: Container(
                  height: mheight * 0.065,
                  width: mwidth * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value)) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                      textInputAction: TextInputAction.next,
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter youre email address",
                        hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.08),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              SizedBox(
                height: mheight * 0.01,
              ),
              Center(
                child: Container(
                  height: mheight * 0.065,
                  width: mwidth * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.02),
                    child: TextFormField(controller: password,  validator: (value) {
                      if (value == null ||
                          value.length < 6 ||
                          value.isEmpty) {
                        return 'Password should be atleast 6 character';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                        hintText: "Enter youre password",
                        hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.04,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async{
                    final isvalid = form_key.currentState?.validate();
    if (isvalid == true) {
    form_key.currentState?.save();
                    BlocProvider.of<LoginBloc>(context).add(FetchLogin(email: email.text, password: password.text));}
                  },
                  child: Container(
                    height: mheight * 0.06,
                    width: mwidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.52),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget youre password?",
                      style: TextStyle(color: Colors.black),
                    )),
              ), Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
    ),
  ),
),
    );
  }
  void userInfo( String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('Token', token);

  }
}