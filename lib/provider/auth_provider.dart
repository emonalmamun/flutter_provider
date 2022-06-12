import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val){
    _loading = val;
    notifyListeners();
  }

  bool _obscure = true;
  bool get obscure => _obscure;

  setObscure(bool val){
    _obscure = val;
    notifyListeners();
  }

  bool _success = true;
  get success => _success;

  String _snackBarTxt = "";
  get snackBarTxt => _snackBarTxt;

  setSnackBarTxt(bool success, String txt){
    _success = success;
    _snackBarTxt = txt;
    notifyListeners();
  }

  void login(String email, String password)async{
    setLoading(true);
    try{
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
        body: {
            'email': email,
            'password': password,
          }
      );

      if(response.statusCode==200){
        setLoading(false);
        setSnackBarTxt(true,"Successfull");
        //print('Successfull');
      }else{
        setLoading(false);
        setSnackBarTxt(false,"Fail");
        //print('Fail');
      }

    }catch(e){
      setLoading(false);
      setSnackBarTxt(false,"Fail");
      //print("Error : "+e.toString());
    }
  }
}