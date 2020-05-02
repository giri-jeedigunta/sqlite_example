// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuotesListStore on _QuotesListStore, Store {
  final _$allQuotesAtom = Atom(name: '_QuotesListStore.allQuotes');

  @override
  List<dynamic> get allQuotes {
    _$allQuotesAtom.context.enforceReadPolicy(_$allQuotesAtom);
    _$allQuotesAtom.reportObserved();
    return super.allQuotes;
  }

  @override
  set allQuotes(List<dynamic> value) {
    _$allQuotesAtom.context.conditionallyRunInAction(() {
      super.allQuotes = value;
      _$allQuotesAtom.reportChanged();
    }, _$allQuotesAtom, name: '${_$allQuotesAtom.name}_set');
  }

  final _$getQuotesAsyncAction = AsyncAction('getQuotes');

  @override
  Future<void> getQuotes() {
    return _$getQuotesAsyncAction.run(() => super.getQuotes());
  }

  @override
  String toString() {
    final string = 'allQuotes: ${allQuotes.toString()}';
    return '{$string}';
  }
}
