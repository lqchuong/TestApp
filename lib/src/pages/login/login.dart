import 'package:acecook/src/widgets/form_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:acecook/src/pages/login/cubit/login_cubit.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:go_router/go_router.dart';
import 'package:acecook/src/widgets/button.dart';
import 'package:acecook/src/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit()..initLogin(),
      child: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController deivceController = TextEditingController();

  String? errorUsername;
  String? errorPassword;
  String? deviceid = '';

  bool isVisiableIcon = true;
  bool isSaveInfoLogin = false;

  bool _validateLogin() {
    bool isPass = true;
    if (userNameController.text == "") {
      errorUsername = 'Vui lòng nhập số điện thoại của bạn';
      isPass = false;
    }
    if (passwordController.text == "") {
      errorPassword = 'Vui lòng nhập mật khẩu của bạn';
      isPass = false;
    }
    return isPass;
  }

  @override
  Widget build(BuildContext context) {
    userNameController.text = '0901665895';
    passwordController.text = '369528';
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Fluttertoast.showToast(
                    msg: "Login successful",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: LightColor.successColor,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );

                  context.go('/home');
                });
              }
              if (state is LoginFailed) {
                print('LoginFailed');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Fluttertoast.showToast(
                    msg: (state).error ??
                        "Error information, please input again!",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: LightColor.errorColor,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                });
                context.read<LoginCubit>().initLogin();
              }
            },
            builder: (context, state) {
              if (state is LoginInitialSucess) {}

              if (state is TapObscureSuccess) {
                isVisiableIcon = state.isTapObscure;
                print(isVisiableIcon);
                context.read<LoginCubit>().initLogin();
              }

              return ListView(
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  Header(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: AppTextField(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: LightColor.mainAppColor,
                      ),
                      controller: userNameController,
                      errorText: errorUsername,
                      // placeHolder: 'Vui lòng nhập số điện thoại...',
                      placeHolder: 'Nhập số điện thoại của bạn',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: AppTextField(
                        prefixIcon: const Icon(
                          Icons.key,
                          color: LightColor.mainAppColor,
                        ),
                        controller: passwordController,
                        placeHolder: 'Nhập mật khẩu của bạn',
                        errorText: errorPassword,
                        isPassword: true,
                        obscureText: isVisiableIcon,
                        onTapObscureIcon: () {
                          context
                              .read<LoginCubit>()
                              .tapObscure(!isVisiableIcon);
                        }),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: AppButton(
                      backgroundColor: LightColor.mainAppColor,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      title: 'Đăng nhập',
                      onPress: () {
                        // if (_validateLogin()) {
                        //   errorUsername = null;
                        //   errorPassword = null;
                        //   // LoginRequest loginRequest = LoginRequest(
                        //   //     userNameController.text,
                        //   //     passwordController.text,
                        //   // deivceController.text);

                        context.read<LoginCubit>().submitEvent(
                            userNameController.text, passwordController.text);
                        // } else {
                        //   setState(() {});
                        // }
                        // context.read<LoginCubit>().submitEvent();
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FormFieldLabel('Anh/chị cần hỗ trợ'),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.headphones,
                            color: LightColor.mainAppColor,
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  LightColor.primaryBackground),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                // side: BorderSide(color: textColor!)
                              ))),
                          onPressed: () {},
                          label: FormFieldLabel(
                              'Liên hệ tổng đài Training System'),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Stack Header() {
    double height = 320.0;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(31, 253, 71, 71),
              Color.fromARGB(31, 253, 71, 71)
            ])),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(68, 253, 112, 112),
              Color.fromARGB(68, 253, 112, 112)
            ])),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              LightColor.mainAppColor,
              LightColor.mainAppColor
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 3 - 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Image.asset(
                      'assets/acecook.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
