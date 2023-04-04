import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exhibitly_with_flutter/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

// class SearchProducts extends StatelessWidget {
//   const SearchProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: ColorManager.KSecondaryColor,
//       width: 100,
//       height: 50,
//       child: SafeArea(child: Column(
//         children: [ Container(
//           color: ColorManager.KSecondaryColor,
//           child: TextFormField(
//             decoration: const InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               hintText: 'Search Here ...',
//               hintStyle: TextStyle(color: Colors.grey),suffixIcon: Icon(Icons.search)
//             ),
//           ),
//         )],
//       )),

//     );
//   }
// }

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    inputText = val;
                    print(inputText);
                  });
                },
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .where("product-name",
                              isGreaterThanOrEqualTo: inputText)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(data['product-name']),
                                leading: Image.network(data['product-img'][0]),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}