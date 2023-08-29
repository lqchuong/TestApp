import 'package:acecook/src/pages/slide_bar/bloc/slide_bar_bloc.dart';
import 'package:acecook/src/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acecook/src/config/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:acecook/src/themes/light_color.dart';

class SlideBarMenuView extends StatelessWidget {
  const SlideBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SlideBarBloc(),
      child: SidebarMenu(),
    );
  }
}

class SidebarMenu extends StatefulWidget {
  SidebarMenu({Key? key}) : super(key: key);

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  int? count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext? mainContext;
    return BlocConsumer<SlideBarBloc, SlideBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      listenWhen: ((previous, current) => previous != current),
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200,
                child: UserAccountsDrawerHeader(
                  currentAccountPictureSize: Size(50, 50),
                  accountName: Text(
                    'Cửa hàng',
                    style:
                        TextStyle(color: LightColor.background, fontSize: 12),
                  ),
                  accountEmail: Text(
                    'Phạm Ngọc Thạch, quảng phú, tân thành',
                    maxLines: 2,
                    style: TextStyle(color: LightColor.background),
                  ),
                  currentAccountPicture: UserAvatar(
                    userName: 'Admin',
                  ),
                  decoration: BoxDecoration(
                    gradient: LightColor.gradientColor,
                  ),
                ),
              ),

              // userFunction.menu
              //         .where((element) => element.functionID == 'MN001')
              //         .isNotEmpty
              //     ? SizedBox(
              //         height: 50,
              //         child: ListTile(
              //           // leading: const Icon(Icons.person),
              //           title: Text('Create User'),
              //           onTap: () {
              //             context.push('/user-creation');
              //           },
              //         ),
              //       )
              //     : SizedBox(),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.car_repair),
                  title: Text('Lịch sử mua hàng'),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.checklist),
                  title: Text('Khảo sát'),
                  onTap: () {
                    context.push('/products');
                  },
                ),
              ),

              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.fireplace),
                  title: Text('Ưu đãi'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.abc),
                  title: Text('Trả thưởng'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.key),
                  title: Text('Đổi mật khẩu'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text('Chính sách'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text('Liên hệ sale Nguyễn Thị Vui'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(Icons.headphones),
                  title: Text('Liên hệ tổng đài'),
                  onTap: () {
                    context.push('/change-password');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                    title: Text('Đăng xuất'),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () {
                      // context.go('/');
                      mainContext = context;
                      _showAlertDialog(context, mainContext!);
                    }),
              ),
              // SizedBox(
              //   height: 50,
              //   child: ListTile(
              //     // leading: const Icon(Icons.group),
              //     title: Text('Permission'),
              //     onTap: () {},
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              //   child: ListTile(
              //     // leading: const Icon(Icons.group),
              //     title: Text('Previeleges'),
              //     onTap: () => context.push(rPrevieleges),
              //   ),
              // ),
              // const Divider(
              //   thickness: 0.5,
              // ),
            ],
          ),
        );
      },
    );
  }
}

void _showAlertDialog(BuildContext context, BuildContext mainContext) {
  // show the dialog
  print("a");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                mainContext.go('/');
                Navigator.pop(context);
              });
            },
          ),
        ],
      );
    },
  );
}

// class Avatar extends StatelessWidget {
//   String? imgPath;
//   // final ImageProvider<dynamic> image;
//   final Color borderColor;
//   final Color? backgroundColor;
//   final double radius;
//   final double borderWidth;

//   Avatar(
//       {Key? key,
//       // required this.image,
//       this.imgPath,
//       this.borderColor = LightColor.blueColor,
//       this.backgroundColor,
//       this.radius = 30,
//       this.borderWidth = 5})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('${Network.url}$imgPath');
//     return CircleAvatar(
//       radius: radius + borderWidth,
//       backgroundColor: borderColor,
//       child: RoyalUser.userInfo?.urlImage == null
//           ? CircleAvatar(
//               radius: radius,
//               backgroundColor: Colors.white,
//               child: CircleAvatar(
//                 radius: radius - borderWidth,
//                 child: Text(
//                   RoyalUser.userInfo?.fullName?.substring(0, 1).toUpperCase() ??
//                       '',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                 ),
//               ))
//           : CircleAvatar(
//               radius: radius,
//               backgroundColor: Colors.blue.shade900,
//               child: CachedNetworkImage(
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 imageUrl: ('${Network.url}$imgPath'),
//                 placeholder: (context, url) => CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//             ),
//     );
//   }
// }
