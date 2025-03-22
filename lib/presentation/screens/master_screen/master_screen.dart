import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuMasterWidget> listMaster = [
      MenuMasterWidget(
          title: "Master 1",
          description: "description",
          routeName: "null",
          icon: "icon"),
      MenuMasterWidget(
          title: "Master 2",
          description: "description",
          routeName: "null",
          icon: "icon"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Master"),
        centerTitle: true,
        backgroundColor: context.blue,
      ),
      body: ListView.builder(
        itemCount: listMaster.length,
        itemBuilder: (context, index) {
          MenuMasterWidget master = listMaster[index];
          return MenuMasterWidget(
            title: master.title,
            description: master.description,
            routeName: master.routeName,
            icon: master.icon,
          );
        },
      ),
    );
  }
}

class MenuMasterWidget extends StatelessWidget {
  final String title;
  final String description;
  final String routeName;
  final String icon;

  const MenuMasterWidget({
    super.key,
    required this.title,
    required this.description,
    required this.routeName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: Constants.cornerRadiusBox,
          color: Colors.grey.shade300,
        ),
        margin: Constants().getEdgeInsertList(context),
        height: MediaQuery.sizeOf(context).height / 5,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.sizeOf(context).width / 5,
              child: ClipOval(
                child: Image.asset(
                  Constants.allIcon,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 100 * 0.5,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 18, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextSizes.mediumTitle(context)),
                    Text(description,
                        style: AppTextSizes.smallDescription(context)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
