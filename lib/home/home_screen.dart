import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/home_drawer/home_drawer.dart';
import 'package:news_app/home/settings/settings.dart';
import 'package:news_app/home/taps/tabs_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  bool searchIconClicked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset('assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title:
            searchIconClicked ? Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (context){},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                  hintStyle: TextStyle(color: AppColors.greyColor ),
                  border: InputBorder.none,
                  hintText: 'Search'
                ),
              ),

            ) :
            Text(
              selectedMenueItem == HomeDrawer.settings ? 'Settings'
                  :
                  selectedCategory == null ?
              'News App' : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(onPressed: (){
                setState(() {
                  searchIconClicked = !searchIconClicked;
                  if(!searchIconClicked){
                    searchController.clear();
                  }
                });
              }, icon: Icon(searchIconClicked ? Icons.close : Icons.search))
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClicked: onSideMenuItemClicked),
          ),
          body:
              selectedMenueItem == HomeDrawer.settings ? SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryItemClick: onCategoryItemClick):
              CategoryDetails(category: selectedCategory!,),
        )

      ],

    );
  }

  Category? selectedCategory ;

  void onCategoryItemClick(Category newCategory){
    //todo: newCategory => newCategory
    selectedCategory = newCategory;
    setState((){

    });
  }

  int selectedMenueItem = HomeDrawer.categories;

  void onSideMenuItemClicked (int newSideMenuItem){
    selectedMenueItem = newSideMenuItem;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}


