import 'package:firday/StateLifecycleTest.dart';
import 'package:flutter/material.dart';

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("子树中获取State对象"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 8,
                  ),
                  color: Colors.indigoAccent,
                  image: const DecorationImage(
                      image: NetworkImage("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg")),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return StateLifecycleTest();
                    }));
                    // // 直接通过of静态方法来获取ScaffoldState
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("我是SnackBar")),
                    // );
                    //
                    // ScaffoldState _state = Scaffold.of(context);
                    // // 打开抽屉菜单
                    // _state.openDrawer();
                  },
                  child: Text('打开抽屉菜单1'),
                ),
              );
            }),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
