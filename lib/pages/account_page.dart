import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget ordersVouchersItem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget itemTappedTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Platform.isAndroid
        ? ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: isLandScape ? size.height * 0.13 : size.height * 0.04,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: isLandScape ? size.height * 0.07 : size.height * 0.022,
            ),
          ),
          onTap: () {
            debugPrint("$title clicked");
          },
          subtitle:
              subtitle != null
                  ? Text(
                    subtitle,
                    style: TextStyle(
                      fontSize:
                          isLandScape
                              ? size.height * 0.05
                              : size.height * 0.019,
                    ),
                  )
                  : null,
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryColor,
            size: isLandScape ? size.height * 0.1 : size.height * 0.03,
          ),
        )
        : CupertinoListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: isLandScape ? size.height * 0.13 : size.height * 0.04,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: isLandScape ? size.height * 0.07 : size.height * 0.022,
            ),
          ),
          onTap: () {
            debugPrint("$title clicked");
          },
          subtitle:
              subtitle != null
                  ? Text(
                    subtitle,
                    style: TextStyle(
                      fontSize:
                          isLandScape
                              ? size.height * 0.05
                              : size.height * 0.019,
                    ),
                  )
                  : null,
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryColor,
            size: isLandScape ? size.height * 0.1 : size.height * 0.03,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Platform.isAndroid ? SingleChildScrollView(
        child: Column(
          children: [
            if (!isLandScape) ...[
              CircleAvatar(
                radius: isLandScape ? size.height * 0.22 : size.height * 0.1,
                foregroundImage: AssetImage("assets/images/photographer.jpg"),
              ),
              SizedBox(height: 30),
              Text(
                "khaled",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ordersVouchersItem(context, name: "Orders", number: 50),
                  ordersVouchersItem(context, name: "Vouchers", number: 10),
                ],
              ),
            ],
            if (isLandScape) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius:
                              isLandScape
                                  ? size.height * 0.22
                                  : size.height * 0.1,
                          foregroundImage: AssetImage(
                            "assets/images/photographer.jpg",
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        "khaled",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ordersVouchersItem(
                            context,
                            name: "Orders",
                            number: 50,
                          ),
                          const SizedBox(width: 30),
                          ordersVouchersItem(
                            context,
                            name: "Vouchers",
                            number: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
            const SizedBox(height: 30),
            Divider(thickness: 2, indent: 20, endIndent: 20),
            itemTappedTile(
              context,
              icon: Icons.shopping_cart,
              title: "Past orders",
              subtitle: "Here you find your past orders",
            ),
            Divider(thickness: 2, indent: 20, endIndent: 20),
            itemTappedTile(
              context,
              icon: Icons.card_giftcard,
              title: "Available Vouchers",
            ),
          ],
        ),
      ):CupertinoListSection(
        children: [
          Column(
            children: [
              if (!isLandScape) ...[
                CircleAvatar(
                  radius: isLandScape ? size.height * 0.22 : size.height * 0.1,
                  foregroundImage: AssetImage("assets/images/photographer.jpg"),
                ),
                SizedBox(height: 30),
                Text(
                  "khaled",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ordersVouchersItem(context, name: "Orders", number: 50),
                    ordersVouchersItem(context, name: "Vouchers", number: 10),
                  ],
                ),
              ],
              if (isLandScape) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            radius:
                            isLandScape
                                ? size.height * 0.22
                                : size.height * 0.1,
                            foregroundImage: AssetImage(
                              "assets/images/photographer.jpg",
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          "khaled",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ordersVouchersItem(
                              context,
                              name: "Orders",
                              number: 50,
                            ),
                            const SizedBox(width: 30),
                            ordersVouchersItem(
                              context,
                              name: "Vouchers",
                              number: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 30),
              Divider(thickness: 2, indent: 20, endIndent: 20),
              itemTappedTile(
                context,
                icon: Icons.shopping_cart,
                title: "Past orders",
                subtitle: "Here you find your past orders",
              ),
              Divider(thickness: 2, indent: 20, endIndent: 20),
              itemTappedTile(
                context,
                icon: Icons.card_giftcard,
                title: "Available Vouchers",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
