import 'package:mobx/mobx.dart';
import 'db_store.dart';
import 'label_models.dart';
import 'api_helper.dart';
import 'constants.dart';
part 'labels.g.dart';

class AppLabels = _AppLabels with _$AppLabels;

abstract class _AppLabels with Store {
  _AppLabels() {
    getLabels();
  }

  @observable
  List allLabels = [];

  @observable
  List menuLabels = [];

  @observable
  List cardLabels = [];

  @observable
  List aboutUsStats = [];

  @action
  Future<void> getLabels() async {
    final appLabels = await DBStore.db.getAppLabels();

    if (appLabels.isNotEmpty) {
      allLabels = appLabels;
    } else {
      await getLabelsFromApi();
    }

    updateLabelsStore();
  }

  Future<void> getLabelsFromApi() async {
    final apiHelper = ApiService('$kBaseApiURL/getLabels');
    final data = await apiHelper.getResponse();
    int counter = 0;

    data.forEach((key, val) {
      final id = counter++;
      final name = key;
      final description = val;
      allLabels.add(AppLabelContent(id, name, description));
    });

    await DBStore.db.inserAppLabels(allLabels);
  }

  void updateLabelsStore() {
    for (var i = 0; i < allLabels.length; i++) {
      if (allLabels[i].name == 'app_menu_labels') {
        menuLabels = allLabels[i].description.split(', ');
      }
      if (allLabels[i].name == 'app_home_cards') {
        cardLabels = allLabels[i].description.split(', ');
      }
      if (allLabels[i].name == 'app_about_us_stats') {
        aboutUsStats = allLabels[i].description.split(', ');
      }
    }
  }
}
