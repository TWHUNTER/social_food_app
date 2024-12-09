// abstract: hacemos un contrato para consumir

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:social_food_app/models/explore_data.dart';
import 'package:social_food_app/models/explore_recipe.dart';
import 'package:social_food_app/models/post.dart';
import '../models/simple_recipe.dart';

class ApiService {

  //Cargar una data desde un archivo (json)
  Future<String> _loadAssets(String path) async {
    return rootBundle.loadString(path);
  }

  //Obtener una lista de Sample Recipes para mostrar en la aplicacion
  Future<List<SimpleRecipe>> _getRecipes() async {
    //Simular una consulta a un api
    await Future.delayed(Duration(milliseconds: 1000));
    //Traemos el json desde nuestro archivo
    final data = await _loadAssets('assets/sample_data/sample_recipes.json');
    //Convertimos el json a un objeto tipo Mapa
    final Map<String, dynamic> json = jsonDecode(data);

    //Navegamos en el mapa de recipes y convertimos a objetos de tipo SimpleRecipe
    //Si el json no viene vacio
    if(json["recipes"] != null){
      final recipes = <SimpleRecipe>[];
      json["recipes"].forEach((value){
        recipes.add(SimpleRecipe.fromJson(value));
      });
      return recipes;
    }else {
      return[];
    }
  }

  //Obtener la lista de Post
  Future<List<Post>> _getFriendPosts() async {
      //Simular una consulta a un api
      await Future.delayed(Duration(milliseconds: 1000));
      //Traemos el json desde nuestro archivo
      final data = await _loadAssets('assets/sample_data/sample_friends_feed.json');
      //Convertimos el json a un objeto tipo Mapa
      final Map<String, dynamic> json = jsonDecode(data);

      //Navegamos en el mapa de posts y convertimos a objetos de tipo Post
      //Si el json no viene vacio
      if(json["feed"] != null){
        final posts = <Post>[];
        json["feed"].forEach((value){
          posts.add(Post.fromJson(value));
        });
        return posts;
      }else {
        return[];
      }
    }

    //Obtener las recetas a recomendar en un dia
    Future<List<ExploreRecipe>> _getTodayRecipes() async {
      await Future.delayed(Duration(milliseconds: 1000));
      //Traemos la data del archivo json
      final data = await _loadAssets('assets/sample_data/sample_explore_recipes.json');
      //Convertimos el json a un mapa
      final Map<String, dynamic> json = jsonDecode(data);

      //Navegamos en el mapa de posts y convertimos a objetos de tipo Explore Recipes
      if(json["recipes"] != null){
        final recipes = <ExploreRecipe>[];
        json["recipes"].forEach((value){
          recipes.add(ExploreRecipe.fromJson(value));
        });
        return recipes;//devolvemos la lista de objetos ExploreRecipe
      }else {
        return[]; //retornamos una lista vacia
      }

    }

    //Obtener las listas de Recetas del dia (ExploreRecipe) y de Post
    Future<ExploreData> getExploreData() async {
      final todayRecipes = await _getTodayRecipes();
      final friendPosts = await _getFriendPosts();

      return ExploreData(todayRecipes, friendPosts);
    }

  }