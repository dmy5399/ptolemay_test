import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test/presentation/bloc/counter/counter_bloc.dart';
import 'package:ptolemay_test/presentation/bloc/theme/theme_bloc.dart';
import 'package:ptolemay_test/presentation/bloc/weather/weather_bloc.dart';

int count = 1;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {

                  if (state is WeatherInitial) return const Text('Press the icon to get your location');

                  if (state is WeatherLoading) return const CircularProgressIndicator();

                  if (state is WeatherLoaded) {
                    return Text(
                      "Weather for ${state.weather.name}: ${state.weather.main.temp} °C"
                    );
                  }

                  return const Text(
                    'Unexpected Error',
                  );
                },
              ),

              const SizedBox(height: 50),

              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  int counter = 0;

                  if (state is CounterInitial) counter = state.counter;

                  return Text(
                    "$counter",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Stack(
            children: [

              Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: FittedBox(
                            child: FloatingActionButton(
                              onPressed: () => BlocProvider.of<WeatherBloc>(context).add(WeatherLoadEvent()),
                              child: const Icon(Icons.cloud),
                            ),
                          ),
                        ),

                        const Spacer(),

                        SizedBox(
                          height: 55,
                          width: 55,
                          child: FittedBox(
                            child: FloatingActionButton(
                              onPressed: () => BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent()),
                              child: const Icon(Icons.palette),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
              ),

              BlocListener<ThemeBloc, ThemeState>(
                listener: (context, state) {
                  if(state is ThemeLight) count = 1;

                  if(state is ThemeDark) count = 2;
                },
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if(state is CounterInitial) {
                      return Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedContainer(
                                  height: state.counter < 10 ? 55 : 0,
                                  width: state.counter < 10 ? 55 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterPlusEvent(count)),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ),

                                const Spacer(),

                                AnimatedContainer(
                                  height: state.counter > 0 ? 55 : 0,
                                  width: state.counter > 0 ? 55 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterMinusEvent(count)),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
