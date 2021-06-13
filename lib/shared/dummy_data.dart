part of 'shared.dart';

class DummyData {
  static final categoryBook = 'Buku';
  static final categoryGadget = 'Elektronik';
  static final categoryKitchen = 'Dapur';
  static final categoryManFashion = 'Fashion Pria';
  static final categoryWomanFashion = 'Fashion Wanita';

  static final loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis dignissim porttitor. Sed sed pellentesque velit. Curabitur tristique ante ac nibh aliquet, a pellentesque enim feugiat. Cras viverra varius egestas. Phasellus feugiat metus felis, ornare tristique enim scelerisque id. Praesent dui ex, mollis quis maximus et, aliquet pulvinar dolor. Maecenas porttitor tristique tellus, et lobortis lacus. Duis suscipit dignissim augue, at efficitur ligula placerat eget. Nullam erat turpis, pharetra quis iaculis nec, laoreet ac tortor. Nunc quis ornare mi. Mauris ultricies libero eget convallis ultricies. Donec eget risus ante. Etiam orci erat, vestibulum eget scelerisque sit amet, malesuada consectetur neque. Donec pretium augue mi, at consequat leo ornare et.';

  static List<Map<String, String>> categoryData = [
    {'cover': Assetvalue.categoryAll, 'title': 'Semua'},
    {'cover': Assetvalue.categoryBook, 'title': categoryBook},
    {'cover': Assetvalue.categoryGadget, 'title': categoryGadget},
    {'cover': Assetvalue.categoryKitchen, 'title': categoryKitchen},
    {'cover': Assetvalue.categoryManFashion, 'title': categoryManFashion},
    {'cover': Assetvalue.categoryWomanFashion, 'title': categoryWomanFashion},
    {'cover': Assetvalue.categoryBook, 'title': 'Semua Kategori'}
  ];

  static List<Product> dataProduct = [
    Product(
        id: 1,
        name: 'Iphone 12 Pro Max BNIB iBox',
        description: loremIpsum,
        cover: Assetvalue.product1,
        images: [Assetvalue.product1],
        category: categoryGadget,
        price: 12000000,
        stock: 15),
    Product(
        id: 2,
        name: 'Novel Dunia Anna',
        description: loremIpsum,
        cover: Assetvalue.product2,
        images: [Assetvalue.product2],
        category: categoryBook,
        price: 50000,
        stock: 2),
    Product(
        id: 1,
        name: 'Rice Cooker Sharp KS-N18MG Sharp 1.8L',
        description: loremIpsum,
        cover: Assetvalue.product3,
        images: [Assetvalue.product3],
        category: categoryKitchen,
        price: 249000,
        stock: 240),
    Product(
        id: 1,
        name: 'PROMO !! Jaket Parasut Wanita Anti Air Blazer Semi Parka',
        description: loremIpsum,
        cover: Assetvalue.product4,
        images: [Assetvalue.product4],
        category: categoryWomanFashion,
        price: 120000,
        stock: 120),
    Product(
        id: 1,
        name: 'Jaket pria IKC 002 distro cbr six Bandung hoodie dua sisi',
        description: loremIpsum,
        cover: Assetvalue.product5,
        images: [Assetvalue.product5],
        category: categoryManFashion,
        price: 155000,
        stock: 30),
  ];
}
