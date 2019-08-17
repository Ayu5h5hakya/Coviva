import 'package:equatable/equatable.dart';

abstract class FetchEvent extends Equatable {}

class Fetch extends FetchEvent {
  @override
  String toString() => 'Fetch';

}

class FetchDB extends FetchEvent {
  @override
  String toString() => 'DBGet';
}