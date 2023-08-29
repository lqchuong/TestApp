// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acecook/src/pages/product/list_product.dart';
import 'package:acecook/src/pages/scan/example_camera_overlay.dart';
import 'package:acecook/src/pages/scan/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:acecook/src/pages/home/home_page.dart';
import 'package:acecook/src/pages/main/bloc/bottom_bar_bloc.dart';
import 'package:acecook/src/pages/slide_bar/sidebar_menu.dart';
import 'package:acecook/src/themes/light_color.dart';

class TabsScreenView extends StatelessWidget {
  int index;
  TabsScreenView({
    super.key,
    this.index = 0,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomBarBloc(),
      child: TabsScreen(
        index: index,
      ),
    );
  }
}

class TabsScreen extends StatefulWidget {
  int? index;
  String? itemNo;
  TabsScreen({Key? key, this.index, this.itemNo}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    context.read<BottomBarBloc>().add(BottomBarInitialEvent(widget.index!));
    super.initState();
  }

  var selectPageIndex = 0;
  List<Map<String, dynamic>> pageDetail = [];
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<BottomBarBloc, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BottomBarInitialSuccessful) {
          pageDetail = [
            {'pageName': MyHomePage(), 'title': ''},
            {'pageName': ListProduct(), 'title': ''},
            {'pageName': null, 'title': ''},
            {'pageName': MyHomePage(), 'title': ''},
            {'pageName': MyHomePage(), 'title': ''},
          ];
          return MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: Scaffold(
              key: scaffoldKey,
              floatingActionButton: Container(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                  backgroundColor: LightColor.mainAppColor,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ExampleCameraOverlay();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 30,
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: pageDetail[state.selectIndex]['pageName'],
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: LightColor.primaryLine,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: BottomAppBar(
                  color: LightColor.mainAppColor,
                  padding: EdgeInsets.only(bottom: 10),
                  height: 75,
                  shape: CircularNotchedRectangle(),
                  clipBehavior: Clip.antiAlias,
                  notchMargin: 8,
                  child: BottomNavigationBar(
                      backgroundColor: LightColor.mainAppColor,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: LightColor.background,
                      unselectedItemColor: LightColor.disableColor,
                      selectedLabelStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                      selectedIconTheme: const IconThemeData(size: 28),
                      unselectedIconTheme: const IconThemeData(size: 20),
                      currentIndex: state.selectIndex,
                      onTap: (index) {
                        if (index == 5) {
                          if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                          } else {
                            scaffoldKey.currentState!.openDrawer();
                            //open drawer, if drawer is closed
                          }
                        } else {
                          context
                              .read<BottomBarBloc>()
                              .add(OnItemTappedEvent(index));
                        }
                      },
                      elevation: 0.0,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.dashboard), label: 'Dashboard'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.menu), label: 'Setting'),
                      ]),
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
