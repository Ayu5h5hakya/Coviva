import 'package:coviva/common/models/post.dart';
import 'package:equatable/equatable.dart';

abstract class FetchEvent extends Equatable {}

class Fetch extends FetchEvent {
  @override
  String toString() => 'Fetch';
}

class FetchComment extends FetchEvent {
  @override
  String toString() => 'FetchComment';
}

class InsertFirebase extends FetchEvent {
  final Post post;

  InsertFirebase({this.post});
  @override
  String toString() => 'FirebaseInsert';
}

class DeleteFirebase extends FetchEvent {
  final Post post;

  DeleteFirebase({this.post});
  @override
  String toString() => 'FirebaseDelete';
}

class FetchDB extends FetchEvent {
  @override
  String toString() => 'DBGet';
}

class FetchStats extends FetchEvent {
  @override
  String toString() => 'FetchStats';
}

class InsertDB extends FetchEvent {
  final Post post;
  
  InsertDB({this.post});
  @override
  String toString() => 'InsertDB';
}

class Reset extends FetchEvent {
  @override
  String toString() => 'Reset';
}