
import 'package:flareline_crm/pages/deals/deals_state.dart';
import 'package:flareline_uikit/service/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';

class DealsViewModel extends BlocBaseViewModel<DealsState> {
  DealsViewModel(BuildContext context):super(context,DealsState());
}
