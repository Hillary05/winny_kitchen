import 'package:cloud_firestore/cloud_firestore.dart';

class ModelRecipe {
  final String title;
  final String ingredients;
  final String recipe;
  final String type;
  final String id;


  ModelRecipe({
    required this.title,
    required this.ingredients,
    required this.recipe,
    required this.type,
    required this.id,
  });

  factory ModelRecipe.fromQueryDocumentSnapshot(QueryDocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return ModelRecipe(
      title: map['title'],
      ingredients: map['ingredients'],
      recipe: map['recipe'],
      type: map['type'],
      id: doc.id,
    );
  }
}
