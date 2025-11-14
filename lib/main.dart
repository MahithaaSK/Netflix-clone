import 'package:flutter/material.dart';
import 'package:sow/GetStarted.dart';

void main() {
  runApp(const Netflix());
}

class Netflix extends StatelessWidget {
  const Netflix({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Image.network(
                "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png",
                height: 40,
              ),
              const Spacer(),
              const Text(
                'PRIVACY',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/9d/c2/a5/9dc2a533-b265-281b-0692-080ed11126ae/73f6e7f2-8a4c-498f-a227-5c0f7a27f516_simulator_screenshot_8BA58040-6EA0-48FD-A4EC-E0938854662A.png/643x0w.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200),
                      const Text(
                        "Unlimited entertainment,",
                        style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "one low price",
                        style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "All of Netflix, starting at just ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 193, 174, 174),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Rs.149/- ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 193, 174, 174),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GetStarted(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 240, 27, 11),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
