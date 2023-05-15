
import 'constant.dart';
import 'navigation_model.dart';
import 'package:flutter/material.dart';
import 'collapsing_list_tile_widget.dart';
import 'package:hub_file_flutter/Screens/Drawer/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 60;
  bool isCollapsed = true;
  AnimationController? _animationController;
  Animation<double>? widthAnimation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController!);
    if(!isLoaded) {
      _animationController!.forward();
      isLoaded = true;
      print("I am in ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation!.value,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CollapsingListTile(title: 'Techie', icon: Icons.person, animationController: _animationController!,),
            Divider(color: Colors.grey, height: 40.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                        });
                        switch(counter){
                          case 0:
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => HomePage()));
                            break;
                            case 1:

                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) {
                              //       return Beneficiaries();
                              //     }
                              // ));
                              break;
                          case 2:
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => BalanceOfDonation()));
                            break;
                          case 3:
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => SendMessage()));
                            break;
                          case 4:
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => SettingsScreen()));
                            break;
                          // default:
                          //   break;
                        }
                      },
                      isSelected: currentSelectedIndex == counter,

                      title: navigationItems[counter].title!,
                      icon: navigationItems[counter].icon!,
                      animationController: _animationController!,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController!.forward()
                      : _animationController!.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController!,
                color: selectedColor,
                size: 40.0,
              ),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
