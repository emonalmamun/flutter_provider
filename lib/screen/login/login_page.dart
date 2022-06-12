
import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:flutter_provider/screen/my_widget/stack_container.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 120,
          right: 16,
          left: 16,
        ),
        behavior: SnackBarBehavior.floating,
        content: Consumer<AuthProvider>(builder: (BuildContext context, value, Widget? child) {
          return Row(children: [
            Icon(
              value.success ? Icons.gpp_good : Icons.error,
              color: value.success ? Colors.greenAccent : Colors.redAccent,
            ),
            const SizedBox(width: 8),
            Text(value.snackBarTxt),
          ]);
        },),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login used Provider"),centerTitle: true,elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StackContainer(myIcon: Icons.gpp_good,myColor: Colors.deepOrange,mySize: 48,),
            SizedBox(height: 30,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              obscureText: authProvider.obscure,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffix: InkWell(
                  onTap: (){
                    authProvider.obscure? authProvider.setObscure(false):authProvider.setObscure(true);
                  },
                    child: authProvider.obscure? Icon(Icons.visibility,color: Colors.deepOrange,) : Icon(Icons.visibility_off,color: Colors.deepOrange,),
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
                authProvider.setLoading(true);
                /*authProvider.setSnackBarTxt("Authenticating...");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Consumer<AuthProvider>(builder: (BuildContext context, value, Widget? child) {
                  return Text(value.snackBarTxt.toString());
                },)));*/
                //authProvider.setSnackBarTxt(true,"Authenticating...");
                showSnackbar();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: authProvider.loading? CircularProgressIndicator(color: Colors.white,):Text("Login",style: TextStyle(color: Colors.white,fontSize: 24),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//api request server is "https://reqres.in/"
//      "email": "eve.holt@reqres.in",
//      "password": "cityslicka"