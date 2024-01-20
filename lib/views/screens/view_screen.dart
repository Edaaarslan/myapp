import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using Get package
import 'package:myapp/controller/helper_classes/firebase_firestore_helper.dart';
import '../../models/product_model.dart';
import '../../models/resources.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  int id = 0;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'favouriteScreen');
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(width: 50),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'homePage');
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        leadingWidth: 40,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
          child: SizedBox(
            height: screenHeight * 0.07,
            width: screenWidth * 0.8,
            child: TextFormField(
              onTap: () {
                setState(() {
                  isOn = true;
                });
              },
              showCursor: isOn,
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(10),
                fillColor: (Get.isDarkMode)
                    ? Colors.grey.shade700
                    : Colors.grey.shade200,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.05),
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.05),
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
            ),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: (Get.isDarkMode) ? Colors.grey.shade800 : Colors.white12,
        elevation: 0,
        bottomOpacity: 0.0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'category',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: viewCategory.map(
                        (e) => Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        top: screenHeight * 0.01,
                        bottom: screenHeight * 0.01,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(
                              (id == viewCategory.indexOf(e)) ? 6 : 0),
                          backgroundColor: MaterialStateProperty.all(
                            (id == viewCategory.indexOf(e))
                                ? Colors.blueGrey
                                : (Get.isDarkMode)
                                ? Colors.grey.shade700
                                : Colors.grey.shade200,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            id = viewCategory.indexOf(e);
                            isOn = false;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(
                              (e['id'] == 1) ? screenHeight * 0.005 : 13.0),
                          child: Row(
                            children: [
                              Text(
                                e['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.03,
                                  color: (id == viewCategory.indexOf(e))
                                      ? Colors.white
                                      : (Get.isDarkMode)
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: (id == 0)
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: GridView.builder(
                itemCount: AllProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: screenWidth / screenHeight * 1.0,
                  crossAxisSpacing: screenWidth * 0.20,
                  mainAxisSpacing: screenHeight * 0.20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('DetailPage',
                            arguments: AllProducts[i]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (Get.isDarkMode)
                              ? Colors.grey.shade800
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: (Get.isDarkMode)
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade200,
                              offset: Offset(1, 2),
                              blurRadius: screenHeight * 0.01,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            screenHeight * 0.02,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                              width: screenWidth * 0.09,
                              child: Hero(
                                tag: AllProducts[i].name,
                                child: Image.asset(
                                  AllProducts[i].image,
                                  semanticLabel: AllProducts[i].name,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              AllProducts[i].name,
                              style: TextStyle(
                                fontSize: screenHeight * 0.010,
                                fontWeight: FontWeight.w800,
                                color: (Get.isDarkMode)
                                    ? Colors.white
                                    : Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.0,
                            ),
                            Text(
                              AllProducts[i].category,
                              style: TextStyle(
                                fontSize: screenHeight * 0.012,
                                fontWeight: FontWeight.bold,
                                color: (Get.isDarkMode)
                                    ? Colors.white70
                                    : Colors.grey.shade500,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    'TL',
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.012,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey.shade500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                Text(
                                  AllProducts[i].price.toString(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.012,
                                    fontWeight: FontWeight.w900,
                                    color: (Get.isDarkMode)
                                        ? Colors.white
                                        : Colors.grey.shade800,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.010,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Spacer(),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                      Colors.blueGrey.shade500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        'DetailPage',
                                        arguments: AllProducts[i]);
                                  },
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                StreamBuilder(
                                  stream: FireBaseStoreHelper.db
                                      .collection("product")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.golf_course,
                                        ),
                                      );
                                    } else if (snapshot.hasData) {
                                      QuerySnapshot<Map<String, dynamic>>?
                                      favourite = snapshot.data;
                                      List<QueryDocumentSnapshot<
                                          Map<String, dynamic>>>
                                      allFav = favourite!.docs;

                                      int check = 0;
                                      allFav.forEach((e) {
                                        if (e['name'] ==
                                            AllProducts[i].name) {
                                          check = 1;
                                        }
                                      });

                                      if (check == 0) {
                                        return IconButton(
                                          onPressed: () {
                                            products e = AllProducts[i];
                                            Map<String, dynamic> temp = {
                                              'id': e.id,
                                              'name': e.name,
                                              'category': e.category,
                                              'description':
                                              e.description,
                                              'image': e.image,
                                              'quantity': e.quantity,
                                              'price': e.price,
                                            };
                                            FireBaseStoreHelper
                                                .fireBaseStoreHelper
                                                .insert(
                                              data: temp,
                                            );
                                          },
                                          icon: Icon(Icons
                                              .favorite_border_rounded),
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            products f = AllProducts[i];
                                            Map<String, dynamic> temp = {
                                              'id': f.id,
                                              'name': f.name,
                                              'category': f.category,
                                              'description':
                                              f.description,
                                              'image': f.image,
                                              'quantity': f.quantity,
                                              'price': f.price,
                                            };
                                            late int Uid;
                                            allFav.forEach((e) {
                                              if (e['name'] == f.name) {
                                                Uid = e['Uid'];
                                              }
                                            });
                                            FireBaseStoreHelper
                                                .fireBaseStoreHelper
                                                .Delete(Uid: Uid);
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                    return Container();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
                : RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  // Refresh your data here
                });
              },
              child: ListView.builder(
                itemCount: AllProducts.length,
                padding: EdgeInsets.all(screenHeight * 0.01),
                itemBuilder: (context, i) {
                  return (AllProducts[i].id == id)
                      ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          'DetailPage',
                          arguments: AllProducts[i],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(screenHeight * 0.006),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: (Get.isDarkMode)
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade200,
                              offset: Offset(1, 2),
                              blurRadius: screenHeight * 0.008,
                            )
                          ],
                          borderRadius:
                          BorderRadius.circular(screenHeight * 0.03),
                          color: (Get.isDarkMode)
                              ? Colors.grey.shade800
                              : Colors.white,
                        ),
                        height: screenHeight * 0.12,
                        width: screenWidth,
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: Transform.scale(
                            scale: 1.6,
                            child: Hero(
                              tag: AllProducts[i].name,
                              child: Image.asset(
                                AllProducts[i].image,
                              ),
                            ),
                          ),
                          isThreeLine: true,
                          title: Padding(
                            padding: EdgeInsets.only(
                                left: screenHeight * 0.02,
                                top: screenHeight * 0.008),
                            child: Text(
                              AllProducts[i].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                fontSize: screenHeight * 0.022,
                              ),
                            ),
                          ),


                          subtitle: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.004,
                                      horizontal: screenHeight * 0.01),
                                  child: Text(
                                    AllProducts[i].category,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2,
                                      fontSize: screenHeight * 0.016,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  autofocus: false,
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                      Colors.blueGrey.shade500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        'DetailPage',
                                        arguments: AllProducts[i]);
                                  },
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('⭐️ 5.4'),
                                Text('⏰ 5-10 min'),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
