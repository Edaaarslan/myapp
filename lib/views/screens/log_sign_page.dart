import 'package:flutter/material.dart';

class LogSignPage extends StatefulWidget {
  const LogSignPage({Key? key}) : super(key: key);

  @override
  State<LogSignPage> createState() => _LogSignPageState();
}

class _LogSignPageState extends State<LogSignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                // Kitap resmini kaldırmak için aşağıdaki satırı silebilir veya yorum satırına alabilirsiniz.
                // child: Image.asset('assets/images/logo/logo.png', scale: 2),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'T-RADELİNKER',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(),
                      const Text(
                        'Tedarik zincirini tek bir dokunuşla yönet!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'logInScreen');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey.shade900,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(2, 3),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'GİRİŞ YAP',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'signInScreen');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade50,
                                        Colors.white,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(2, 3),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'KAYDOL',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
