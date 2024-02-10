import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';
import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                          
                      Container(
                        height: 60.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                          color:Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:   const Center(
                            child: TextUtils(
                                text: 'Welcome',
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 60.0,
                        width: 230.0,
                        decoration: BoxDecoration(
                          color:Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                                text: 'Sonatshi',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: welcomeScreenColor,
                            ),
                            const SizedBox(width: 5,),
                            const TextUtils(
                                text: 'Shop',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                       const SizedBox(
                         height: 250.0,
                       ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: welcomeScreenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 12.0,
                          ),
                          
                        ),
                          onPressed: (){
                          Get.offNamed(Routes.loginScreen);
                          },
                          child: const TextUtils(
                              text: 'Get Start',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                          ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUtils(
                              text: 'Don\'t have an account ?',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                          ),
                          TextButton(
                              onPressed: (){
                                Get.offNamed(Routes.signupScreen);
                              }, child: const TextUtils(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            text: 'Sign up',
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
