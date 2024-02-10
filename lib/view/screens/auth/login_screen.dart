import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import 'package:sonatshi/routes/routes.dart';
import 'package:sonatshi/utils/my_string.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/auth/auth_button.dart';
import 'package:sonatshi/view/widgets/auth/auth_text_form_field.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';
import '../../widgets/auth/bottom_container.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Get.isDarkMode ? mainBackDarkColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Get.isDarkMode ? mainBackDarkColor :Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child:  Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 40.0,
                    ),
                    child: Column(
                      
                      children:[ Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Get.isDarkMode ?  primaryDarkColor : mainLightColor,
                            ),
                            const TextUtils(
                              text: 'IN',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 7.0,),
                        const Row(
                          children: [
                            Text('And browse our hot offers',style: TextStyle(
                              color: Colors.grey,
                            ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 45.0,),
                        AuthTextFormField(
                          labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          controller: emailController,
                          isPassword: false,
                          label: 'Email',
                          validate: (String? value){
                            if(!RegExp(validationEmail).hasMatch(value!)) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          prefix:Get.isDarkMode ? Icon(
                            Icons.email_outlined,
                            color: darkBlueCl,
                            size: 32,
                          ) : Icon(
                            Icons.email_outlined,
                            color: mainLightColor,
                            size: 32,
                          ),



                        ),
                        const SizedBox(height: 15.0,),
                        GetBuilder<AuthController>(
                          builder:(_) {
                            return AuthTextFormField(
                                labelStyle: const TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                controller: passwordController,
                                isPassword: controller.isVisibility ? false : true  ,
                                label: 'Password',
                                validate: (String? value){
                                  if(value!.toString().length < 6) {
                                    return 'Password is too short';
                                  }
                                  return null;
                                },
                                suffix: IconButton(
                                  onPressed: (){
                                    controller.visibility();
                                  },
                                  icon: Get.isDarkMode
                                      ? controller.isVisibility
                                      ? Icon(Icons.visibility_outlined ,
                                    color: darkBlueCl,)
                                      : Icon(Icons.visibility_off_outlined ,
                                    color: darkBlueCl,)
                                      :  controller.isVisibility
                                      ? Icon(Icons.visibility_outlined ,
                                    color: mainLightColor,)
                                      : Icon(Icons.visibility_off_outlined ,
                                    color: mainLightColor,
                                  ) ,
                                ),
                                prefix: Get.isDarkMode ? Icon(
                                  Icons.password_outlined,
                                  color: darkBlueCl,
                                  size: 32,
                                ) : Icon(
                                  Icons.password_outlined,
                                  color: mainLightColor,
                                  size: 32,
                                )
                            );
                          },
                        ),
                        const SizedBox(height: 15.0,),
                        Row(
                          children: [
                            TextButton(
                                onPressed: (){
                                  Get.toNamed(Routes.forgotPasswordScreen);
                                },
                                child: const TextUtils(
                                    text: 'Forgot password?',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueGrey,
                                ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50.0,),
                        GetBuilder<AuthController>(
                          builder:(_)=> AuthButton(text: 'Login', onPressed: (){
                           if(formKey.currentState!.validate())
                             {
                               controller.loginUsingFirebase(
                                   email: emailController.text.trim(),
                                   password: passwordController.text.trim());
                             }
                          }),
                        ),
                        const SizedBox(height: 20.0,),
                        const TextUtils(
                            text: 'OR',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,),
                        const SizedBox(height: 30.0,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          
                              GetBuilder<AuthController>(
                                builder:(_)=> InkWell(
                                  onTap: (){
                                    controller.googleSignUp();
                                  },
                                  child: Card(
                                   color: Get.isDarkMode ?  primaryDarkColor: mainLightColor,
                                    child:const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                           Text('Login with',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          ),
                                          SizedBox(width: 6.0,),
                                          Image(image: AssetImage('assets/images/google.png')),
                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                   ]
                    ),
                  ),
                ),
                BottomContainer(
                  text: 'Don\'t have an account ?',
                  onPressed: () {
                    Get.offNamed(Routes.signupScreen);
                  },
                  textButton: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
