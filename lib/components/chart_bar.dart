import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(
                    'R\$\n${value.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(
                  alignment:
                      Alignment.bottomCenter, //faz o barra começar de baixo
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(label),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
