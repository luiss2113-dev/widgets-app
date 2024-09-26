import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
          IconButton(
            onPressed: () {
              //ref
              //    .read(isDarkModeProvider.notifier)
              //    .update((isDarkMode) => !isDarkMode);

              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },
            icon: isDarkMode
                ? FadeInUp(
                    child: const Icon(Icons.dark_mode_outlined),
                  )
                : FadeInUp(
                    child: const Icon(Icons.light_mode_outlined),
                  ),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorList = ref.watch(colorListProvider);
    final indexColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];

        return RadioListTile(
            title: Text('Tengo este color', style: TextStyle(color: color)),
            subtitle: Text('Color ${color.value}'),
            value: index,
            activeColor: color,
            groupValue: indexColor,
            onChanged: (value) {
              ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            });
      },
    );
  }
}
