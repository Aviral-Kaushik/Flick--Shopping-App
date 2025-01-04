import 'package:flick/features/order/bloc/order_event.dart';
import 'package:flick/features/order/bloc/order_state.dart';
import 'package:flick/features/order/repository/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {

  final OrderRepository orderRepository;

  OrderBloc(this.orderRepository) : super(const InitialOrderState()) {
    on<PostOrder>((event, emit) async {
      emit(const OrderLoadingState("Please wait! Posting Your Order"));

      bool isOrderPosted = await orderRepository.postOrder(event.preOrder);

      if (!isOrderPosted) {
        emit(const OrderError("Failed to post order!"));
        return;
      }

      emit(const OrderPosted());

    });
  }

}