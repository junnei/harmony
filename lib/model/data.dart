import 'package:cloud_firestore/cloud_firestore.dart';

import './filter.dart';
import './restaurant.dart';
import './review.dart';


Future<void> addRestaurant(Restaurant restaurant) {
  final restaurants = Firestore.instance.collection('restaurants');
  return restaurants.add({
    'avgRating': restaurant.avgRating,
    'category': restaurant.category,
    'city': restaurant.city,
    'name': restaurant.name,
    'numRatings': restaurant.numRatings,
    'photo': restaurant.photo,
    'price': restaurant.price,
  });
}

Stream<QuerySnapshot> loadAllRestaurants() {
  return Firestore.instance
      .collection('restaurants')
      .orderBy('avgRating', descending: true)
      .limit(50)
      .snapshots();
}

List<Restaurant> getRestaurantsFromQuery(QuerySnapshot snapshot) {
  return snapshot.documents.map((DocumentSnapshot doc) {
    return Restaurant.fromSnapshot(doc);
  }).toList();
}

Future<Restaurant> getRestaurant(String restaurantId) {
  return Firestore.instance
      .collection('restaurants')
      .document(restaurantId)
      .get()
      .then((DocumentSnapshot doc) => Restaurant.fromSnapshot(doc));
}

Future<void> addReview({String restaurantId, Review review}) {
  final restaurant =
  Firestore.instance.collection('restaurants').document(restaurantId);
  final newReview = restaurant.collection('ratings').document();

  return Firestore.instance.runTransaction((Transaction transaction) {
    return transaction
        .get(restaurant)
        .then((DocumentSnapshot doc) => Restaurant.fromSnapshot(doc))
        .then((Restaurant fresh) {
      final newRatings = fresh.numRatings + 1;
      final newAverage =
          ((fresh.numRatings * fresh.avgRating) + review.rating) / newRatings;

      transaction.update(restaurant, {
        'numRatings': newRatings,
        'avgRating': newAverage,
      });

      return transaction.set(newReview, {
        'rating': review.rating,
        'text': review.text,
        'userName': review.userName,
        'timestamp': review.timestamp ?? FieldValue.serverTimestamp(),
        'userId': review.userId,
      });
    });
  });
}

Stream<QuerySnapshot> loadFilteredRestaurants(Filter filter) {
  Query collection = Firestore.instance.collection('restaurants');
  if (filter.category != null) {
    collection = collection.where('category', isEqualTo: filter.category);
  }
  if (filter.city != null) {
    collection = collection.where('city', isEqualTo: filter.city);
  }
  if (filter.price != null) {
    collection = collection.where('price', isEqualTo: filter.price);
  }
  return collection
      .orderBy(filter.sort ?? 'avgRating', descending: true)
      .limit(50)
      .snapshots();
}

void addRestaurantsBatch(List<Restaurant> restaurants) {
  restaurants.forEach((Restaurant restaurant) {
    addRestaurant(restaurant);
  });
}