import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline_uikit/components/forms/select_widget.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserSettingsPage extends CrmLayout {
  const UserSettingsPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'User Setting';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _infoCardWidget(context),
          flex: 2,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: _profileCardWidget(context),
          flex: 1,
        )
      ],
    );
  }

  _infoCardWidget(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal information',
            style: TextStyle(color: CrmColors.heading),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'General employee\'s information',
            style: TextStyle(color: CrmColors.paragraph, fontSize: 12),
          ),
          const SizedBox(
            height: 20,
          ),
          _infoDivider('General settings'),
          const SizedBox(
            height: 20,
          ),
          _dropField(
              'Language', ['English(US)', "Japanese(Japan)", "Chinese(China)"]),
          const SizedBox(
            height: 20,
          ),
          _dropField('Conutry', [
            '61000,Kharkiv,ULrain',
            '61001,Kharkiv,ULrain',
            '61002,Kharkiv,ULrain'
          ]),
          const SizedBox(
            height: 20,
          ),
          _textField('Phone number', '(217)555-0113'),
          const SizedBox(
            height: 20,
          ),
          _infoDivider('General settings'),
          const SizedBox(
            height: 20,
          ),
          _textField('User name', 'Jenny20'),
          const SizedBox(
            height: 20,
          ),
          _textField('User surname', 'Jenny Wilson'),
          const SizedBox(
            height: 20,
          ),
          _dropField('Gender', ['Female', "Male"]),
          const SizedBox(
            height: 20,
          ),
          _textField('Your bio', 'Add a short bio...', maxlines: 5),
          const SizedBox(
            height: 20,
          ),
          _textField('Email', 'jenny.wilson@example.com'),
          const SizedBox(
            height: 20,
          ),
          _dropField('Job', [
            "Flutter Developer",
            'Web Designer',
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 125,
                child: ButtonWidget(
                  btnText: 'Cancel',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  width: 125,
                  child: ButtonWidget(
                    btnText: 'Save',
                    type: ButtonType.primary.type,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  _infoDivider(String text) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: CrmColors.border,
        )),
        Text(
          text,
          style: const TextStyle(color: CrmColors.paragraph),
        ),
        const Expanded(
            child: Divider(
          color: CrmColors.border,
        )),
      ],
    );
  }

  _profileCardWidget(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          const Text('My profile picture'),
          const SizedBox(
            height: 10,
          ),
          const Text('Add a photo of you to be easily'),
          const ImageWidget(
            imageUrl: 'assets/crm/user-02.png',
            width: 160,
            height: 160,
            isCircle: true,
          ),
          SizedBox(
            width: 200,
            child: ButtonWidget(
              btnText: 'Upload a new photo',
              type: ButtonType.primary.type,
            ),
          )
        ],
      ),
    );
  }

  _dropField(String s, List<String> list) {
    return Row(
      children: [
        _leftContainer(text: s),
        Expanded(
            child: SelectWidget(
          selectionList: list,
          textStyle: const TextStyle(fontSize: 14, color: CrmColors.heading),
        ))
      ],
    );
  }

  _textField(String s, String initialValue, {int? maxlines = 1}) {
    return Row(
      children: [
        _leftContainer(text: s),
        Expanded(
            child: OutBorderTextFormField(
          initialValue: initialValue,
          maxLines: maxlines,
          textStyle: const TextStyle(fontSize: 14, color: CrmColors.heading),
        ))
      ],
    );
  }

  _leftContainer({required String text}) {
    return SizedBox(
      width: 250,
      child: Text(
        text,
        style: const TextStyle(color: CrmColors.paragraph),
      ),
    );
  }
}
