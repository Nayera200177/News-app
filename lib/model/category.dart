import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class Category{
  String id;
  String title;
  String imagePath;
  Color color;

  Category({required this.id ,
    required this.title,
    required this.imagePath,
    required this.color});

  static List<Category> getCategories(){
    return [
      Category(id: 'sports', title: 'sports',
          imagePath: 'assets/images/sports.png', color: AppColors.redColor),
      Category(id: 'general', title: 'general',
          imagePath: 'assets/images/politics.png', color: AppColors.darkBlueColor),
      Category(id: 'health', title: 'health',
          imagePath: 'assets/images/health.png', color: AppColors.pinkColor),
      Category(id: 'business', title: 'business',
          imagePath: 'assets/images/business.png', color: AppColors.brownColor),
      Category(id: 'entertainment', title: 'entertainment',
          imagePath: 'assets/images/enviroment.png', color: AppColors.blueColor),
      Category(id: 'science', title: 'science',
          imagePath: 'assets/images/science.png', color: AppColors.yellowColor),
      Category(id: 'science', title: 'science',
          imagePath: 'assets/images/science.png', color: AppColors.yellowColor),

    ];
  }
}
//  'business'
//  'entertainment'
//  'general'
//  'health'
//  'science'
//  sports
//  'technology'