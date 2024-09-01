
import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{}

class offlineFailure extends Failures{
  @override
  List<Object?> get props => [];
}

class serverFailure extends Failures{
  @override
  List<Object?> get props => [];
}


class emptyCachFailure extends Failures{
  @override
  List<Object?> get props => [];
}


class wrongDataFailure extends Failures{
  @override
  List<Object?> get props => [];
}