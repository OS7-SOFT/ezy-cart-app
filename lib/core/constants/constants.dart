//base url
import 'package:dio/dio.dart';

const String baseUrl = "https://api.escuelajs.co/api/v1";
Options options = Options(headers: {"Content-Type": "application/json"});

//Local storage Keys
const String kCachedCategoryData = "CACHED_Category_DATA";

//category keys
const String kCategoryId = "id";
const String kCategoryName = "name";
const String kCategoryImage = "image";
