import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider_package/provider/data_class.dart';
import 'package:provider_package/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.shopping_cart,
                    size: 35,
                  ),
                  Text(
                    "Shopping Cart",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.black,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<DataClass>(builder: (context, dataClass, child) {
                      return Text('${dataClass.x}',
                          style: TextStyle(fontSize: 30));
                    }),
                    const Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (Provider.of<DataClass>(context, listen: false).x <
                            5) {
                          Provider.of<DataClass>(context, listen: false)
                              .increment();
                        } else {
                          Get.snackbar('Item', 'Cannot add more',
                              backgroundColor: Colors.black,
                              titleText: const Text(
                                "Item",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              messageText: const Text(
                                'Cannot add more',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              duration: Duration(seconds: 1));
                        }
                      },
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SecondScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'NextPage',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
