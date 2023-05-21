import 'package:flutter/material.dart';

class Activation extends StatelessWidget {
  const Activation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var lotReserve = AppCubit.get(context).reservationsLot;

        return ConditionalBuilder(
          condition: AppCubit.get(context).reservationsModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                ReservationBuilder(lotReserve[index], context),
            separatorBuilder: (context, index) => dividerItem(),
            itemCount: lotReserve.length,
            physics: const BouncingScrollPhysics(),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget ReservationBuilder(Map reservationsModel, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Column(
            children: [
              Text(
                '${reservationsModel['customer_name']}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Text('State : ${reservationsModel['state']}'),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Duration : ${reservationsModel['duration']}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
