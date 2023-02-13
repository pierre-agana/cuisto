class TopPicksFood {
  const TopPicksFood({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.timer,
    required this.desc,


  });

  final String image;
  final String name;
  final String price;
  final String rating;
  final String timer;
  final String desc;

  static List<TopPicksFood> getTopPicksfoods() {
    return const [
      TopPicksFood(
          image: 'assets/image/food5.jpg',
          name: 'Murugan Idli Shop',
          desc: 'Murugan Idli Shop',
          price: '2000',
          rating: '2000',
          timer: '42 mins'),
      TopPicksFood(
          image: 'assets/image/food4.jpg',
          name: 'Thalappakati Biryani Hotel',
          desc: 'Thalappakati Biryani Hotel',
          price: '2500',
          rating: '2500',
          timer: '32 mins'),
      TopPicksFood(
          image: 'assets/image/food1.jpg',
          name: 'Sangeetha',
          desc: 'Sangeetha',
          price: '3000',
          rating: '3000',
          timer: '26 mins'),
      TopPicksFood(
          image: 'assets/image/food2.jpg',
          name: 'Hotel Chennai',
          desc: 'Hotel Chennai',
          price: '4000',
          rating: '4000',
          timer: '38 mins'),
      TopPicksFood(
          image: 'assets/image/food3.jpg',
          name: 'Shri Balaajee',
          desc: 'Shri Balaajee',
          price: '2200',
          rating: '2200',
          timer: '53 mins'),
      TopPicksFood(
          image: 'assets/image/food4.jpg',
          name: 'Namma Veedu Vasantha',
          desc: 'Namma Veedu Vasantha',
          price: '1300',
          rating: '1300',
          timer: '22 mins'),
      TopPicksFood(
          image: 'assets/image/food6.jpg',
          name: 'SK Parota Stall',
          desc: 'SK Parota Stall',
          price: '3000',
          rating: '3000',
          timer: '13 mins'),
      TopPicksFood(
          image: 'assets/image/food7.jpg',
          name: 'Aasife Biryani',
          desc: 'Aasife Biryani',
          price: '500',
          rating: '500',
          timer: '31 mins'),
      TopPicksFood(
          image: 'assets/image/food8.jpg',
          name: 'Jesus Fast Food',
          desc: 'Jesus Fast Food',
          price: '3500',
          rating: '3500',
          timer: '44 mins'),
      TopPicksFood(
          image: 'assets/image/food9.jpg',
          name: 'Ananda Bhavan',
          desc: 'Ananda Bhavan',
          price: '2400',
          rating: '2400',
          timer: '55 mins'),
    ];
  }
}
