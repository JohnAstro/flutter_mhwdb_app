import 'package:flutter_mhwdb_app/utils/recovery.dart';
import 'package:flutter/material.dart';

class Ailment {
  final String name;
  final String desc;
  final Recovery recov;

  const Ailment({
    this.name,
    this.desc,
    this.recov,
  });

  factory Ailment.fromJson(dynamic json) {
    return Ailment(
        name: json["name"],
        desc: json["description"],
        recov: Recovery.fromJson(json["recovery"]));
  }

  // Given ailment name, display corresponding icon
  displayIcon(ailment, double h, double w) {
    if (ailment == 'Blastblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/blastblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Bleeding') {
      return Image(
        image: const AssetImage('assets/images/ailments/bleeding.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Dragonblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/dragonblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Effluvial Buildup') {
      return Image(
        image:
            const AssetImage('assets/images/ailments/effluvial_buildup.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Fireblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/fireblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Iceblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/iceblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Paralysis') {
      return Image(
        image: const AssetImage('assets/images/ailments/paralysis.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Poison') {
      return Image(
        image: const AssetImage('assets/images/ailments/poison.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Sleep') {
      return Image(
        image: const AssetImage('assets/images/ailments/sleep.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Stun') {
      return Image(
        image: const AssetImage('assets/images/ailments/stun.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Thunderblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/thunderblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Waterblight') {
      return Image(
        image: const AssetImage('assets/images/ailments/waterblight.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Wind Pressure') {
      return Image(
        image: const AssetImage('assets/images/ailments/wind_pressure.png'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Defense Down') {
      return Image(
        image: const AssetImage('assets/images/ailments/defense_down.webp'),
        height: h,
        width: w,
      );
    } else if (ailment == 'Muddy') {
      return Image(
        image: const AssetImage('assets/images/ailments/muddy.webp'),
        height: h,
        width: w,
      );
    }
  }
}
