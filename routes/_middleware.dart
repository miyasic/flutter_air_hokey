import 'package:air_hokey/counter/middleware/counter_provider.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) => handler.use(counterProvider);
