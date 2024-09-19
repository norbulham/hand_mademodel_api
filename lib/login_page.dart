import 'package:flutter/material.dart';
import 'package:hand_mademodel_api/constant.dart';
import 'package:hand_mademodel_api/data/signin_list.dart';
import 'package:hand_mademodel_api/page/wallpaper_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Log In",style: myStyle(30,Colors.white, FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                        if (value != userData[0].email) {
                          return "Email does not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 1,
                      controller: _passwordController,
                      obscureText: _isObs,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObs = !_isObs;
                            });
                          },
                          icon: Icon(
                            _isObs ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value != userData[0].password) {
                          return "Password does not match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Forgot Password?",
              style: myStyle(20, Colors.black, FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minWidth: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                color: Colors.black,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (_phoneEmailController.text == userData[0].email) {
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(
                      //     builder: (context) => PracticeBottomNavBar(),
                      //   ),
                      //       (route) => false,
                      // );
                    }
                  }
                },
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder) => WallpaperPage()));
                    },
                    child: Text("Log In", style: myStyle(19, Colors.white, FontWeight.bold),)
                ),),),],),),);
  }
}