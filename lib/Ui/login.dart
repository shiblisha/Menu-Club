import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Bloc/LoginBloc/login_bloc.dart';
import 'botton_navigation.dart';

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
      String shopid=BlocProvider.of<LoginBloc>(context).loginModel.payload!.user!.id.toString();
      String shopname=BlocProvider.of<LoginBloc>(context).loginModel.payload!.user!.storeName.toString();
      String description=BlocProvider.of<LoginBloc>(context).loginModel.payload!.user!.description.toString();
      userInfo(token,shopid,shopname,description);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>const BottomNavigation()));
    }
    if (state is LoginBlocError){Navigator.of(context).pop();
    }
  },
  child: SafeArea(
    child: SingleChildScrollView(
      child: Form(key: form_key,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mheight*0.05,),

                const Center(
                    child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/logo_red.png"),
                )),
                SizedBox(
                  height: mheight * 0.13,
                ),
                 Padding(
                   padding:  EdgeInsets.only(left: mwidth*0.05),
                   child: const Text(
                    "Welcome Back",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,color: Color(0xffFF0000),fontFamily: "title"),
                ),
                 ),
                SizedBox(
                  height: mheight * 0.01,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: const Text("Please sign in to continue",style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,fontFamily: "title" ),),
                ),

                SizedBox(
                  height: mheight * 0.04,
                ),
                Center(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(30)),
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
                          decoration: const InputDecoration(
                            hintText: "Enter you're email address",
                            hintStyle:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Color(0xffA7A7A7),fontFamily: "title"),
                            border: InputBorder.none,
                              suffixIcon: Icon(Icons.mail,color: Color(0xff8A8A8A),)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.024 ,
                ),
                Center(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: SizedBox(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,


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
                          decoration: const InputDecoration(
                            hintText: "Enter you're password",
                            hintStyle:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Color(0xffA7A7A7),fontFamily: "title"),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.lock,color: Color(0xff8A8A8A))
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.6),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Color(0xff8A8A8A),fontFamily: "title",fontWeight: FontWeight.w400,fontSize: 16),
                      )),
                ), Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
                SizedBox(
                  height: mheight * 0.141  ,
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
                      height: mheight * 0.075,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: const Center(
                          child: Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),fontFamily: "title"),
                      )),
                    ),
                  ),
                ),
              ],
            ),
      ),
    ),
  ),
),
    );
  }
  void userInfo( String token,String shopId,String shopname,String description) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('Token', token);
    await preferences.setString('shopId', shopId);
    await preferences.setString('shopname',shopname);
    await preferences.setString('description',description);

  }
}
