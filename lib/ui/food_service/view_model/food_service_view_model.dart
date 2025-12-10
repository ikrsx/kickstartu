import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:kickstartu/data/repositories/food_service_repositories.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/data/repositories/core_repository.dart';
import 'package:kickstartu/domain/service_model.dart';

class FoodServiceViewModel extends ChangeNotifier {
  FoodServiceViewModel({
    required FoodServiceRepositories foodServiceRepository,
    required CoreRepository coreRepository,
  }) : _foodServiceRepository = foodServiceRepository,
       _coreRepository = coreRepository;

  final FoodServiceRepositories _foodServiceRepository;
  final CoreRepository _coreRepository;

  List<ServiceModel> _foodServices = [];
  dynamic _foodService;
  String? _error;
  final Logger _logger = Logger();

  List<ServiceModel> get foodServices => _foodServices;
  dynamic get foodService => _foodService;
  String? get error => _error;

  // Get List Of Food Services From Core Repository
  Future<void> listFoodServices() async {
    try {
      _foodServices = await _coreRepository.buildServiceModelList(
        "food_service",
      );
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }

  // Get Details Of Food Service From Food Service Repository
  Future<void> getAccommodationDetails(String id) async {
    try {
      _foodService = await _foodServiceRepository.buildFoodServiceModel(id);
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }
}
