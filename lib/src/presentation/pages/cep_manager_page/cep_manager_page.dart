import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/notebook_view.dart';

class CepManagerPage extends HookWidget {
  const CepManagerPage({Key? key}) : super(key: key);

  void _setView({
    required int index,
    required ValueNotifier<ViewState> viewState,
  }) =>
      viewState.value = index == 0
          ? const NotebookViewState(selectedIndex: 0)
          : const SearchViewState(selectedIndex: 1);

  @override
  Widget build(BuildContext context) {
    final viewState = useState<ViewState>(
      const NotebookViewState(selectedIndex: 0),
    );

    return Theme(
      data: ThemeData(primarySwatch: viewState.value.primarySwatch),
      child: Scaffold(
        appBar: AppBar(title: const Text('Gerenciador de CEPs')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewState.value.selectedIndex,
          onTap: (index) => _setView(index: index, viewState: viewState),
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
        body: viewState.value.view,
      ),
    );
  }
}

abstract class ViewState {
  final Widget view;
  final MaterialColor primarySwatch;
  final int selectedIndex;

  const ViewState({
    required this.view,
    required this.primarySwatch,
    required this.selectedIndex,
  });
}

class NotebookViewState extends ViewState {
  const NotebookViewState({required super.selectedIndex})
      : super(
          primarySwatch: Colors.blue,
          view: const NotebookView(),
        );
}

class SearchViewState extends ViewState {
  const SearchViewState({required super.selectedIndex})
      : super(
          primarySwatch: Colors.green,
          view: const SizedBox(),
        );
}
