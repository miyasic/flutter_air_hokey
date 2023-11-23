import 'package:air_hokey/counter/cubit/counter_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

final _counter = CounterCubit();

// Provide the counter instance via `RequestContext`.
final counterProvider = provider<CounterCubit>((_) => _counter);
