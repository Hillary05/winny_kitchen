import 'package:cloud_firestore/cloud_firestore.dart';

class ModelRecipe {
  final String title;
  final String ingredients;
  final String recipe;
  final String type;
  final String id;
  final DocumentReference reference;
  final String imageUrl;

  ModelRecipe({
    required this.title,
    required this.ingredients,
    required this.recipe,
    required this.imageUrl,
    required this.type,
    required this.id,
    required this.reference,
  });

  factory ModelRecipe.fromQueryDocumentSnapshot(dynamic doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return ModelRecipe(
      title: map['title'],
      ingredients: map['ingredients'],
      recipe: map['recipe'],
      imageUrl: map['imageUrl'] ?? 'http://mademoisellebobun.com/wp-content/uploads/2021/07/vietnamese-noodle-salad-with-lemongrass-beef-3030400-hero-01-39d2b00f3e71467ca4615407cd8650dd.png',
      type: map['type'],
      id: doc.id,
      reference: doc.reference,
    );
  }
}
