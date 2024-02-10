import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';
import '../../utils/theme.dart';

class AuthController extends GetxController{
  bool isVisibility = false;
  bool isCheck = false;
  var displayUserName = '';
  var displayUserImage = '';
  var displayUserEmail = '';
  User? get userProfile => fireAuth.currentUser;


  @override
  void onInit() {
    displayUserName =
    (userProfile != null ? userProfile!.displayName : "")!;
    displayUserImage=
    (userProfile != null ? userProfile!.photoURL : "")!;
    displayUserEmail = (userProfile != null ? userProfile!.email : "")!;

    super.onInit();
  }


  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void visibility()
  {
    isVisibility = !isVisibility;
    update();
  }
  void check()
  {
    isCheck = !isCheck;
    update();
  }

  void signUpUsingFirebase({
    required String email,
    required String name,
    required String password,
}) async {
    try {
     await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
       displayUserName =name;
       fireAuth.currentUser!.updateDisplayName(name);
     });
     isSignedIn = true;
     authBox.write('auth', isSignedIn);
     update();
     Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = 'Error!';
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else{
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ? mainBackDarkColor : Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ? mainBackDarkColor : Colors.white,
      );
      // ignore: avoid_print
      print('Error is : ${error.toString()}');
    }

  }
  void loginUsingFirebase({
    required String email,
    required String password,
}) async {
    try {
      await fireAuth
          .signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
       return displayUserName = fireAuth.currentUser!.displayName!;
      });
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = 'Error!';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ?  Colors.white: mainBackDarkColor,
      );
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ?  Colors.white : mainBackDarkColor,
      );
    }
  }
  void googleSignUp() async {
      try{
        final GoogleSignInAccount? googleUser = await googleSign.signIn();
        displayUserName =googleUser!.displayName!;
        displayUserImage = googleUser.photoUrl!;
        displayUserEmail = googleUser.email;
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
        final AuthCredential credential =  GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await fireAuth.signInWithCredential(credential);



        isSignedIn = true;
        authBox.write('auth', isSignedIn);
        update();
        Get.offNamed(Routes.mainScreen);
      }catch(error){
        // ignore: avoid_print
        print(error.toString());
      }
  }
  void resetPassword({required String email}) async {
    try {
      await fireAuth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = 'Error!';
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ? Colors.white : mainBackDarkColor,
      );
      // ignore: avoid_print
      print(error.toString());
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Get.isDarkMode ? Colors.white : mainBackDarkColor,
      );
      // ignore: avoid_print
      print(error.toString());
    }
  }

  void signOut() async {
   try{
   await fireAuth.signOut();
   await googleSign.signOut();
   displayUserName = '';
   displayUserImage = '';
   isSignedIn = false;
   authBox.remove('auth');
   update();
   Get.offNamed(Routes.welcomeScreen);
   }catch(error){
     Get.snackbar(
       'Error!',
       error.toString(),
       snackPosition: SnackPosition.BOTTOM,
       backgroundColor: Colors.redAccent,
       colorText: Get.isDarkMode ? Colors.white : mainBackDarkColor,
     );
   }
  }

}