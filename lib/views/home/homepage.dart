import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/views/home/home_widgets/first_stack.dart';
import 'package:weather_app/views/home/home_widgets/header_widget.dart';
import 'package:weather_app/views/home/home_widgets/home_bottom_container.dart';
import 'package:weather_app/views/home/home_widgets/maintemp_banner.dart';
import 'package:weather_app/views/home/search_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String cityName = 'Dhaka';

  @override
  Widget build(BuildContext context) {
    final thmcxt = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    final double wholeHeight =
        size.height - MediaQuery.of(context).padding.bottom - kToolbarHeight;
    final currentWeather = ref.watch(currentWeatherProvider(cityName));
    return Scaffold(
      extendBody: true,
      body: currentWeather.when(data: (data) {
        if (data != null) {
          WeatherState weatherState;
          if (data.current.feelslikeC > 30) {
            weatherState = WeatherState.hot;
          }
          if (data.current.feelslikeC < 10) {
            weatherState = WeatherState.cold;
          } else {
            weatherState = WeatherState.normal;
          }
          return Stack(
            children: [
              Positioned.fill(
                child: HomepageFirstStack(
                  weatherState: weatherState,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchPage();
                        },
                      ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          cityName = value;
                        });
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 97, 92, 92),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Header(
                  lastUpdated: data.current.lastUpdated,
                  city: data.location.name,
                ),
              ),
              MainTempHomeBanner(
                thmCxt: thmcxt,
                temperature: data.current.tempC.toString(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeBottomContainer(
                  condition: data.current.condition.text,
                  feels: data.current.feelslikeC.toString(),
                  humidity: data.current.humidity.toString(),
                  windkph: data.current.windKph.toString(),
                ),
              ),
            ],
          );
        } else {
          return const Text('Data is null!');
        }
      }, error: (error, stackTrace) {
        print(stackTrace);
        return Text(error.toString());
      }, loading: () {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
