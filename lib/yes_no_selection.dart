import 'package:flutter/material.dart';
import 'app_state.dart'; // Asegúrate de importar el archivo correcto

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({
    super.key,
    required this.state,
    required this.onSelection,
  });

  final Attending state;
  final ValueChanged<Attending> onSelection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  state == Attending.yes ? Colors.purple : Colors.grey,
            ),
            onPressed: () => onSelection(Attending.yes),
            child: const Text('YES'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  state == Attending.no ? Colors.purple : Colors.grey,
            ),
            onPressed: () => onSelection(Attending.no),
            child: const Text('NO'),
          ),
        ),
      ],
    );
  }
}
