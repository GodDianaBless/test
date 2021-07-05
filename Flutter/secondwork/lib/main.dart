import 'package:flutter/material.dart';

void main() {
  runApp(ScaffoldRoute());
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  List _pageList = [_HomeContent(), HomeContent(), SecondPage()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, //标题居中
          backgroundColor: Colors.pink,
          title: Text("App Name"),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
        ),
        drawer: MyDrawer(), //抽屉
        bottomNavigationBar:
            // BottomAppBar(
            //   color: Colors.white,
            //   shape: CircularNotchedRectangle(),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         onPressed: (){},
            //         icon: Icon(Icons.home, color: Colors.pink),
            //       ),
            //       SizedBox(),
            //       IconButton(
            //         onPressed: () {},
            //         icon: Icon(Icons.school, color: Colors.pink),
            //       )
            //     ],
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   ),
            // ),
            BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.pink),
                activeIcon: Icon(Icons.home, color: Colors.blue),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature, color: Colors.pink),
                activeIcon: Icon(Icons.nature_rounded, color: Colors.blue),
                title: Text('Nature')),
            BottomNavigationBarItem(
                icon: Icon(Icons.school, color: Colors.pink),
                activeIcon: Icon(Icons.school, color: Colors.blue),
                title: Text('School')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
              //悬浮按钮
              backgroundColor: Colors.pink,
              child: Icon(Icons.add),
              onPressed: () {
                // Navigator.pushNamed(context, '/addpage');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddPage()));
              });
        }),
        // FloatingActionButton(
        //     //悬浮按钮
        //     backgroundColor: Colors.pink,
        //     child: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => SecondPage()));
        //     }),
        body: this._pageList[this._selectedIndex],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: UserAccountsDrawerHeader(
                  accountName: Text('AXZ'),
                  accountEmail: Text('2667814243@qq.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://img.crcz.com/allimg/202003/05/1583399964119262.jpg'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.itying.com/images/flutter/2.png'),
                        fit: BoxFit.cover),
                  ),
                )
                // Row(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //       child: ClipOval(
                //         child: Image.network(
                //           'http://img.crcz.com/allimg/202003/05/1583399964119262.jpg',
                //           width: 80,
                //         ),
                //       ),
                //     ),
                //     Text(
                //       "AXZ",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text('Change skin'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Change language'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('My photos'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.folder),
                    title: Text('My document'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: Text('Write off'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      'http://www.devio.org/img/avatar.png',
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Opacity(
                      opacity: 0.6,
                      child: Image.network(
                        'http://www.devio.org/img/avatar.png',
                        width: 60,
                        height: 60,
                      )),
                ),
              )
            ],
          ),
          Image.network(
            'http://www.devio.org/img/avatar.png',
            width: 60,
            height: 60,
          ),
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: 'Please Input',
                hintStyle: TextStyle(fontSize: 15)),
          ),
          Container(
              height: 100,
              margin: EdgeInsets.all(10),
              child: PhysicalModel(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias,
                child: PageView(
                  children: <Widget>[
                    _item('Page1', Colors.deepPurple),
                    _item('Page2', Colors.green),
                    _item('Page3', Colors.red),
                  ],
                ),
              )),
          Column(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text('FULL'),
                ),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Image.network(
                'http://www.devio.org/img/avatar.png',
                width: 30,
                height: 30,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.network(
                  'http://www.devio.org/img/avatar.png',
                  width: 10,
                  height: 10,
                ),
              )
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: <Widget>[
              _chip('Flutter'),
              _chip('Hello'),
              _chip('World'),
              _chip('Happy'),
              _chip('Sad'),
            ],
          )
        ]));
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
            backgroundColor: Colors.yellow.shade900,
            child: Text(
              label.substring(0, 1),
              style: TextStyle(fontSize: 10),
            )));
  }
}

class HomeContent extends StatefulWidget {
  @override
  HomeContentState createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        // 标签数量
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
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
                    labelColor: Colors.orange,
                    // 未选中标签的颜色
                    unselectedLabelColor: Colors.black,
                    // 指示器的大小
                    indicatorSize: TabBarIndicatorSize.label,
                    // 指示器的权重，即线条高度
                    indicatorWeight: 4.0,

                    tabs: <Widget>[
                      Tab(text: "新闻"),
                      Tab(text: "历史"),
                      Tab(text: "图片"),
                    ],
                  ))
                ],
              )),
          // 标签页所对应的页面
          body: TabBarView(children: <Widget>[
            // AddPage(),
            ListView(padding: EdgeInsets.all(10), children: <Widget>[
              ListTile(
                leading: Image.network(
                    "https://n.sinaimg.cn/spider202172/401/w600h601/20210702/8513-krwipas3872761.png"),
                title: Text('风云四号B星成功获取首批高精度图像和数据'),
                subtitle: Text("风云四号B星是我国新一代静止轨道气象卫星的首发业务星，自6月3日发射后开启在轨测试。"),
              ),
              ListTile(
                leading: Image.network(
                    "https://s.img.mix.sina.com.cn/auto/crop?img=http%3A%2F%2Fn.sinaimg.cn%2Fnews%2Ftransform%2F200%2Fw600h400%2F20200714%2Ff6d0-iwhseiu1981594.jpg&size=328_218"),
                title: Text('外交部：世行报告再次体现国际社会对中国经济发展的信心'),
                subtitle: Text(
                    "据报道，世界银行驻华代表处近日发布报告指出，中国消费者和企业信心增强，劳动力市场向好，预期今年中国经济增长将达8.5%。"),
              )
            ]),
            ListView(children: <Widget>[
              Image.network(
                  "https://i0.hdslb.com/bfs/feed-admin/7189e1e9f2815d78f03639e2eb0bba2b5ce2cab6.png@880w_388h_1c_95q"),
              ListTile(
                title: Text("中国共产党一百年大事记（1921年7月－2021年6月）"),
                subtitle: Text(
                    "1840年以后，由于西方列强的入侵，由于封建统治的腐败，中国逐渐成为半殖民地半封建社会。实现中华民族伟大复兴成为全民族最伟大的梦想；争取民族独立、人民解放和实现国家富强、人民幸福，成为中国人民的历史任务。许多献身于民族进步事业的爱国先驱，前赴后继、不懈探索。太平天国运动、洋务运动、戊戌维新运动、义和团运动，一次又一次地失败了。"),
              )
            ]),
            ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Image.network("https://www.itying.com/images/flutter/1.png"),
                Image.network("https://www.itying.com/images/flutter/2.png"),
                Image.network("https://www.itying.com/images/flutter/3.png"),
                Image.network("https://www.itying.com/images/flutter/4.png"),
                Image.network("https://www.itying.com/images/flutter/5.png"),
                Image.network("https://www.itying.com/images/flutter/6.png"),
                Image.network("https://www.itying.com/images/flutter/7.png"),
              ],
            ),
          ]),
        ));
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _top = 10.0; //距顶部的偏移
  double _left = 10.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
                backgroundColor: Colors.greenAccent, child: Text("AXZ")),
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  double _top = 10.0; //距顶部的偏移
  double _left = 10.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('Back'),
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        appBar: AppBar(backgroundColor: Colors.amber, title: Text('Search')),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.greenAccent, child: Text("AXZ")),
                onPanUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
              ),
            )
          ],
        ));
  }
}
