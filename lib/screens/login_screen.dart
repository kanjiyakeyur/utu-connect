
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utu_connect/provider/student.dart';

import '../provider/http_exception.dart';
//import '../provider/auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String,String> _authData = {
    'userid' : '',
    'password' : '',
  };

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordFocusNode = FocusNode();
  final _loginFocusNode = FocusNode();
  var _isLoding =  false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _loginFocusNode.dispose();
    super.dispose();
  }

  Future<void> _showErrorDialog(String errorMessage)async{
    await showDialog(
      context: context,
      builder : (ctx)=> AlertDialog(
        title : Text('A error Occoured !!'),
        content: Text(errorMessage),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>Navigator.of(ctx).pop(), 
            child: Text('Ohky'),
          )
        ],
      ) 
    );
  }

  Future<void> _saveForm() async{
    //Focus.of(context).unfocus(_passwordFocusNode);
    setState(() {
      _isLoding = true;
    });
    final isvalid = _formKey.currentState.validate();
    if(!isvalid){
      setState(() {
      _isLoding = false;
      });
      return;
    }
    _formKey.currentState.save();
    //print(_authData['password']);
    try{
      await Provider.of<Students>(context,listen: false).login(_authData['userid'],_authData['password']);
      
    }




    on HttpException catch(error){
      var errormessage = 'Authication failed!';
      if(error.toString().contains('EMAIL_EXISTS')){
        errormessage = 'This email Address allready been in use';
      }
      else if(error.toString().contains('OPERATION_NOT_ALLOWED')){
        errormessage = 'this email is not valid';
      }
      else if(error.toString().contains('WEAK_PASSWORD')){
        errormessage = 'Password not to much strong';
      }
      else if(error.toString().contains('EMAIL_NOT_FOUND')){
        errormessage = 'Email not found';
      }
      else if(error.toString().contains('INVALID_PASSWORD')){
        errormessage = 'Invalid Password';
      }
      else if(error.toString().contains('INVALID_EMAIL')){
        errormessage = 'Invalid Email';
      }
      _showErrorDialog(errormessage);
    }
    catch(error){
      var errormessage = error.toString();
      if(errormessage.contains('SocketException')){
        errormessage = 'No Internet Connection';
      }
      _showErrorDialog(errormessage);
    }
    
    if (this.mounted){
    setState(() {
      _isLoding = false;
    });
    }
    return;
  }

 


  @override
  Widget build(BuildContext context) {
    final dh = MediaQuery.of(context).size.height;
    final dw = MediaQuery.of(context).size.width;
    print('${dh.toString()},${dw.toString()}');
    return Scaffold(
      
      body : Center(
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 215,
                child: Image.asset('assets/images/utulogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: dh*0.05,),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    width: dw*0.72,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email'
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(_passwordFocusNode);
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return 'Please Enter The EnRoll no.';
                            }
                            
                            return null;
                          },
                          onSaved: (value){
                            _authData['userid'] = value;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(_loginFocusNode);
                          },
                          decoration: InputDecoration(
                              labelText: 'Password'
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'Please Enter The EnRoll no.';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _authData['password'] = value;
                          },
                        ),
                        SizedBox(height: 30,),
                        _isLoding ?  Container(
                          //margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(3),
                          height: 35,
                          width: 35,
                          child: CircularProgressIndicator(
                                backgroundColor: Colors.pink.shade300,
                                strokeWidth: 3,
                              ),
                        )
                           : RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          color: Colors.indigo.shade400,
                          elevation: 0,
                          focusNode: _loginFocusNode,
                          child: Text('login',
                            style: TextStyle(
                              color : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 3
                            ),
                          ),
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            _saveForm();
                          }
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}