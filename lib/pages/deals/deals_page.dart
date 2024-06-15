import 'package:faker/faker.dart';
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/deals/add_deals_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DealsPage extends CrmLayout {
  const DealsPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Deals';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    // TODO: implement rightContentWidget
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: AddDealsWidget(),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return DealsPageView();
  }
}

class DealsPageView extends BaseStlessWidget<DealsViewModel> {
  DealsPageView({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, DealsViewModel viewModel, Widget? child) {
    var faker = new Faker();

    return Wrap(
      runSpacing: 20,
      spacing: 32,
      children: [
        _columnWidget(
            context,
            viewModel,
            'Next',
            'next',
            CrmColors.primary,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Prospect',
            'prospect',
            CrmColors.sky,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Proposal',
            'proposal',
            CrmColors.orange,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Won',
            'won',
            CrmColors.green,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
      ],
    );
  }

  @override
  DealsViewModel viewModelBuilder(BuildContext context) {
    return DealsViewModel(context);
  }

  _columnWidget(BuildContext context, DealsViewModel viewModel, String title,
      String type, Color tagColor, List<dynamic> list) {
    return SizedBox(
      width: 300,
      height: 800,
      child: Column(
        children: [
          CommonCard(
            height: 60,
            child: Row(
              children: [
                Expanded(child: Text(title)),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '5',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  decoration: BoxDecoration(
                      color: tagColor, borderRadius: BorderRadius.circular(4)),
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (ctx, index) {
              return itemBuilder(ctx, index, list.elementAt(index));
            },
            itemCount: list.length,
            separatorBuilder: separatorBuilder,
          ))
        ],
      ),
    );
  }

  itemBuilder(BuildContext ctx, int index, element) {
    return CommonCard(
      width: 300,
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              ImageWidget(
                imageUrl: element['image'],
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text(element['title']))
            ],
          ),
          Divider(
            color: CrmColors.border,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Value',
                style: TextStyle(fontSize: 12, color: CrmColors.paragraph),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(element['value'] ?? '',
                      style: TextStyle(fontSize: 12)))
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text('Probability',
                  style: TextStyle(fontSize: 12, color: CrmColors.paragraph)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(element['pro'] ?? '',
                      style: TextStyle(fontSize: 12)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 18, color: CrmColors.paragraph),
              SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Text(element['days'],
                      style:
                          TextStyle(fontSize: 12, color: CrmColors.paragraph)))
            ],
          )
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Divider(
      height: 20,
      color: Colors.transparent,
    );
  }
}

class DealsViewModel extends BaseProvider {
  DealsViewModel(super.context);
}
