import 'package:flutter/material.dart';

class AutoPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //키설정
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //const AutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center, // 가운데 정렬
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
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
              ),
              Container(
                child: SizedBox(
                  child: Image.asset('assets/images/book.jpg'),
                  height: 200,
                ),
              ),
              Stack(
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
                            key: _formKey,
                            child: Column(
                              //?
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.account_circle,
                                      ),
                                      labelText: "아이디"),
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "아이디를 확인해주세요";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                TextFormField(
                                  controller: _passwordController,

                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.vpn_key,
                                      ),
                                      labelText: "비밀번호"),
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "아이디를 확인해주세요";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 100,
                  //   height: 50,
                  //   color: Colors.black,
                  // )
                  Container(
                    height: size.height * 0.35,
                  ),
                  Positioned(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Elevated button');
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
              ),
              Container(
                height: size.height * 0.05,
              ),
              Text("아직 계정이 없으신가요? 회원가입하기"),
              Container(
                height: size.height * 0.05, //밑에 거리 벌리기
              )
            ],
          ),
        ],
      ),
    );
  }
}
