import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/widgets/notebook_view.dart';

class CepManagerPage extends HookWidget {
  const CepManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final indexView = useState<Widget>(const NotebookView());
    final indexColor = useState(Colors.amber);

    return Theme(
      data: ThemeData(primarySwatch: indexColor.value),
      child: Scaffold(
        appBar: AppBar(title: const Text('Gerenciador de CEPs')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: (int index) {
            final isIndex0 = index == 0;

            selectedIndex.value = index;
            indexView.value =
                isIndex0 ? const NotebookView() : const SizedBox();
            indexColor.value = isIndex0 ? Colors.blue : Colors.green;
          },
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
        body: indexView.value,
      ),
    );
  }
}
