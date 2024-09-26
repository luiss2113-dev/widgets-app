import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  const SlideInfo(
    this.title,
    this.description,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  const SlideInfo(
    'Busca La comida',
    'Duis quis non quis mollit adipisicing non adipisicing ad commodo sint qui aliquip elit. Tempor do id laborum elit esse officia Lorem. Et irure consectetur laborum amet adipisicing eiusmod et sint anim. Fugiat laboris anim nostrud irure est qui eu sit occaecat est non. Amet ipsum commodo eiusmod et commodo. Velit pariatur reprehenderit deserunt enim ullamco.',
    'assets/images/1.png',
  ),
  const SlideInfo(
    'Entrega rápida',
    'Tempor excepteur mollit nulla excepteur fugiat officia enim anim qui dolor. Proident duis commodo duis exercitation ipsum sunt sit sit. Nulla deserunt est aute reprehenderit velit ullamco ut occaecat nulla nostrud non quis excepteur. Pariatur sint excepteur elit sint ipsum fugiat duis. Fugiat non aute dolore magna mollit elit. Cillum Lorem id ullamco officia ut do voluptate ipsum. Pariatur amet ex Lorem do velit ipsum labore Lorem nulla magna sint.',
    'assets/images/2.png',
  ),
  const SlideInfo(
    'Disfruta la comida',
    'Nulla aliqua occaecat amet et eu qui magna dolore tempor aute. Sunt eu duis anim sunt ad excepteur quis. Mollit ea fugiat incididunt in. Ex Lorem excepteur excepteur officia ullamco esse mollit dolore. Lorem amet proident veniam tempor sit veniam aute culpa nostrud ad cupidatat veniam. Elit nisi do sit tempor duis adipisicing magna ea laboris. Cillum non eiusmod sit et quis sunt ut cillum in.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() => endReached = true);
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    description: slideData.description,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop,
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme(:bodyLarge, :titleLarge) = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text(title, style: titleLarge),
            const SizedBox(height: 10),
            Text(description, style: bodyLarge),
          ],
        ),
      ),
    );
  }
}
