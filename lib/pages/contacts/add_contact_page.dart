import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/forms/drop_zone_widget.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/components/modal/modal_dialog.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddContactPage extends BaseStlessWidget<AddContactViewModel> {
  AddContactPage({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, AddContactViewModel viewModel, Widget? child) {
    return ButtonWidget(
      btnText: 'Add Contact +',
      type: ButtonType.primary.type,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: 'Add Contact',
            titleAlign: Alignment.centerLeft,
            showTitle: true,
            modalType: ModalType.medium,
            showCancel: false,
            width: 600,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: textFieldWidget('First Name', 'first_name.svg')),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: textFieldWidget('Last Name', 'first_name.svg'))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                textFieldWidget('Primary Email', 'email.svg'),
                const SizedBox(
                  height: 12,
                ),
                textFieldWidget('Phone Number', 'tel.svg'),
                const SizedBox(
                  height: 12,
                ),
                textFieldWidget('Location', 'location.svg'),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: textFieldWidget(
                            'Add Home Email Address', 'home_address.svg')),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: textFieldWidget(
                            'Add Workd Email Address', 'email.svg'))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Add A Photo Of Business Logo Of Your Contact',style: TextStyle(color: CrmColors.paragraph,fontSize: 12),),
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
                    icon: const ImageWidget(
                      imageUrl: 'assets/crm/upload.svg',
                      width: 23,
                      height: 23,
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
  AddContactViewModel viewModelBuilder(BuildContext context) {
    return AddContactViewModel(context);
  }
}

class AddContactViewModel extends BaseTableProvider {
  AddContactViewModel(super.context);

  @override
  Future loadData(BuildContext context) {
    return Future.value({});
  }
}
