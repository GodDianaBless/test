import 'package:flutter/material.dart';

void main() {
  runApp(ScaffoldRoute());
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // @override
        // Widget build(BuildContext context) {
        // return
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: Image.asset('asset/myIcon1.png'),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }),
              title: Text(
                '请响铃',
                style:
                    TextStyle(fontFamily: 'DINAlternate-Bold', fontSize: 40.0),
              ),
              centerTitle: true,
            ),

            drawer: DrawerHead(),
            body: _selectedIndex == 0
                ? CategoryPage()
                : _selectedIndex == 1
                    ? Hearing()
                    : _selectedIndex == 2
                        ? Ring()
                        : Text('data'), //切换底部导航栏页面
            bottomNavigationBar: BottomNavigationBar(
              // 底部导航
              backgroundColor: Colors.amber[100],
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite, color: Colors.pink[200]),
                    activeIcon: Icon(Icons.favorite, color: Colors.blue[200]),
                    title: Text('Cure')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.hearing, color: Colors.pink[200]),
                    activeIcon: Icon(Icons.hearing, color: Colors.blue[200]),
                    title: Text('Hearing')),
                BottomNavigationBarItem(
                    icon:
                        Icon(Icons.person_pin_circle, color: Colors.pink[200]),
                    activeIcon:
                        Icon(Icons.person_pin_circle, color: Colors.blue[200]),
                    title: Text('Ring')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.toys, color: Colors.pink[200]),
                    activeIcon: Icon(Icons.toys, color: Colors.blue[200]),
                    title: Text('Secret')),
              ],
              currentIndex: _selectedIndex,
              fixedColor: Colors.blue,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ));
  }
}

class DrawerHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // 重要的Drawer组件
      child: ListView(
        // Flutter 可滚动组件
        padding: EdgeInsets.zero, // padding为0
        children: <Widget>[
          UserAccountsDrawerHeader(
            // UserAccountsDrawerHeader 可以设置用户头像、用户名、Email 等信息，显示一个符合纸墨设计规范的 drawer header。
            // 标题
            accountName: Text('Jobsofferings',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // 副标题
            accountEmail: Text(
                'https://user.qzone.qq.com/2399053798?source=namecardhoverqzone'),
            // Emails
            currentAccountPicture: CircleAvatar(
              // 使用网络加载图像
              backgroundImage: NetworkImage(
                  'http://up.keaitupian.com/pic/3c/52/10/3c52100e1ab40940eb301933c9badd3e.jpg'),
            ),
            // 圆角头像
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg'),
                    fit: BoxFit.cover, // 一种图像的布局方式
                    colorFilter: ColorFilter.mode(
                        Colors.grey[400]!.withOpacity(0.6),
                        BlendMode.hardLight))),
            //  BoxDecoration 用于制作背景
          ),
          // ListTile是下方的几个可点按List
          ListTile(
            // List标题
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://up.enterdesk.com/edpic/bb/44/5e/bb445e6679bd5af2c1335f21eafcf0a1.jpg'),
            ),
            title: Text('details', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.favorite, // Icon种类
              color: Colors.black12, // Icon颜色
              size: 22.0, // Icon大小
            ),

            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://up.enterdesk.com/edpic_source/e1/49/b7/e149b72b9bdaf08130feeb52a6c318cf.jpg'),
            ),
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://up.enterdesk.com/edpic/36/6b/ee/366beed5f129d087c962323729d404a2.jpg'),
            ),
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // 标签数量
        length: 7,
        child: Scaffold(
            appBar: AppBar(
                title: Row(
              children: <Widget>[
                // 弹性容器布局
                Expanded(
                    child: TabBar(
                  // 多个标签时滚动加载
                  isScrollable: false,
                  // 标签指示器的颜色
                  indicatorColor: Colors.red,
                  // 标签的颜色
                  labelColor: Colors.black,
                  // 未选中标签的颜色
                  unselectedLabelColor: Colors.white,
                  // 指示器的大小
                  indicatorSize: TabBarIndicatorSize.label,
                  // 指示器的权重，即线条高度
                  indicatorWeight: 4.0,

                  tabs: <Widget>[
                    Tab(text: "周围"),
                    Tab(text: "查找"),
                    Tab(text: "社区"),
                    Tab(text: "帮助"),
                    Tab(text: "隐蔽"),
                    Tab(text: "发现"),
                    Tab(text: "安静"),
                  ],
                ))
              ],
            )),
            // 标签页所对应的页面
            body: TabBarView(
              children: <Widget>[
                ListView(children: <Widget>[
                  ListTile(title: Text("地图周围")),
                  Image(
                      image: NetworkImage(
                          'https://pic4.zhimg.com/v2-0cf88e1105a59d73bdc9b0208848abf2_r.jpg?source=1940ef5c')),
                  Image(
                      image: NetworkImage(
                          'https://www.keaidian.com/uploads/allimg/190605/05230637_17.jpg')),
                  Image(
                      image: NetworkImage(
                          'https://i.keaitupian.net/up/35/6e/4d/363a5e81e66df5fb8299e74ca74d6e35.jpg'))
                ]),
                // ListView(children: <Widget>[
                //   ListTile(title: Text("查找内容")),
                //   Hearing()
                // ]),
                GridViewPage(),
                ListView(children: <Widget>[ListTile(title: Text("社区论坛"))]),
                ListView(children: <Widget>[ListTile(title: Text("帮助咨询"))]),
                ListView(children: <Widget>[ListTile(title: Text("信号隐蔽"))]),
                ListView(children: <Widget>[ListTile(title: Text("发现内容"))]),
                ListView(children: <Widget>[ListTile(title: Text("歌曲"))]),
              ],
            )));
  }
}

