import 'package:equatable/equatable.dart';

abstract class FetchEvent extends Equatable {}

class Fetch extends FetchEvent {
  @override
  String toString() => 'Fetch';

}