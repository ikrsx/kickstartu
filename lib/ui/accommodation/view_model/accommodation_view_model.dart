import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/data/repositories/core_repository.dart';
import 'package:kickstartu/domain/service_model.dart';

class AccommodationViewModel extends ChangeNotifier {
  AccommodationViewModel({
    required AccommodationRepository accommodationRepository,
    required CoreRepository coreRepository,
  }) : _accommodatioRepository = accommodationRepository,
       _coreRepository = coreRepository;

  final AccommodationRepository _accommodatioRepository;
  final CoreRepository _coreRepository;

  List<ServiceModel> _accommodations = [];
  dynamic _accommodation;
  String? _error;
  final Logger _logger = Logger();

  List<ServiceModel> get accommodations => _accommodations;
  dynamic get accommodation => _accommodation;
  String? get error => _error;

  // Get List Of Accommodations From Core Repository
  Future<void> listAccommodations() async {
    try {
      _accommodations = await _coreRepository.buildServiceModelList(
        "accommodation",
      );
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }

  // Get Details Of Accommodations From Accommodation Repository
  Future<void> getAccommodationDetails(String id) async {
    try {
      _accommodation = await _accommodatioRepository.buildAccommodationModel(
        id,
      );
      notifyListeners();
    } catch (e) {
      _error = ApplicationStrings.instance.errorMessage;
      _logger.d(e.toString());
    }
  }
}
