import 'package:flareline_uikit/service/bloc/bloc_base_state.dart';

class SignInState extends BlocBaseState {
  String? userName = 'admin';

  String? password = '123456';

  bool? loginStatus;

  @override
  // TODO: implement props
  List<Object?> get props => [loginStatus];


}
