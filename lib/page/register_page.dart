import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  // RegisterPage({super.key});

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
                        margin: EdgeInsets.only(top: 50),
                        child: Image(
                          image: AssetImage("images/registrasi.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Column(
                          children: <Widget>[
                            Text ("Registrasi",
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
                          controller: _usernameController,
                          decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                          ),
                          validator:(value){
                            if(value!.isEmpty){
                              return "Please enter yout name";
                            }
                            return null;
                          }
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
                              return 'Please enter a valid email';
                            }
                            return null;
                          }
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
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please enter your password";
                              } else if (value.length < 6 ){
                                return "Password must be at least 6 characters long";
                              }
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
                              return LoginPage();
                            }));
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Sign Up",
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
                            Text("Apakah Anda Sudah Memiliki Akun ?")
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
                                MaterialPageRoute(builder: (context){
                              return LoginPage();
                            }));
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color:  Color.fromARGB(255, 255, 136, 0),
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
      // home:Scaffold(
      //   body: ListView(
      //       children: <Widget> [
      //       ListTile(
      //         title: Text(
      //         "Aplikasi ini merupakan aplikasi untuk membantu kalian menemukan rute angkot yang akan mengantarkan kalian ketempat tujuan kalian."),
      //       ),
      //       ListTile(
      //         title: Text("Registrasi"),
      //       ),
      //       ListTile(
      //         title: Text("Username"),
      //         subtitle: Text("Username"),
      //       ),
      //       ListTile(
      //         title: Text("Password"),
      //         subtitle: Text("Password"),
      //       ),
      //     ]
      //   ),
      // ),
      //TODO : Buat tampilan register
    );
  }
}
