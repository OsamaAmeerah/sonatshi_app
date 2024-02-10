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
import '../../widgets/auth/check_widget.dart';

class SignUPScreen extends StatelessWidget {
   SignUPScreen({super.key});
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
         backgroundColor: Get.isDarkMode ? mainBackDarkColor : Colors.white,
         elevation: 0.0,
       ),
        backgroundColor: Get.isDarkMode ? mainBackDarkColor: Colors.white,
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
                   children: [
                     Row(
                       children: [
                         TextUtils(
                             text: 'SIGN',
                             fontSize: 28.0,
                             fontWeight: FontWeight.bold,
                             color: Get.isDarkMode ?  primaryDarkColor : mainLightColor,
                         ),
                         const SizedBox(
                           width: 3.0,
                         ),
                         const TextUtils(
                             text: 'UP',
                             fontSize: 28.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.grey,
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 50.0,),
                     AuthTextFormField(
                       labelStyle: const TextStyle(
                         color: Colors.blueGrey,
                       ),
                       controller: nameController,
                       isPassword: false,
                       label: 'User Name',
                       validate: (String? value){
                            if(value!.toString().length <= 2 || !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            }
                            return null;
                       },
                       prefix: Get.isDarkMode ? Icon(
                         Icons.person_outline,
                         color: mainLightColor,
                         size: 32,
                       ) : Icon(
                         Icons.person_outline,
                         color: darkBlueCl,
                         size: 32,
                       ),
            
            
            
                     ),
                     const SizedBox(height: 15.0,),
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
                         isPassword: controller.isVisibility ? false : true,
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
                     const SizedBox(height: 50.0,),
                      CheckWidget(),
                     const SizedBox(height: 50.0,),
                   GetBuilder<AuthController>(builder: (_){
                     return   AuthButton(text: 'Sign Up', onPressed: (){
                       if(controller.isCheck == false)
                         {
                           Get.snackbar('Check Box', 'Please accept terms & conditions',
                             snackPosition: SnackPosition.BOTTOM,
                             backgroundColor: Colors.redAccent,
                             colorText: Get.isDarkMode ?  Colors.white: mainBackDarkColor
                           );
                         }
                      if(formKey.currentState!.validate() && controller.isCheck != false)
                        {
                          controller.signUpUsingFirebase(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                          );
                        }
                     },
                     );
                   })
                   ],
                 ),
                  ),
                ),
                  BottomContainer(
                   text: 'Already have an account ?',
                   onPressed: () {
                     Get.offNamed(Routes.loginScreen);
                   },
                    textButton: 'Login',
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
