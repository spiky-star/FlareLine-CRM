import 'package:faker/faker.dart' as faker;
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/task/add_task_widget.dart';
import 'package:flareline_crm/pages/task/task_state.dart';
import 'package:flareline_crm/pages/task/task_viewmodel.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_stless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class TasksPage extends CrmLayout {
  const TasksPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Task';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    // TODO: implement rightContentWidget
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: AddTaskWidget(),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return TaskPageView();
  }
}

class TaskPageView extends BlocBaseStlessWidget<TaskViewModel, TaskState> {
  TaskPageView({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, TaskViewModel viewModel, TaskState state) {
    var faker = faker.Faker();

    return Wrap(
      runSpacing: 20,
      spacing: 32,
      children: [
        _columnWidget(
            context,
            viewModel,
            'To Do',
            'todo',
            CrmColors.sky,
            List.generate(20, (i) {
              return {
                "image": 'assets/crm/task1.svg',
                "name": faker.internet.userName(),
                "task": faker.job.title(),
                "days": faker.date.month(),
                "users": [
                  'https://picsum.photos/200?id=${faker.guid.guid()}',
                  'https://picsum.photos/200?id=${faker.guid.guid()}'
                ]
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'In Progress',
            'inprogress',
            CrmColors.orange,
            List.generate(20, (i) {
              return {
                "image": 'assets/crm/task1.svg',
                "name": faker.internet.userName(),
                "task": faker.job.title(),
                "days": faker.date.month(),
                "users": [
                  'https://picsum.photos/200?id=${faker.guid.guid()}',
                  'https://picsum.photos/200?id=${faker.guid.guid()}'
                ]
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Need Review',
            'needreview',
            CrmColors.red,
            List.generate(20, (i) {
              return {
                "image": 'assets/crm/task1.svg',
                "name": faker.internet.userName(),
                "task": faker.job.title(),
                "days": faker.date.month(),
                "users": [
                  'https://picsum.photos/200?id=${faker.guid.guid()}',
                  'https://picsum.photos/200?id=${faker.guid.guid()}'
                ]
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Done',
            'done',
            CrmColors.primary,
            List.generate(20, (i) {
              return {
                "image": 'assets/crm/task1.svg',
                "name": faker.internet.userName(),
                "task": faker.job.title(),
                "days": faker.date.month(),
                "users": [
                  'https://picsum.photos/200?id=${faker.guid.guid()}',
                  'https://picsum.photos/200?id=${faker.guid.guid()}'
                ]
              };
            })),
      ],
    );
  }

  @override
  TaskViewModel viewModelBuilder(BuildContext context) {
    return TaskViewModel(context);
  }

  _columnWidget(BuildContext context, TaskViewModel viewModel, String title,
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
                  decoration: BoxDecoration(
                      color: tagColor, borderRadius: BorderRadius.circular(4)),
                  width: 24,
                  height: 24,
                  child: const Text(
                    '5',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (ctx, index) {
              return itemBuilder(ctx, index, list.elementAt(index), tagColor);
            },
            itemCount: list.length,
            separatorBuilder: separatorBuilder,
          ))
        ],
      ),
    );
  }

  itemBuilder(BuildContext ctx, int index, element, Color tagColor) {

    return CommonCard(
      width: 300,
      height: 215,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: tagColor.withOpacity(0.26), // 阴影颜色，透明度50%
                      offset: const Offset(0, 6), // 阴影偏移量
                      blurRadius: 12.0, // 阴影模糊半径
                      spreadRadius: 0.0, // 阴影扩散半径
                    ),
                  ],
                ),
                child: ImageWidget(
                  imageUrl: element['image'],
                  width: 24,
                  height: 24,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: CrmColors.paragraph,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '[${element['name']} ${element['task']}]',
            style: const TextStyle(color: CrmColors.heading),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Color(0xFFF6FFF5)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time_outlined,
                        size: 18, color: CrmColors.green),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(element['days'],
                        style: const TextStyle(
                            fontSize: 12, color: CrmColors.green))
                  ],
                ),
              ),
              Spacer(),
              // Row(
              //   children: usersAvatar,
              // )
              FlutterImageStack(
                imageList: element['users'] ?? [],
                showTotalCount: false,
                totalCount: (element['users'] ?? []).length,
                itemRadius: 32,
                // Radius of each images
                itemCount: 3,
                // Maximum number of images to be shown in stack
                itemBorderWidth: 3, // Border width around the images
              )
            ],
          )
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(
      height: 20,
      color: Colors.transparent,
    );
  }
}

