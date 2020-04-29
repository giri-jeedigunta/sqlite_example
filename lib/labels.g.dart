// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppLabels on _AppLabels, Store {
  final _$allLabelsAtom = Atom(name: '_AppLabels.allLabels');

  @override
  List<dynamic> get allLabels {
    _$allLabelsAtom.context.enforceReadPolicy(_$allLabelsAtom);
    _$allLabelsAtom.reportObserved();
    return super.allLabels;
  }

  @override
  set allLabels(List<dynamic> value) {
    _$allLabelsAtom.context.conditionallyRunInAction(() {
      super.allLabels = value;
      _$allLabelsAtom.reportChanged();
    }, _$allLabelsAtom, name: '${_$allLabelsAtom.name}_set');
  }

  final _$menuLabelsAtom = Atom(name: '_AppLabels.menuLabels');

  @override
  List<dynamic> get menuLabels {
    _$menuLabelsAtom.context.enforceReadPolicy(_$menuLabelsAtom);
    _$menuLabelsAtom.reportObserved();
    return super.menuLabels;
  }

  @override
  set menuLabels(List<dynamic> value) {
    _$menuLabelsAtom.context.conditionallyRunInAction(() {
      super.menuLabels = value;
      _$menuLabelsAtom.reportChanged();
    }, _$menuLabelsAtom, name: '${_$menuLabelsAtom.name}_set');
  }

  final _$cardLabelsAtom = Atom(name: '_AppLabels.cardLabels');

  @override
  List<dynamic> get cardLabels {
    _$cardLabelsAtom.context.enforceReadPolicy(_$cardLabelsAtom);
    _$cardLabelsAtom.reportObserved();
    return super.cardLabels;
  }

  @override
  set cardLabels(List<dynamic> value) {
    _$cardLabelsAtom.context.conditionallyRunInAction(() {
      super.cardLabels = value;
      _$cardLabelsAtom.reportChanged();
    }, _$cardLabelsAtom, name: '${_$cardLabelsAtom.name}_set');
  }

  final _$aboutUsStatsAtom = Atom(name: '_AppLabels.aboutUsStats');

  @override
  List<dynamic> get aboutUsStats {
    _$aboutUsStatsAtom.context.enforceReadPolicy(_$aboutUsStatsAtom);
    _$aboutUsStatsAtom.reportObserved();
    return super.aboutUsStats;
  }

  @override
  set aboutUsStats(List<dynamic> value) {
    _$aboutUsStatsAtom.context.conditionallyRunInAction(() {
      super.aboutUsStats = value;
      _$aboutUsStatsAtom.reportChanged();
    }, _$aboutUsStatsAtom, name: '${_$aboutUsStatsAtom.name}_set');
  }

  final _$getLabelsAsyncAction = AsyncAction('getLabels');

  @override
  Future<void> getLabels() {
    return _$getLabelsAsyncAction.run(() => super.getLabels());
  }

  @override
  String toString() {
    final string =
        'allLabels: ${allLabels.toString()},menuLabels: ${menuLabels.toString()},cardLabels: ${cardLabels.toString()},aboutUsStats: ${aboutUsStats.toString()}';
    return '{$string}';
  }
}
