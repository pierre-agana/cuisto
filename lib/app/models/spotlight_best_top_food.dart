class SpotlightBestTopFood {
  const SpotlightBestTopFood({
    required this.image,
    required this.name,
    required this.desc,
    required this.timer,
    required this.rating,
    required this.price,
  });

  final String image;
  final String name;
  final String desc;
  final String rating;
  final String timer;
  final String price;

  static List<List<SpotlightBestTopFood>> getSpotlightRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'assets/image/food1.jpg',
          name: 'Breakfast Expresss',
          desc: 'Continental North Indian, South IndianContinental North Indian, South Indian'
              'Continental North Indian, South IndianContinental North Indian, South Indian'
              'Continental North Indian, South IndianContinental North Indian, South Indian',
          rating :'4.1',
          timer:'45 mins ',
          price: '200',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food2.jpg',
          name: 'Namma Veedu Bhavan',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food3.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          rating:'4.2',
          timer: '32 mins',
          price: '130',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food4.jpg',
          name: 'Dinner Expresss',
          desc: 'North Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food5.jpg',
          name: 'Parota King',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food6.jpg',
          name: 'Mass Hotel',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food7.jpg',
          name: 'Mumbai Mirchi',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food8.jpg',
          name: 'BBQ Nation',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ]
    ];
  }

  static List<List<SpotlightBestTopFood>> getBestRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'assets/image/food6.jpg',
          name: 'Mirchi Hotel',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food1.jpg',
          name: 'BBQ Expresss',
          desc: 'Continental North Indian, South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food4.jpg',
          name: 'Lunch Expresss',
          desc: 'North Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food3.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food6.jpg',
          name: 'Mirchi Hotel',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food5.jpg',
          name: 'Parota World',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food7.jpg',
          name: 'Chennai Mirchi',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food8.jpg',
          name: 'BBQ Nation',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ]
    ];
  }

  static List<List<SpotlightBestTopFood>> getTopRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'assets/image/food3.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food4.jpg',
          name: 'Biryani Expresss',
          desc: 'North Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food1.jpg',
          name: 'Chai Truck',
          desc: 'Continental North Indian, South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food2.jpg',
          name: 'Shiva Bhavan',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food7.jpg',
          name: 'BBQ King',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food8.jpg',
          name: 'Pizza Corner',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'assets/image/food5.jpg',
          name: 'Veg King',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
        SpotlightBestTopFood(
          image: 'assets/image/food6.jpg',
          name: 'Adyar Hotel',
          desc: 'South Indian',
          rating:'4.1',
          timer:'35 mins',
          price: '150 ',
        ),
      ],
    ];
  }

  static List<SpotlightBestTopFood> getPopularAllRestaurants() {
    return const [
      SpotlightBestTopFood(
        image: 'assets/image/food5.jpg',
        name: 'Veg King',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food6.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food7.jpg',
        name: 'Chennai Mirchi',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food8.jpg',
        name: 'BBQ Nation',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food3.jpg',
        name: 'A2B Chennai',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food4.jpg',
        name: 'Dinner Expresss',
        desc: 'North Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
    ];
  }

  static List<SpotlightBestTopFood> getTopGroceryRestaurants() {
    return const [
      SpotlightBestTopFood(
        image: 'assets/image/food3.jpg',
        name: 'A2B Chennai',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food4.jpg',
        name: 'Biryani Expresss',
        desc: 'North Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food1.jpg',
        name: 'Chai Truck',
        desc: 'Continental North Indian, South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food2.jpg',
        name: 'Shiva Bhavan',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
       ),
      SpotlightBestTopFood(
        image: 'assets/image/food7.jpg',
        name: 'BBQ King',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food8.jpg',
        name: 'Pizza Corner',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food5.jpg',
        name: 'Veg King',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
      SpotlightBestTopFood(
        image: 'assets/image/food6.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
        rating:'4.1',
          timer:'35 mins',
          price: '150 ',
      ),
    ];
  }
}
