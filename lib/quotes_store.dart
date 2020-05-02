import 'package:mobx/mobx.dart';
import 'db_store.dart';
import 'quotes_models.dart';
import 'api_helper.dart';
import 'constants.dart';
part 'quotes_store.g.dart';

class QuotesListStore = _QuotesListStore with _$QuotesListStore;

abstract class _QuotesListStore with Store {
  _QuotesListStore() {
    getQuotes();
  }

  @observable
  List allQuotes = [];

  @action
  Future<void> getQuotes() async {
    allQuotes = [];
    final quotesList = await DBStore.db.getQuotes();

    if (quotesList.isNotEmpty) {
      allQuotes = quotesList;
    } else {
      await getQuotesFromApi();
    }
  }

  Future<void> getQuotesFromApi() async {
    final apiHelper = ApiService('$kBaseApiURL/page/1');
    final data = await apiHelper.getResponse();
    int counter = 0;

    for (int i = 0; i < data.length; i++) {
      final cardItem = data[i];
      final id = counter++;
      final quoteId = cardItem['id'];
      final author = cardItem['author'];
      final quote = cardItem['en'];
      allQuotes.add(Quotes(id, author, quote, quoteId));
    }

    await DBStore.db.inserQuotes(allQuotes);
  }
}
