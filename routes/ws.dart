import 'package:air_hokey/counter/cubit/counter_cubit.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      // A new client has connected to our server.
      // Subscribe the new client to receive notifications
      // whenever the cubit state changes.
      final cubit = context.read<CounterCubit>()..subscribe(channel);

      // Send the current count to the new client.
      channel.sink.add('${cubit.state}');

      // Listen for messages from the client.
      channel.stream.listen(
        (event) {
          switch (event) {
            // Handle an increment message.
            case '__increment__':
              cubit.increment();
              break;
            // Handle a decrement message.
            case '__decrement__':
              cubit.decrement();
              break;
            // Ignore any other messages.
            default:
              break;
          }
        },
        // The client has disconnected.
        // Unsubscribe the channel.
        onDone: () => cubit.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
