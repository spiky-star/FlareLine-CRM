

import 'package:flareline_crm/pages/task/task_state.dart';
import 'package:flareline_uikit/service/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends BlocBaseViewModel<TaskState> {
  TaskViewModel(BuildContext context):super(context,TaskState());
}
