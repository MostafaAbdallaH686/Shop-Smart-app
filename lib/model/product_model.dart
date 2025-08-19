import 'package:e_commerce/helper/app_images.dart';

class CartModel {
  final int id;
  final int quantity;
  final String title;
  final String desc;
  final String image;
  final double price;
  final bool isInCart;

  const CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
    this.isInCart = false,
  });

  CartModel copyWith({
    int? id,
    int? quantity,
    String? title,
    String? desc,
    String? image,
    double? price,
    bool? isInCart,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      price: price ?? this.price,
      isInCart: isInCart ?? this.isInCart,
    );
  }

  // same at run
  static final List<CartModel> _products = _generateProducts();

  static List<CartModel> getFakeProducts() => _products;

  static List<CartModel> _generateProducts() {
    final List<CartModel> products = [];

    // Product categories matching your images
    final Map<String, List<String>> productData = {
      'shoes': [
        'AirMax Running Shoes',
        'Classic Leather Loafers',
        'Hiking Boots Pro',
        'Canvas Sneakers',
        'Formal Oxford Shoes',
      ],
      'shirt': [
        'Premium Cotton T-Shirt',
        'Linen Button-Down Shirt',
        'Performance Polo Shirt',
        'Flannel Plaid Shirt',
        'Silk Dress Shirt',
      ],
      'bag': [
        'Leather Messenger Bag',
        'Travel Backpack',
        'Designer Handbag',
        'Laptop Briefcase',
        'Weekend Duffle Bag',
      ],
      'jeans': [
        'Slim Fit Jeans',
        'Vintage Denim Jacket',
        'Ripped Skinny Jeans',
        'High-Waisted Jeans',
        'Boyfriend Fit Jeans',
      ],
      'boat': [
        'Fishing Boat Shoes',
        'Yacht Deck Shoes',
        'Sailor Canvas Shoes',
        'Nautical Loafers',
        'Marine Sneakers',
      ],
      'sweatshirt': [
        'Oversized Hoodie',
        'Crewneck Sweatshirt',
        'Athletic Pullover',
        'Graphic Print Hoodie',
        'Zip-Up Fleece',
      ],
    };

    final Map<String, List<String>> descriptions = {
      'shoes': [
        'Ultra-lightweight with cushioned soles for all-day comfort',
        'Handcrafted from premium leather with durable rubber soles',
        'Waterproof construction with ankle support for rough terrain',
        'Breathable fabric with flexible soles for casual wear',
        'Polished finish with cushioned insoles for formal occasions',
      ],
      'shirt': [
        '100% organic cotton with reinforced stitching',
        'Breathable fabric that keeps you cool in warm weather',
        'Moisture-wicking technology for active lifestyles',
        'Cozy brushed interior for cold weather comfort',
        'Luxurious fabric with elegant drape for special occasions',
      ],
      'bag': [
        'Full-grain leather with multiple compartments',
        'Ergonomic design with USB charging port',
        'Signature monogram pattern with gold-tone hardware',
        'Shockproof compartment for 15" laptops',
        'Water-resistant material with shoe compartment',
      ],
      'jeans': [
        'Stretch denim for maximum mobility',
        'Vintage wash with authentic wear patterns',
        'Distressed details with reinforced knees',
        'Tummy control panel with sculpting fit',
        'Relaxed fit with classic five-pocket styling',
      ],
      'boat': [
        'Non-marking rubber soles perfect for deck wear',
        'Premium leather with quick-dry lining',
        'Hand-stitched seams with anti-slip tread',
        'Penny-loafers with nautical-inspired details',
        'Water-resistant uppers with drainage ports',
      ],
      'sweatshirt': [
        'Cozy fleece interior with adjustable drawstrings',
        'Heavyweight cotton with reinforced stitching',
        'Performance fabric with moisture management',
        'Bold graphics with screen-printed designs',
        'Two-way zipper with hidden pocket',
      ],
    };

    final Map<String, double> basePrices = {
      'shoes': 79.99,
      'shirt': 29.99,
      'bag': 89.99,
      'jeans': 59.99,
      'boat': 69.99,
      'sweatshirt': 39.99,
    };

    final List<String> images = [
      AppImages.shoes,
      AppImages.shirt,
      AppImages.bag,
      AppImages.jeans,
      AppImages.boat,
      AppImages.sweatshirt,
    ];

    int productId = 1;

    for (int i = 0; i < 100; i++) {
      final categoryIndex = i % images.length;
      final category = images[categoryIndex].split('/').last.split('.').first;

      final items = productData[category]!;
      final descs = descriptions[category]!;
      final itemIndex = (i + productId) % items.length;
      final descIndex = (i + productId + 2) % descs.length;

      final priceVariation = (i % 10) * 5 + (i % 3) * 2.5;
      final price = basePrices[category]! + priceVariation;

      products.add(
        CartModel(
          id: productId++,
          quantity: 1,
          title: items[itemIndex],
          desc: descs[descIndex],
          image: images[categoryIndex],
          price: double.parse(price.toStringAsFixed(2)),
          isInCart: false,
        ),
      );
    }

    return products;
  }
}
