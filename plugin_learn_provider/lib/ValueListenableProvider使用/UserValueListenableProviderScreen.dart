import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserValueListenableProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      create: (context) => MyModel(),
      child: Consumer<MyModel>(
        builder: (context, myModel, child) {
          return ValueListenableProvider<int>.value(
            value: myModel.counter,
            child: Scaffold(
              appBar: AppBar(
                title: Text('provider'),
              ),
              body: Column(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var count = Provider.of<int>(context);
                      return Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          color: Colors.lightBlueAccent,
                          child: Text('当前是：$count'));
                    },
                  ),
                  Consumer<int>(
                    builder: (context, value, child) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        color: Colors.lightGreen,
                        child: Text(
                          '$value',
                        ),
                      );
                    },
                  ),
                  Consumer<MyModel>(
                    builder: (context, model, child) {
                      return FlatButton(
                          color: Colors.tealAccent,
                          onPressed: model.incrementCounter,
                          child: Icon(Icons.add));
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class MyModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    print(counter.value++);
    counter.value = counter.value;
  }
}
