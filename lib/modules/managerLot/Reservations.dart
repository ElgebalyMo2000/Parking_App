import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/states.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return ConditionalBuilder(
            condition: state is! AppLoadingBookingDataState,
            builder: (context) => ListView.separated(
                  itemBuilder: (context, index) => BuildReservationItem(),
                  separatorBuilder: (context, index) => dividerItem(),
                  itemCount: 15,
                  physics: const BouncingScrollPhysics(),
                ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
