import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/notebook_view.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/search_view.dart';

class CepManagerPage extends HookWidget {
  static const _views = [NotebookView(), SearchView()];

  const CepManagerPage({Key? key}) : super(key: key);

  void _setSelectedView({
    required int index,
    required ValueNotifier<CepManagerView> viewState,
  }) =>
      viewState.value = index == 0
          ? const CepManagerView.first()
          : const CepManagerView.second();

  @override
  Widget build(BuildContext context) {
    final selectedView = useState<CepManagerView>(const CepManagerView.first());

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

class CepManagerView {
  final Widget view;
  final MaterialColor primarySwatch;
  final int selectedIndex;

  const CepManagerView.first()
      : primarySwatch = Colors.amber,
        selectedIndex = 0,
        view = const NotebookView();

  const CepManagerView.second()
      : primarySwatch = Colors.green,
        selectedIndex = 1,
        view = const SearchView();
}
