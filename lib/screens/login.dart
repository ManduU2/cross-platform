import 'dart:js';

import 'package:flutter/material.dart';
import 'package:testdart/todolist.dart';

class AutoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //키설정
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String userName = '';
  String userPassword = '';

  //const AutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void _tryValidation() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    } // 로그인 유요성 검사

    return Scaffold(
      body: SingleChildScrollView(
        //bottom overflowed 방지
        child: Stack(
          alignment: Alignment.center, // 가운데 정렬
          children: <Widget>[
            backgroundWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                titleWidget(),
                imageWidget(),
                stackWidget(size),
                paddingContainer(size),
                Text("아직 계정이 없으신가요? 회원가입하기"),
                paddingContainer(size),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ToDoList())); // 다음페이지 테스트하기 위해 잠시 넣어둔 기능버튼
                  },
                  child: const Text('disabled'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget paddingContainer(size) {
    size = size;
    return Container(
      height: size.height * 0.05, //밑에 거리 벌리기
    );
  }

  Widget imageWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            child: Image.asset('assets/images/book.jpg'),
            height: 200,
          ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'To-Do List',
          labelStyle: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget backgroundWidget() {
    return Container(
      color: Colors.white,
    );
  }

  Widget stackWidget(size) {
    size = size;

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)), //원
            elevation: 6, // 그림자
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12, bottom: 12),
              child: Form(
                  key: _formKey, //키설정
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                            ),
                            labelText: "아이디"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please input correct ID";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          userName = value!;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                            ),
                            labelText: "비밀번호"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input correct password.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          userPassword = value!;
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Container(
          height: size.height * 0.35,
        ),
        Positioned(
          key: _formKey,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: 0,
          child: ElevatedButton(
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // ScaffoldMessenger.of(context).showSnackBar(
              //   //     SnackBar(content: Text(userName + '/' + userPassword))),);
              // }
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => ToDoList()));
            },
            child: Text('로그인'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, // 텍스트 버튼과 다르게 배경색 변경
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0),
          ),
        ),
      ],
    );
  }
}
