import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  // const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SafeArea(
        child: Scaffold (
          backgroundColor: Color.fromARGB(255, 255, 241, 119),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Image(
                          image: AssetImage("images/login.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Column(
                          children: <Widget>[
                            Text ("Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 145, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                            ),
                            validator:(value){
                            if (value!.isEmpty){
                              return "Please enter your email";
                            } else if (!value.contains('@')){
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: <Widget>[
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                            ),
                            validator:(value){
                              if (value!.isEmpty){
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            ),
                          ],
                        ),
                      ),
                      Container(
                      margin: EdgeInsets.only(bottom: 20, top: 100),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 255, 136, 0)),
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if(_formKey.currentState!.validate()){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return BMICalculator();
                            }));
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("Apakah Anda Belum Memiliki Akun ?"
                            ),
                          ],
                        ),
                      ),
                      Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                          },
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 136, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        ),
      //TODO : bikin tampilan login
      // body: Center(child: Text("Ini Login Page")),
    );
  }
}
