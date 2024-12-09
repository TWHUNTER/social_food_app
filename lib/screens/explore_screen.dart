import 'package:flutter/material.dart';
import 'package:social_food_app/api/api_service.dart';
import 'package:social_food_app/component/card1.dart';
import 'package:social_food_app/component/today_recipe_listview.dart';

import '../models/post.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({super.key});


  //para consumir lo que necesitamos, tenemos que instanciar nuestra clase
  // de ApiService

  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
      //SnapShott, Stream, son para valores futuros
    return FutureBuilder(
        future: apiService.getExploreData(),
        builder: (context, snapshot) {
          //si ya acabaste de traer la data, entonces retorna un texto
          if (snapshot.connectionState == ConnectionState.done) {

            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListview(
                    recipes: snapshot.data?.todayRecipes ?? [],
                ),
                FriendPostListView(friendposts: snapshot.data?.friendPosts ?? [])
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({super.key, required this.friendposts});

  final List<Post> friendposts;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Text('Social Chefs 🧑‍🍳', style: Theme.of(context).textTheme.displayLarge,),
       ListView.separated(
         scrollDirection: Axis.vertical,
           shrinkWrap: true,
           primary: false,
           itemBuilder: (context, index) {
            final post = friendposts[index];
            //debemos devolver cada post
             return FriendPost(post: post);
           },
           separatorBuilder: (context, index) {
             return SizedBox(
               height: 16,
             );
           },
           itemCount: friendposts.length)
     ],
    );
  }
}

class FriendPost {

}
