import 'package:flutter/material.dart';
import 'package:flutter_guys_spotify/common/helpers/is_dark.mode.dart';
import 'package:flutter_guys_spotify/common/widgets/appbar/app_bar.dart';
import 'package:flutter_guys_spotify/core/assets/app_vectors.dart';
import 'package:flutter_guys_spotify/core/configs/theme/app_colors.dart';
import 'package:flutter_guys_spotify/presentation/home/widgets/news_songs.dart';
import 'package:flutter_guys_spotify/presentation/home/widgets/play_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/assets/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tab(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                const NewsSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            ),
             const PlayList()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(AppImages.homeArtist),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tab() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        tabs: const [
          Text(
            "New",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Videos",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Artists",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Prodcasts",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          )
        ]);
  }
}
