import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import 'package:sonatshi/view/widgets/auth/auth_button.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(

            iconTheme: IconThemeData(
              color: Get.isDarkMode ? Colors.grey: mainLightColor
            ),
            backgroundColor: context.theme.colorScheme.background,
            centerTitle: true,
            title:  Text(
              'Forgot password',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.grey: mainBackDarkColor,
              ),
            ),
          ),
          body: Form(
            key: formKey,
            child:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: (){
                            Get.back();
                          },
                          icon: const Icon(Icons.close_rounded,color: Colors.grey,)),
                    ),
                    const SizedBox(height: 20.0,),
                     Text(
                      'If you want to recover your account, then please provide your email below...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.grey: mainBackDarkColor,                     ),
                    ),
                    const SizedBox(height: 40.0,),
                    Image.asset('assets/images/forgetpass copy.png',
                      width: 350.0,

                    ),
                    const SizedBox(height: 30.0,),
                    TextFormField(
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white :mainBackDarkColor,
                      ),
                      validator: (String? value){
                        if(!RegExp(validationEmail).hasMatch(value!)) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      cursorColor: Get.isDarkMode ? Colors.grey: mainBackDarkColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(color:Get.isDarkMode ?  Colors.grey : Colors.black,),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color:Get.isDarkMode ?  Colors.grey : Colors.black,),
                            borderRadius: BorderRadius.circular(10.0)),
                        errorBorder:   OutlineInputBorder(
                            borderSide:  BorderSide(color:Get.isDarkMode ?  Colors.grey : Colors.black,),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color:Get.isDarkMode ?  Colors.grey : Colors.black,),
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: TextStyle(

                          color: Get.isDarkMode ? Colors.grey:mainBackDarkColor,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    GetBuilder<AuthController>(
                        builder:(_)=> AuthButton(
                            text: 'SEND',
                            onPressed: (){
                              if(formKey.currentState!.validate())
                                {
                                 controller.resetPassword(
                                     email:emailController.text.trim(),
                                 );
                                }

                            },
                        ),
                      ),

                  ],
                ),
              ),
            ),
          ),

        ));
  }
}
