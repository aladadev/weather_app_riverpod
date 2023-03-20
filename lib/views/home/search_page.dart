import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cityList = ref.watch(searchWeatherProvider(_searchController.text));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  if (value.length > 2) {
                    setState(() {
                      ref.invalidate(searchWeatherProvider(value));
                    });
                  } else if (value.isEmpty) {
                    setState(() {
                      ref.invalidate(searchWeatherProvider(null));
                    });
                  }
                },
                controller: _searchController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 207, 168, 168),
                      width: 1.2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search a city',
                ),
              ),
              Expanded(
                child: cityList.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const SizedBox();
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              data[index].name,
                            ),
                            subtitle: Text(
                              data[index].country,
                            ),
                            onTap: () {
                              Navigator.pop(context, data[index].name);
                            },
                          );
                        },
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
