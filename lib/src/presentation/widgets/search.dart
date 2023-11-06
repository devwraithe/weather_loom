import 'package:flutter/material.dart';

import '../../core/constants/imports_barrel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        controller: search,
        onFieldSubmitted: (v) => context.read<WeatherBloc>().add(
              OnCityChanged(v),
            ),
      ),
    );
  }
}
