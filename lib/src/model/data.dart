import 'package:acecook/src/model/category.dart';
import 'package:acecook/src/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Hảo hảo mì tôm chua cay New 30',
        price: '118.000 đ',
        isSelected: true,
        isliked: false,
        image: 'assets/BIG_35.Mi_Hao_Hao_Tom_Chua_Cay.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 2,
        name: 'Mì ly Modern Lẩu thái 24',
        price: '1170.000 đ',
        isliked: false,
        image: 'assets/BIG_58.Mi_Ly_Modern_Lau_Thai_Tom.jpg',
        category: "Thùng 24 ly"),
    Product(
        id: 4,
        name: 'Hảo Hảo mì xào chua ngọt New 30',
        price: '118.000 đ',
        isliked: false,
        image: 'assets/BIG_39.Mi_Hao_Hao_Tom_Xao_Chua_Ngot.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 5,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 6,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 7,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
  ];
  static List<Product> productList1 = [
    Product(
        id: 3,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 3,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 1,
        name: 'Hảo hảo mì tôm chua cay New 30',
        price: '118.000 đ',
        isSelected: true,
        isliked: false,
        image: 'assets/BIG_35.Mi_Hao_Hao_Tom_Chua_Cay.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 2,
        name: 'Mì ly Modern Lẩu thái 24',
        price: '1170.000 đ',
        isliked: false,
        image: 'assets/BIG_58.Mi_Ly_Modern_Lau_Thai_Tom.jpg',
        category: "Thùng 24 ly"),
    Product(
        id: 4,
        name: 'Hảo Hảo mì xào chua ngọt New 30',
        price: '118.000 đ',
        isliked: false,
        image: 'assets/BIG_39.Mi_Hao_Hao_Tom_Xao_Chua_Ngot.jpg',
        category: "Thùng 30 gói"),
  ];
  static List<Product> cartList = [
    Product(
        id: 3,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 3,
        name: 'Mì đệ nhất thịt bằm 30',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/BIG_50.Mi_De_Nhat_Thit_Bam.jpg',
        category: "Thùng 30 gói"),
    Product(
        id: 1,
        name: 'Áo Polo Nam Tay Ngắn Thêu Form Fitted - 10F21POL039',
        price: '450.000 đ',
        isSelected: true,
        isliked: false,
        image: 'assets/7.jpg',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Áo Polo Nam Dệt Kim Tay Ngắn Trơn Form Slim - 10F21POL037',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/1.jpg',
        category: "Trending Now"),
    Product(
        id: 4,
        name: 'Áo Polo Nam Thêu Basic Form Fitted - 10F21POL027C',
        price: '500.000 đ',
        isliked: false,
        image: 'assets/5.jpg',
        category: "Trending Now"),
    Product(
        id: 3,
        name: 'Áo Polo Nam Trơn Form Fitted - 10S21POL001C',
        price: '220.000 đ',
        isliked: false,
        image: 'assets/6.jpg',
        category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1, name: "Phở", image: 'assets/shoe_thumb_2.png', isSelected: true),
    Category(id: 2, name: "Mì chiên", image: 'assets/87. LMTM30.jpg'),
    Category(id: 3, name: "Mì không chiên", image: 'assets/watch.png'),
    Category(id: 4, name: "Bún", image: 'assets/02. HNBHN30.jpg'),
    Category(id: 5, name: "Cháo", image: 'assets/watch.png'),
    Category(id: 8, name: "Hủ tiếu", image: 'assets/08. NSHNN30.jpg'),
    Category(id: 6, name: "Muối chấm", image: 'assets/watch.png'),
    Category(id: 7, name: "Miến", image: 'assets/57. PMISM24.jpg'),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
