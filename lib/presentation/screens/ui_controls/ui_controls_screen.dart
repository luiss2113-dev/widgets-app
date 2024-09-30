import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({
    super.key,
  });

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloperMode = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          value: isDeveloperMode,
          onChanged: (value) =>
              setState(() => isDeveloperMode = !isDeveloperMode),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(
            selectedTransportation.name,
          ),
          children: [
            RadioListTile(
                title: const Text('By Subamarine'),
                subtitle: const Text('Viaja por Submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.submarine)),
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Viaja por carro'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.car)),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viaja por bote'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.boat)),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viaja por avión'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.plane)),
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        )
      ],
    );
  }
}
