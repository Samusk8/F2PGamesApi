import 'package:flutter/widgets.dart';

class PlatformsProvider with ChangeNotifier{
  final List<String> _platforms = [
    'pc',
    'browser',
  ];

  String _selectedPlatform = 'pc';

  List<String> get getPlatforms => _platforms;
  String get getSelectedPlatform => _selectedPlatform;

  void setSelectedPlatform(String platform){
    _selectedPlatform = platform;
    notifyListeners();
  }
}