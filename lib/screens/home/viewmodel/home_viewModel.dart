import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/constants/api_endpoints.dart';
import 'package:lingopanda_assignment/screens/home/model/home_productsmodel.dart';
import 'package:lingopanda_assignment/services/Api/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    // Call the api for fetching the products
    fetchProducts();

    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
      showDiscountedPrice = remoteConfig.getBool("showDiscountedPrice");
      debugPrint("showDiscountedPrice $showDiscountedPrice");
      notifyListeners();
    });
  }

  final api = Api();

  bool showDiscountedPrice = false;
  bool fetchProductsLoading = false;

  List<Product>? products;

  Future<void> fetchProducts() async {
    try {
      fetchProductsLoading = true;
      notifyListeners();
      final response = await api.sendRequest.get(ApiEndpoints.products);
      if (response.statusCode == 200) {
        final homeData = HomeProductsData.fromJson(response.data);
        products = homeData.products;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    fetchProductsLoading = false;
    notifyListeners();
  }
}
