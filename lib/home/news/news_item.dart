import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              fit: BoxFit.fill,
              imageUrl: news.urlToImage??'',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10,),
          Text(news.author??'',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.greyColor,
            ) ,),
          SizedBox(height: 10,),
          Text(news.title??'',
            style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          Text(news.publishedAt??'',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(
               color: AppColors.greyColor,),)

          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(25),
          //   ),
          //   child: Image.network(news.urlToImage??'',
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height*0.3,
          //   fit: BoxFit.fill)
          // )
        ],
      ),
    );
  }
}
