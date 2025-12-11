import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:kickstartu/data/repositories/shop_repositories.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/data/repositories/core_repository.dart';
import 'package:kickstartu/domain/service_model.dart';

class ShopViewModel extends ChangeNotifier {
  ShopViewModel({
    required ShopRepositories shopRepository,
    required CoreRepository coreRepository,
  }) : _shopRepository = shopRepository,
       _coreRepository = coreRepository;

  final ShopRepositories _shopRepository;
  final CoreRepository _coreRepository;

  List<ServiceModel> _shops = [];
  dynamic _shop;
  String? _error;
  final Logger _logger = Logger();

  List<ServiceModel> get shops => _shops;
  dynamic get shop => _shop;
  String? get error => _error;

  // Get List Of Shops From Core Repository
  Future<void> listShops() async {
    try {
      _shops = await _coreRepository.buildServiceModelList("shop");
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }

  // Get Details Of Food Service From Food Service Repository
  Future<void> getShopDetails(String id) async {
    try {
      _shop = await _shopRepository.buildShopModel(id);
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }
}
