import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final IconData icon;
  final String link;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Riverpod Counter',
    subtitle: 'Introducción a riverpod',
    link: '/counter-riverpod',
    icon: Icons.list_alt_rounded,
  ),
  MenuItems(
      title: 'Botones',
      subtitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbars y diálogos',
    subtitle: 'Indicadores de pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated container',
    subtitle: 'Stateful Widget Animado',
    link: '/animated',
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    title: 'Ui Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: '/uicontrols',
    icon: Icons.https,
  ),
  MenuItems(
    title: 'Introducción a la aplicación',
    subtitle: 'Pequeño tutorial introductorio',
    link: '/apptutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    title: 'InfiniteScroll y Pull',
    subtitle: 'Listas infinitas y pull to refresh',
    link: '/infinityscroll',
    icon: Icons.list_alt_rounded,
  ),
  MenuItems(
    title: 'Cambiar tema',
    subtitle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
