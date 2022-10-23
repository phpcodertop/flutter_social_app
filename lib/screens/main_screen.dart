import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/user_following.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'SOCIAL',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0
          ),
          indicatorWeight: 3.0,
          unselectedLabelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          tabs: const [
            Tab(text: 'Trending',),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      body: ListView(
        children: [
          UserFollowing(),
        ],
      ),
    );
  }
}