class Hearing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Hearingactivity();
}

class Hearingactivity extends State<Hearing>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 80.0, height: 80.0),
                    child: Container(
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.keaitupian.net/up/46/58/71/24954c7e0a4594d6124759e0eb715846.jpg'),
                          child: Text('A')),
                    )),
                onPanDown: (DragDownDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  //打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },
              ))
        ],
      ),
    );
  }
}

class Ring extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Ringactivity();
}

class Ringactivity extends State<Ring> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       icon: Image.asset('asset/myIcon1.png'), onPressed: () {}),
        //   title: Text('请响铃'),
        //   centerTitle: true,
        // ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  'https://uploadfile.bizhizu.cn/up/66/09/1c/66091ca523d1346619e5166f1bf4f1a4.jpg'),
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Ring the bell of the heart",
                style: TextStyle(
                    fontSize: 40.0,
                    height: 1.5,
                    fontFamily: "DINAlternate-Bold",
                    decorationStyle: TextDecorationStyle.dashed),
                textAlign: TextAlign.center,
              ),
              ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                      'https://avatars3.githubusercontent.com/u/19513504?s=460&v=4'),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: Icon(Icons.account_box)),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          labelText: "密码",
                          hintText: "学号后八位",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              FlatButton(
                splashColor: Colors.grey,
                color: Colors.blue[200],
                highlightColor: Colors.pink[200],
                child: Text(
                  '登录',
                  style:
                      TextStyle(fontSize: 14, fontFamily: 'DINAlternate-Bold'),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //click callback
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[50],
        title: Text(
          'Please listen to these Coloful heart',
          style: TextStyle(fontFamily: 'DINAlternate-Bold', fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行2个
            mainAxisSpacing: 10.0, //主轴(竖直)方向间距
            crossAxisSpacing: 10.0, //纵轴(水平)方向间距
            childAspectRatio: 1.0 //纵轴缩放比例
            ),
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://i0.sinaimg.cn/edu/2014/0904/U5926P42DT20140904102108.jpg'))),
              child: Text('心灵信号-怦然心动1'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-怦然心动1'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.dianyingdaquan.com/wp-content/uploads/2019/03/879d41a48aad741e3be356f633023c09.jpg'),
                  )),
              child: Text('心灵信号-怦然心动2'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-怦然心动2'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.51miz.com/preview/element/00/01/11/16/E-1111665-6EC907EF.jpg'),
                  )),
              child: Text('心灵信号-请响铃'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-请响铃'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.zcool.cn/community/01027a595dcd9aa8012193a3530fb4.png@1280w_1l_2o_100sh.png'),
                  )),
              child: Text('心灵信号—给予陪伴'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号—给予陪伴'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pic44.photophoto.cn/20170911/0005018460899848_b.jpg'),
                  )),
              child: Text('心灵信号-抑郁症的心理'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-抑郁症的心理'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://picnew9.photophoto.cn/20150619/keaikatongditu-26996053_1.jpg'),
                  )),
              child: Text('心灵信号-距离'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-距离'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pic36.photophoto.cn/20150715/1190119748481450_b.jpg'),
                  )),
              child: Text('心灵信号-山海皆可平'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-山海皆可平'),
              ));
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.purple[100],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pic36.photophoto.cn/20150715/1190119748481450_b.jpg'),
                  )),
              child: Text('心灵信号-山海皆可平'),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('心灵信号-山海皆可平'),
              ));
            },
          ),
        ],
      ),
    );
  }
}

//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               icon: Image.asset('asset/myIcon1.png'), onPressed: () {}),
//           title: Text('请响铃'),
//           centerTitle: true,
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             image: new DecorationImage(
//               fit: BoxFit.cover,
//               image: new NetworkImage(
//                   'https://uploadfile.bizhizu.cn/up/66/09/1c/66091ca523d1346619e5166f1bf4f1a4.jpg'),
//             ),
//           ),
//           child: Column(
//             children: <Widget>[
//               Text(
//                 "Ring the bell of the heart",
//                 style: TextStyle(
//                     fontSize: 24.0,
//                     height: 1.2,
//                     fontFamily: "Courier",
//                     decorationStyle: TextDecorationStyle.dashed),
//                 textAlign: TextAlign.center,
//               ),
//               ClipOval(
//                 child: SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: Image.network(
//                       'https://avatars3.githubusercontent.com/u/19513504?s=460&v=4'),
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     TextField(
//                       autofocus: true,
//                       decoration: InputDecoration(
//                           labelText: "用户名",
//                           hintText: "用户名或邮箱",
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 4.0),
//                           prefixIcon: Icon(Icons.account_box)),
//                     ),
//                     TextField(
//                       decoration: InputDecoration(
//                           focusColor: Colors.black,
//                           labelText: "密码",
//                           hintText: "学号后八位",
//                           prefixIcon: Icon(Icons.lock)),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//               ),
//               FlatButton(
//                 splashColor: Colors.grey,
//                 color: Colors.blue[200],
//                 highlightColor: Colors.pink[200],
//                 child: Text(
//                   '登录',
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0)),
//                 onPressed: () {
//                   //click callback
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
