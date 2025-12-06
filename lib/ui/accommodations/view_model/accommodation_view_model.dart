import 'package:flutter/material.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/domain/accommodation_model.dart';

class AccommodationViewModel extends ChangeNotifier {
  AccommodationViewModel({required AccommodationRepository repository})
    : _repository = repository;

  final AccommodationRepository _repository;

  String? _error;
  bool _isLoading = true;
  List<AccommodationModel> _accommodations = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<AccommodationModel> get accommodations => _accommodations;

  Future<void> listAccommodations() async {
    try {
      _accommodations = await _repository.getAccommodations();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
