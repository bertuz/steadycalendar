import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:steadycalendar/config/constants.dart';

class Background extends StatelessWidget {
  final String? backgroundSlug;

  const Background(this.backgroundSlug, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:
          "${baseBackgroundImageUrl(dotenv.get('SUPABASE_PROJECT_ID', fallback: ''))}/$backgroundSlug",
      placeholder: (_, _1) => const CircularProgressIndicator(),
      errorWidget: (_, _2, _3) => const Icon(Icons.error),
    ));
  }
}
