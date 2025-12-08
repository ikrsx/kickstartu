import 'package:flutter/material.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/domain/accommodation_model.dart';
import 'package:kickstartu/domain/service_model.dart';

class AccommodationViewModel extends ChangeNotifier {
  AccommodationViewModel(AccommodationRepository repository)
    : _repository = repository;

  final AccommodationRepository _repository;

  List<ServiceModel> _accommodations = [];
  AccommodationModel? _accommodation;
  String? _error;

  List<ServiceModel> get accommodations => _accommodations;
  AccommodationModel? get accommodation => _accommodation;
  String? get error => _error;

  // Get List Of Accommodations From Repository
  Future<void> getAccommodations() async {
    try {
      _accommodations = await _repository.buildAccommodationModelList();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    }
  }

  // Get Details Of Accommodations From Repository
  Future<void> getAccommodationDetails(String id) async {
    try {
      _accommodation = await _repository.buildAccommodationModel(id);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    }
  }
}
