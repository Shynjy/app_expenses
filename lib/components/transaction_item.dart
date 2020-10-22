import 'package:app_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String) onRemove;
  
  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Column(
              children: [
                const Text(
                  'R\$',
                  style: TextStyle(fontSize: 8),
                ),
                FittedBox(
                  child: Text('${tr.value.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('y MMM d').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                onPressed: () => onRemove(tr.id),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onRemove(tr.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}