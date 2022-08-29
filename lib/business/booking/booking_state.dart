part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}
class BookingLoading extends BookingState {}
class BookingSuccess extends BookingState {
  final Book book;

  BookingSuccess(this.book);
}
class BookingnError extends BookingState {
  final String error;
  BookingnError(this.error);
}

