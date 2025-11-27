import 'package:flutter/material.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/domain/accommodation_model.dart';

class AccommodationViewModel extends ChangeNotifier {
  AccommodationViewModel({required AccommodationRepository repository})
    : _repository = repository;

  final AccommodationRepository _repository;
  List<AccommodationModel> _accommodations = [];

  List<AccommodationModel> get accommodations => _accommodations;

  Future<void> listAccommodations() async {
    _accommodations = await _repository.getAccommodations();
    notifyListeners();
  }
}
