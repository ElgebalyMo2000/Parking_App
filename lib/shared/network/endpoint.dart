import 'package:dbproject/shared/cubit/cubit.dart';

String reservations_id = AppCubit().getId() as String;
const LOGIN = 'customers/login';
const REGISTER = 'customers/register';
const RESERVATIONS = 'reservations/customer';
const lotReservations = 'reservations/parking-lot/';
String customerDetails = 'reservations/parking-lot/$reservations_id/';
//const customerDetails = 'reservations/parking-lot/${idCustomer}';
const cancelReservation = '/reservations/parking-lot/{reservation_id}/cancel';
const activateReservation =
    '/reservations/parking-lot/{reservation_id}/activate';

const me = 'customers/me';
const reserve = 'reservations/';
const MANAGER = 'parking-lots/login';
