import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/forms/drop_zone_widget.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/components/modal/modal_dialog.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/core/mvvm/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class AddTaskWidget extends BaseWidget<AddTaskViewModel> {
  AddTaskWidget({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, AddTaskViewModel viewModel, Widget? child) {
    return ButtonWidget(
      btnText: 'Add Task +',
      type: ButtonType.primary.type,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: 'Add Task',
            titleAlign: Alignment.centerLeft,
            showTitle: true,
            modalType: ModalType.medium,
            showCancel: false,
            width: 600,
            child: Column(
              children: [
                const OutBorderTextFormField(
                  hintText: 'Task Name',
                  hintStyle:
                      TextStyle(fontSize: 14, color: CrmColors.paragraph),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Assigned By'),
                        FlutterImageStack(
                          imageList: const [
                            'https://picsum.photos/200',
                            'https://picsum.photos/200',
                          ],
                          showTotalCount: false,
                          totalCount: [
                            'https://picsum.photos/200',
                            'https://picsum.photos/200'
                          ].length,
                          itemRadius: 32,
                          // Radius of each images
                          itemCount: 3,
                          // Maximum number of images to be shown in stack
                          itemBorderWidth: 3, // Border width around the images
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Levels'),
                        FlutterImageStack(
                          imageList: const [
                            'https://picsum.photos/200',
                            'https://picsum.photos/200',
                            'https://picsum.photos/200'
                          ],
                          showTotalCount: false,
                          totalCount: [
                            'https://picsum.photos/200',
                            'https://picsum.photos/200',
                            'https://picsum.photos/200'
                          ].length,
                          itemRadius: 32,
                          // Radius of each images
                          itemCount: 3,
                          // Maximum number of images to be shown in stack
                          itemBorderWidth: 3, // Border width around the images
                        )
                      ],
                    )),
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Due Date'),
                        Row(children: [
                          Icon(Icons.access_time_rounded,color: CrmColors.primary,),
                          SizedBox(width: 10,),
                          Text('Jan 3,2024')
                        ],)
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                OutBorderTextFormField(
                  hintText: 'Description',
                  hintStyle:
                      const TextStyle(fontSize: 14, color: CrmColors.paragraph),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Attachments',
                    style: TextStyle(color: CrmColors.paragraph, fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: DropZoneWidget(
                    text: const Text(
                      'Select or Drop File',
                      style: TextStyle(fontSize: 14, color: CrmColors.primary),
                    ),
                    icon: ImageWidget(
                      imageUrl: 'assets/crm/upload.svg',
                      width: 23,
                      height: 23,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget textFieldWidget(String hint, String svg) {
    return OutBorderTextFormField(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: CrmColors.paragraph),
        icon: Container(
          child: ImageWidget(
            imageUrl: 'assets/crm/$svg',
            width: 20,
            height: 20,
          ),
          margin: EdgeInsets.symmetric(horizontal: 5),
        ));
  }

  @override
  AddTaskViewModel viewModelBuilder(BuildContext context) {
    return AddTaskViewModel(context);
  }
}

class AddTaskViewModel extends BaseTableProvider {
  AddTaskViewModel(super.context);

  @override
  Future loadData(BuildContext context) {
    return Future.value({});
  }
}
