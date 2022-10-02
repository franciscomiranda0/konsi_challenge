import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/notebook_view.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/search_view.dart';

class CepManagerPage extends HookWidget {
  const CepManagerPage({Key? key}) : super(key: key);

  void _setSelectedView({
    required int index,
    required ValueNotifier<CepManagerView> viewState,
  }) =>
      viewState.value = CepManagerView.fromIndex(index);

  @override
  Widget build(BuildContext context) {
    final selectedView = useState<CepManagerView>(CepManagerView.fromIndex(0));

    return Theme(
      data: ThemeData(primarySwatch: selectedView.value.primarySwatch),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerenciador de CEPs'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedView.value.selectedIndex,
          onTap: (index) => _setSelectedView(
            index: index,
            viewState: selectedView,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Caderneta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisa',
            ),
          ],
        ),
        body: selectedView.value.view,
      ),
    );
  }
}

@immutable
abstract class CepManagerView {
  final Widget view;
  final MaterialColor primarySwatch;
  final int selectedIndex;

  const CepManagerView._({
    required this.view,
    required this.primarySwatch,
    required this.selectedIndex,
  });

  factory CepManagerView.fromIndex(int index) {
    switch (index) {
      case 1:
        return const SearchViewState._();
      case 0:
      default:
        return const NotebookViewState._();
    }
  }
}

class NotebookViewState extends CepManagerView {
  const NotebookViewState._()
      : super._(
          selectedIndex: 0,
          primarySwatch: Colors.blue,
          view: const NotebookView(),
        );
}

class SearchViewState extends CepManagerView {
  const SearchViewState._()
      : super._(
          selectedIndex: 1,
          primarySwatch: Colors.green,
          view: const SearchView(),
        );
}
