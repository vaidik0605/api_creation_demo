import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insert_page extends StatefulWidget {
  const insert_page({Key? key}) : super(key: key);

  @override
  State<insert_page> createState() => _insert_pageState();
}

class _insert_pageState extends State<insert_page> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcontect = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print(height);
    print(width);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Insert Page"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: tname,
                    decoration: const InputDecoration(
                      label: Text("name"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: tcontect,
                    decoration: const InputDecoration(
                      label: Text("contact"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: temail,
                    decoration: const InputDecoration(
                      label: Text("email"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tpassword,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    //https://vaidikweb.000webhostapp.com/register.php
                    FocusScope.of(context).unfocus();
                    String name = tname.text;
                    String contect = tcontect.text;
                    String email = temail.text;
                    String password = tpassword.text;

                    var url = Uri.parse(
                        'https://vaidikweb.000webhostapp.com/register.php?Name=$name&Email=$email&Contect=$contect&Password=$password');
                    var response = await http.get(url);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  },
                  child: const Text("Register[GET]")),
              ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    //https://vaidikweb.000webhostapp.com/register.php
                    String name = tname.text;
                    String contect = tcontect.text;
                    String email = temail.text;
                    String password = tpassword.text;
                    Map m = {
                      'Name': name,
                      'Email': email,
                      'Contect': contect,
                      'Password': password
                    };

                    var url = Uri.parse(
                        'https://vaidikweb.000webhostapp.com/register.php');
                    var response = await http.post(url, body: m);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  },
                  child: const Text("Register[POST]")),
            ],
          ),
        ),
      ),
    );
  }
}
