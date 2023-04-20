import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../provider/counter.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.inc();
              });
              _logger.i(provider?.state.value);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.dec();
              });

              _logger.i(provider?.state.value);
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
