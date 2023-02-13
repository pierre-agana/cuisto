
import 'package:cuistoapp/app/models/spotlight_best_top_food.dart';

import 'indian_food.dart';

class AllRestaurant {
  const AllRestaurant({
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  static List<AllRestaurant> getPopularTypes() {
    return const [
      AllRestaurant(
        image: 'assets/icons/offer.png',
        name: 'Offers\nNear You',
      ),
      AllRestaurant(
        image: 'assets/icons/world-cup.png',
        name: 'Best\nSellers',
      ),
      AllRestaurant(
        image: 'assets/icons/pocket.png',
        name: 'Pocket\nFriendly',
      ),
      AllRestaurant(
        image: 'assets/icons/only-on-swiggy.png',
        name: 'Only on\nSwiggy',
      ),
      AllRestaurant(
        image: 'assets/icons/thunder.png',
        name: 'Express\nDelivery',
      ),
      AllRestaurant(
        image: 'assets/icons/delivery.png',
        name: 'Fast\nDelivery',
      ),
      AllRestaurant(
        image: 'assets/icons/blaze.png',
        name: 'Blaze\nDelivery',
      ),
      AllRestaurant(
        image: 'assets/icons/spark.png',
        name: 'Spark\nDelivery',
      ),
    ];
  }

  static List<SpotlightBestTopFood> getRestaurantListOne() {
    return const [
      SpotlightBestTopFood(
        image: 'assets/image/food2.jpg',
        name: 'Shiva Bhavan',
        desc: 'South Indian',
        rating:'4.1',
        timer:'35 mins',
        price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food4.jpg',
        name: 'Biryani Expresss',
        desc: 'North Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food7.jpg',
        name: 'BBQ King',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food8.jpg',
        name: 'Pizza Corner',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
    ];
  }

  static List<SpotlightBestTopFood> getRestaurantListTwo() {
    return const [
      SpotlightBestTopFood(
        image: 'assets/image/food4.jpg',
        name: 'Biryani Expresss',
        desc: 'North Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food3.jpg',
        name: 'A2B Chennai',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food2.jpg',
        name: 'Murugan Idly',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food7.jpg',
        name: 'BBQ King',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food8.jpg',
        name: 'Pizza Corner',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food6.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
    ];
  }

  static List<SpotlightBestTopFood> getRestaurantListThree() {
    return const [
      SpotlightBestTopFood(
        image: 'assets/image/food4.jpg',
        name: 'Biryani Expresss',
        desc: 'North Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food8.jpg',
        name: 'Pizza Corner',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food2.jpg',
        name: 'Murugan Idly',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food6.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
         rating:'4.1',
          timer:'35 mins',
          price: '150 CFA',
      ),
    ];
  }

  static List<IndianFood> getIndianRestaurants() {
    return const [
      IndianFood(image: 'assets/image/food3.jpg', name: 'South\nIndian'),
      IndianFood(image: 'assets/image/food5.jpg', name: 'Indian\nChai'),
      IndianFood(image: 'assets/image/food1.jpg', name: 'North \nndian'),
      IndianFood(image: 'assets/image/food8.jpg', name: 'Indian\nBiryani'),
      IndianFood(image: 'assets/image/food9.jpg', name: 'Indian\nDosa'),
      IndianFood(image: 'assets/image/food4.jpg', name: 'Indian\nIdly'),
    ];
  }

  static List<IndianFood> getPopularBrands() {
    return const [
      IndianFood(image: 'assets/image/food3.jpg', name: 'Sangeetha'),
      IndianFood(image: 'assets/image/food5.jpg', name: 'Indian\nChai'),
      IndianFood(image: 'assets/image/food1.jpg', name: 'Chai\nKings'),
      IndianFood(image: 'assets/image/food8.jpg', name: 'Dosa\nMan'),
      IndianFood(image: 'assets/image/food9.jpg', name: 'Subway'),
      IndianFood(image: 'assets/image/food4.jpg', name: 'KFC'),
    ];
  }
}

class LargeRestaurantBanner {
  const LargeRestaurantBanner({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  static List<LargeRestaurantBanner> getBestInSafetyRestaurants() {
    return const [
      LargeRestaurantBanner(
        image: 'assets/image/food8.jpg',
        title: 'Namma Veedu Vasanta\n Bhavan',
        subtitle: 'Sud de l\'Inde',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food9.jpg',
        title: 'Chai Kings',
        subtitle: 'Korhogo',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food3.jpg',
        title: 'Faaos',
        subtitle: 'Ghana cape coast',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food4.jpg',
        title: 'Banu\n Bhavan',
        subtitle: 'Afrique du sud',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food8.jpg',
        title: 'BBQ Nation',
        subtitle: 'Togo',
      ),
    ];
  }

  static List<LargeRestaurantBanner> getPepsiSaveOurRestaurants() {
    return const [
      LargeRestaurantBanner(
        image: 'assets/image/food1.jpg',
        title: 'Faasos',
        subtitle: 'Fast Food, North Indian, Biryani, Desserts',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food2.jpg',
        title: 'Hungry Pizza',
        subtitle: 'Pizzas',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food7.jpg',
        title: 'Paradise\n Bhavan',
        subtitle: 'Biryani, Chicken, Mutton',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food10.jpg',
        title: 'BBQ Nation',
        subtitle: 'Chicken, Fried Chickent, Tandoori Chicken',
      ),
      LargeRestaurantBanner(
        image: 'assets/image/food3.jpg',
        title: 'OMB Biryani',
        subtitle: 'Biryani',
      ),
    ];
  }
}
