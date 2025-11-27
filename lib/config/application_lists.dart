import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/ui/accommodations/view_model/accommodation_view_model.dart';
import 'package:provider/provider.dart';

class ApplicationLists {
  ApplicationLists._();

  static final ApplicationLists instance = ApplicationLists._();

  final _applicationProviders = [
    ChangeNotifierProvider(
      create: (_) => AccommodationViewModel(
        repository: AccommodationRepository(services: AccommodationServices()),
      ),
    ),
  ];

  get applicationProvider => _applicationProviders;
}
