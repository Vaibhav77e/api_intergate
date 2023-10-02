import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/api_response.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final controllerData = Provider.of<ApiResponse>(context);
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: controllerData.getData(),
            builder: (context, snapshot) {
              final prod = snapshot.data;
              if (snapshot.hasError) {
                return Text('someting went wrong');
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: prod!.length,
                    itemBuilder: (context, i) {
                      final prodIndex = prod[i];
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180,
                              child: Image.network(
                                prodIndex.imageUrl,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    prodIndex.title,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Text('₹ ${prodIndex.price}'),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
              return const Text('could not load data');
            }));
  }
}
