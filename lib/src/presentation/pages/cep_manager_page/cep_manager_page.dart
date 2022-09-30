import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CepManagerPage extends HookWidget {
  static const _views = [SizedBox(), SizedBox()];

  const CepManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedViewIndex = useState(0);

    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciador de CEPs')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedViewIndex.value,
        onTap: (int index) => selectedViewIndex.value = index,
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
      body: _views[selectedViewIndex.value],
    );
  }
}
