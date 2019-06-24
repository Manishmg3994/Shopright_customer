import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
class 
Testing extends StatelessWidget {
// String buildx;
//     Testing({Key key,  this.buildx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<States>(buildx);

// print(buildx);
    return Scaffold(
      
  body:  Center(

   child: new Column(

      children: <Widget>[
 ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text(
                  model.counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ), ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return RaisedButton(

onPressed: model.increment,

                );
                
              },
            ),

      ],
    )
   
      ),  
    );
  }
}
