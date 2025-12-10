import 'package:flutter/material.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/domain/service_model.dart';
import 'package:logger/logger.dart';

class AccommodationViewModel extends ChangeNotifier {
  AccommodationViewModel(AccommodationRepository repository)
    : _repository = repository;

  final AccommodationRepository _repository;

  List<ServiceModel> _accommodations = [];
  dynamic _accommodation;
  String? _error;
  Logger? _logger;

  List<ServiceModel> get accommodations => _accommodations;
  dynamic get accommodation => _accommodation;
  String? get error => _error;

  // Get List Of Accommodations From Repository
  Future<void> getAccommodations() async {
    try {
      _accommodations = await _repository.buildAccommodationModelList();
      notifyListeners();
    } catch (e) {
      _error = "Something went wrong...";
      _logger!.d(e.toString());
    }
  }

  // Get Details Of Accommodations From Repository
  Future<void> getAccommodationDetails(String id) async {
    try {
      _accommodation = await _repository.buildAccommodationModel(id);
      notifyListeners();
    } catch (e) {
      _error = "Something went wrong...";
      _logger!.d(e.toString());
    }
  }
}
