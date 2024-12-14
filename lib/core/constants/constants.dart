//base url
import 'package:dio/dio.dart';

const String baseUrl = "https://api.escuelajs.co/api/v1";
Options options = Options(headers: {"Content-Type": "application/json"});

//Local storage Keys
const String kCachedCategoryData = "CACHED_Category_DATA";
const String kCachedProductData = "CACHED_PRODUCT_DATA";

//category keys
const String kCategoryId = "id";
const String kCategoryName = "name";
const String kCategoryImage = "image";

//product keys
const String kProductId = "id";
const String kProductTitle = "title";
const String kProductPrice = "price";
const String kProductDescription = "description";
const String kCategroy = "category";
const String kProductImages = "images";
