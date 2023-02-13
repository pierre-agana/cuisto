class RestaurantDetail {
  const RestaurantDetail({
    required this.title,
    required this.price,
    this.image = '',
    this.desc = '',
  });

  final String title;
  final String price;
  final String image;
  final String desc;

  static List<RestaurantDetail> getBreakfast() {
    return const [
      RestaurantDetail(
        title: 'Idly(2Pcs) (Breakfast)',
        price: '48.00000 CFA',
        image: 'assets/image/food1.jpg',
        desc:
            'A healthy breakfast item and an authentic south indian delicacy! Steamed and fluffy rice cake..more',
      ),
      RestaurantDetail(
        title: 'Sambar Idly (2Pcs)',
        image: 'assets/image/food2.jpg',
        price: '70 CFA',
      ),
      RestaurantDetail(
        title: 'Ghee Pongal',
        image: 'assets/image/food3.jpg',
        price: '85 CFA',
        desc:
            'Cute, button idlis with authentic. South Indian sambar and coconut chutney gives the per..more',
      ),
      RestaurantDetail(
        title: 'Boori (1Set)',
        image: 'assets/image/food4.jpg',
        price: '85 CFA',
      ),
      RestaurantDetail(
        title: 'Podi Idly(2Pcs)',
        image: 'assets/image/food5.jpg',
        price: '110 CFA',
      ),
      RestaurantDetail(
        title: 'Mini Idly with Sambar',
        image: 'assets/image/food6.jpg',
        price: '85 CFA',
        desc:
            'Cute, button idlis with authentic. South Indian sambar and coconut chutney gives the per..more',
      ),
    ];
  }

  static List<RestaurantDetail> getAllTimeFavFoods() {
    return const [
      RestaurantDetail(
        title: 'Plain Dosa',
        price: '30 CFA',
        desc:
            'A healthy breakfast item and an authentic south indian delicacy!',
      ),
      RestaurantDetail(
        title: 'Rava Dosa',
        price: '70 CFA',
      ),
      RestaurantDetail(
        title: 'Onion Dosa',
        price: '85 CFA',
        desc:
            'Cute, button dosas with authentic. South Indian sambar and coconut chutney gives the per..more',
      ),
      RestaurantDetail(
        title: 'Onion Uttapam',
        price: '85 CFA',
      ),
      RestaurantDetail(
        title: 'Tomato Uttapam',
        price: 'C10 CFA',
      ),
      RestaurantDetail(
        title: 'Onion Dosa & Sambar Vadai',
        price: '85 CFA',
      ),
    ];
  }

  static List<RestaurantDetail> getOtherDishes() {
    return const [
      RestaurantDetail(
        title: 'Kuzhi Paniyaram Karam (4Pcs)',
        price: '70 CFA',
      ),
      RestaurantDetail(
        title: 'Kuzhi Paniyaram Sweet (4Pcs)',
        price: '70 CFA',
      ),
      RestaurantDetail(
        title: 'Kuzhi Paniyaram Sweet & Karam (4Pcs)',
        price: '110 CFA',
      ),
      RestaurantDetail(
        title: 'Ghee Kuzhi Paniyaram',
        price: '85 CFA',
      ),
    ];
  }
}
