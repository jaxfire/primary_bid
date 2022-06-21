import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:primary_bid/presentation/login/cubit/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const Loading());
}
