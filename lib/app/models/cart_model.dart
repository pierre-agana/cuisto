

class Cart_model{
  const Cart_model({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.sub_price,
  });

  final String image;
  final String name;
  final int price;
  final int quantity;
  final int sub_price;

  static List<Cart_model> getCart() {
    return const [
      Cart_model(
          image: 'assets/image/food5.jpg',
          name: 'Murugan Idli Shop',
          price: 2000,
          quantity: 0,
          sub_price: 0,
          ),
      Cart_model(
        image: 'assets/image/food1.jpg',
        name: 'Murugan Idli Shop',
        price: 2000,
        quantity: 0,
        sub_price: 0,
      ),
      Cart_model(
        image: 'assets/image/food2.jpg',
        name: 'Murugan Idli Shop',
        price: 2500,
        quantity: 0,
        sub_price: 0,
      ),
      Cart_model(
        image: 'assets/image/food3.jpg',
        name: 'Murugan Idli Shop',
        price: 9000,
        quantity: 0,
        sub_price: 0,
      ),
      Cart_model(
        image: 'assets/image/food4.jpg',
        name: 'Murugan Idli Shop',
        price: 3000,
        quantity: 0,
        sub_price: 0,
      ),
      Cart_model(
        image: 'assets/image/food5.jpg',
        name: 'Murugan Idli Shop',
        price: 4000,
        quantity: 0,
        sub_price: 0,
      ),
      Cart_model(
        image: 'assets/image/food6.jpg',
        name: 'Murugan Idli Shop',
        price: 1000,
        quantity: 0,
        sub_price: 0,
      ),
    ];
  }

}