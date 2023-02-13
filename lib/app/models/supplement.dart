class SupplemnetFood {
  const SupplemnetFood({
    required this.name,
    required this.price,
  });

  final String name;
  final String price;

  static List<SupplemnetFood> getSupplmentfoods() {
    return const [
      SupplemnetFood(
          name: 'Murugan Idli Shop',
          price: '2000',
      ),
      SupplemnetFood(
          name: 'Thalappakati Biryani Hotel',
          price: '2500',
      ),
      SupplemnetFood(
          name: 'Sangeetha',
          price: '3000',
      ),
      SupplemnetFood(
          name: 'Hotel Chennai',
          price: '4000',
      ),
      SupplemnetFood(
          name: 'Shri Balaajee',
          price: '2200',
      ),
      SupplemnetFood(
          name: 'Namma Veedu Vasantha',
          price: '1300',
      ),
      SupplemnetFood(
          name: 'SK Parota Stall',
          price: '3000',
      ),
      SupplemnetFood(
          name: 'Aasife Biryani',
          price: '500',
      ),
      SupplemnetFood(
          name: 'Jesus Fast Food',
          price: '3500',
      ),
      SupplemnetFood(
          name: 'Ananda Bhavan',
          price: '2400',
      ),
    ];
  }
}
