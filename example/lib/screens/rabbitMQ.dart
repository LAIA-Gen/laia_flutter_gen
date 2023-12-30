import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dart_amqp/dart_amqp.dart' as dart_amqp;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmqpProvider extends StateNotifier<AMQPData> {
  AmqpProvider()
      : super(AMQPData(
          latitude: 0.0,
          longitude: 0.0,
          height: 0.0,
          timestamp: '',
        )) {
          connectAndRetrieveCoordinates();
        }

  Future<void> connectAndRetrieveCoordinates() async {
    dart_amqp.ConnectionSettings settings = dart_amqp.ConnectionSettings(
      host: "10.0.2.2",
    );

    dart_amqp.Client client = dart_amqp.Client(settings: settings);

    try {
    await client
        .channel()
        .then((dart_amqp.Channel channel) {
          return channel.exchange("coordinates", dart_amqp.ExchangeType.FANOUT, durable: false);
        })
        .then((dart_amqp.Exchange exchange) {
      print(" [*] Waiting for messages in coordinates. To Exit press CTRL+C");
      return exchange.bindPrivateQueueConsumer(null);
    })
        .then((dart_amqp.Consumer consumer) {
      consumer.listen((dart_amqp.AmqpMessage event) {
        print(" [x] Received ${event.payloadAsString}");
        final Map<String, dynamic> coordinatesData = json.decode(event.payloadAsString);
        final double latitude = coordinatesData['latitude'].toDouble();
        final double longitude = coordinatesData['longitude'].toDouble();
        final double height = coordinatesData['height'].toDouble();
        final String timestamp = coordinatesData['timestamp'];

        state = AMQPData(
          latitude: latitude,
          longitude: longitude, 
          height: height,
          timestamp: timestamp
        );
      });
    });
  } catch (e) {
    print("Error during RabbitMQ channel setup: $e");
  }
  
  }
}

class AMQPData {
  final double latitude;
  final double longitude;
  final double height;
  final String timestamp;

  AMQPData({
    required this.latitude,
    required this.longitude,
    required this.height,
    required this.timestamp,
  });
}

final amqpProvider =
    StateNotifierProvider<AmqpProvider, AMQPData>(
  (ref) => AmqpProvider(),
);