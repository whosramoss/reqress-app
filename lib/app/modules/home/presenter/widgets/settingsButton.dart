import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'deviceWarnings.dart';

class SettingsButton extends StatefulWidget {
  final String email;
  final String id;
  final Function() onChanged;
  SettingsButton({this.email, this.id, this.onChanged});

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: Icon(Icons.settings, size: 35),
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.logout, color: Colors.white),
          backgroundColor: Colors.purple,
          label: 'Sair',
          labelBackgroundColor: Colors.purple,
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
          onTap: widget.onChanged,
        ),
        SpeedDialChild(
          child: Icon(Icons.person, color: Colors.white),
          backgroundColor: Colors.purple,
          label: 'Usuário',
          labelBackgroundColor: Colors.purple,
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
          onTap: () => DeviceWarnings.showUserDialog(
            context,
            widget.email,
            widget.id,
          ),
        ),
      ],
    );
  }
}
