import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      labelText: 'Kullanıcı Adı',
                      labelStyle: TextStyle(color: Colors.purple),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kullanıcı Adınızı Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    username = value;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      labelText: 'Şifre',
                      labelStyle: TextStyle(color: Colors.purple),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Şifrenizi Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        child: const Text("Üye Ol"), onPressed: () {}),
                    MaterialButton(
                        child: const Text("Şifremi Unuttum"), onPressed: () {})
                  ],
                ),
                loginButton()
              ],
            ),
          )),
    );
  }

  Widget loginButton() => ElevatedButton(
        onPressed: () {
          if ((formKey.currentState!.validate())) {
            formKey.currentState!.save();
            if (username == 'a' && password == "a") {
              debugPrint("Giriş Başarılı");
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("HAtta"),
                      content: Text("Giriş Bilgilerniz Hatalı"),
                    );
                  });
            }
          }
        },
        child: const Text("Giriş Yap"),
      );
}
