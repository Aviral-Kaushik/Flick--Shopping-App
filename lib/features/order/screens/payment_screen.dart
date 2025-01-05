import 'package:flick/components/simple_header.dart';
import 'package:flick/features/order/bloc/order_bloc.dart';
import 'package:flick/features/order/bloc/order_event.dart';
import 'package:flick/features/order/bloc/order_state.dart';
import 'package:flick/features/order/components/payment_button_widget.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/services/stripe_service.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.preOrder});

  final PreOrder preOrder;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final StripeService _stripeService = StripeService.instance;

  final OrderBloc _orderBloc = locator.get<OrderBloc>();

  late DialogHelper dialogHelper;

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  void showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  void showErrorDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog("Oops!", message, "Dismiss", true,
            () {
          isAnyDialogShowing = false;
        });
  }

  void dismissAllDialogs() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
  }

  Widget paymentOptionsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PaymentButtonWidget(
          icon: Icons.credit_card,
          title: "Pay Using Card",
          onPressed: () {
            _stripeService.makePayment(
              widget.preOrder.totalPriceAtCheckout,
              () {
                debugPrint("Payment Success on Payment Screen");
                _orderBloc.add(CreateOrder(widget.preOrder));
              }, () {
                debugPrint("Payment Failure on Payment Screen");
                showErrorDialog("Payment Failed. Please try again.");
              },
            );
          },
        ),

        const SizedBox(
          height: appPadding * 1.5,
        ),

        PaymentButtonWidget(
          icon: Icons.delivery_dining_outlined,
          title: "Pay On Delivery",
          onPressed: () {
            _orderBloc.add(CreateOrder(widget.preOrder));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _orderBloc,
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is OrderLoadingState) {
            showProgressDialog(state.progressMessage);
          }

          if (state is OrderError) {
            dismissAllDialogs();
            showErrorDialog(state.errorMessage);
          }

          if (state is OrderCreated) {
            dismissAllDialogs();
            Navigator.pushReplacementNamed(
                context,
                "/orderSuccessfulScreen"
            );
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Column(
                children: [

                  const SimpleHeader(title: "Checkout"),

                  const SizedBox(
                    height: appPadding,
                  ),

                  Divider(
                    color: blackColor,
                  ),

                  const SizedBox(
                    height: appPadding * 2,
                  ),

                  paymentOptionsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
