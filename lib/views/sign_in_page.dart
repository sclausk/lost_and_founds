import 'package:flutter/material.dart';
import 'package:lost_and_founds/services/auth.dart';

class SingInPage extends StatefulWidget {
  static const String routName = '/signin';

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            _showEmailTextField(),
            _showPasswordTextField(),
            _showSignInButton(),
            _showSignUpButton()
          ],
        )),
      ),
    );
  }

  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();

  Widget _showEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email)),
    );
  }

  bool _hiddenPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _hiddenPassword = !_hiddenPassword;
    });
  }

  Widget _showPasswordTextField() {
    return TextField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: _hiddenPassword,
      decoration: InputDecoration(
          hintText: 'Senha',
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            icon: Icon(_hiddenPassword ? Icons.visibility_off : Icons.visibility),
            onPressed: _togglePasswordVisibility,
          )
        ),
    );
  }

  Future _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signIn(email, password).then(_onResultSignIn);
  }
  
  void _onResultSignIn(String userId){
    print('SignIn: $userId');
    //Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  Widget _showSignInButton() {
    return RaisedButton(
      child: Text('Login'),
      onPressed: _signIn,
    );
  }

  void _signUp() {
    //Navigator.of(context).pushReplacementNamed(SignUpPage.routeName);
  }

  Widget _showSignUpButton() {
    return  FlatButton(
      child: Text('Registrar-se'),
      onPressed: _signUp,
    );
  }
}
