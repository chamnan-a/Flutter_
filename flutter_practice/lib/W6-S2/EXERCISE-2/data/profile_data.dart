import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart'; 
ProfileData ronanProfile = ProfileData(
    name: "Chamnan",
    position: "Flutter Developer",
    avatarUrl: 'assets/w6-s2/aang.png',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "014 753 100"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "chamnan.kheng@student.cadt.edu.kh"),
    ]);
