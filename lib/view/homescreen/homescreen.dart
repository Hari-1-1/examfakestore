// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fakestoreapi/controller/homescreencontroller.dart';
import 'package:fakestoreapi/view/cartscreen/cartscreen.dart';
import 'package:fakestoreapi/view/logoutscreen/logout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenProvider = Provider.of<HomeScreenController>(context);
    return Scaffold(appBar: AppBar(actions: [CircleAvatar(backgroundImage: AssetImage("assets/kylie.jpg"),)],),drawer: Drawer(child: ListView(children: [SizedBox(height: 40,),Container(height: 40,
      decoration: BoxDecoration(color: Colors.amber),child: Text("Category"),),SizedBox(height: 10,),InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
      },
        child: Container(height: 40,
        decoration: BoxDecoration(color: Colors.amber),child: Text("Cart"),),
      ),SizedBox(height: 10,),InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutScreen(),));
      },
        child: Container(height: 40,
        decoration: BoxDecoration(color: Colors.amber),child: Text("Logout"),),
      ),SizedBox(height: 10,)],),),
      body: ListView.separated(
        itemCount: homescreenProvider.productlist.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          homescreenProvider.productlist[index].image ?? "")),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            homescreenProvider.productlist[index].title ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          "\$${homescreenProvider.productlist[index].price ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(homescreenProvider.productlist[index].category ?? ""),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                        },
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.amber),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ), separatorBuilder: (context, index) => SizedBox(height: 10,),
      ),
    );
  }
}