import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'exchange_card_controller.dart';

class CurrencySwitch extends ConsumerStatefulWidget {
  const CurrencySwitch({super.key});

  @override
  ConsumerState<CurrencySwitch> createState() => _CurrencySwitchState();
}

class _CurrencySwitchState extends ConsumerState<CurrencySwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SizedBox(
        height: 52,
        width: 52,
        child: FloatingActionButton(
          onPressed: () {
            if (_isFlipped) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            _isFlipped = !_isFlipped;
            ref.read(exchangeCardControllerProvider.notifier).swapCurrencies();
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          hoverElevation: 0,
          shape: const CircleBorder(),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(_animation.value * 3.14159),
                child: Icon(
                  Icons.compare_arrows_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 32,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
