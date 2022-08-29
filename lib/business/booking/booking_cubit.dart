import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/model/book/book.dart';
import 'package:plane/model/log/login_web.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  Book?book;
  static BookingCubit get(context)=>BlocProvider.of(context);
  void bookticket({
  required String units,
    required String type,
    required int cost,
    required String user_id,
    required String flight_id,

  }){
    emit(BookingLoading());
    LoginWeb.postData(url:"users/tickets/book-ticket/2",
        data: {
          "units":units,
          "type":type,
          "cost":cost,
          "user_id":user_id,
          "flight_id":flight_id,

        }
    ).then((value){
      print("Booking  sucesssssssss");
      book=Book.fromJson(value.data);
      print(value.data);
      emit(BookingSuccess(book!));
    }).catchError((error) {
      print(error.toString());
      emit(BookingnError(error.toString()));
    });
  }




}
