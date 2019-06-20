// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:flutter/material.dart';





// class Testing extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
 
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//      body:new FirstPage()
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => new _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   List<String> added = [];
//   String currentText = "";
//   GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

//   _FirstPageState() {
//     textField = SimpleAutoCompleteTextField(
//       key: key,
//       suggestions: suggestions,
//       textChanged: (text) => currentText = text,
//       textSubmitted: (text) => setState(() {
//             added.add(text);
//           }),
//     );
//   }

//   List<String> suggestions = [
//     "Apple",
//     "Armidillo",
//     "Actual",
//     "Actuary",
//     "America",
//     "Argentina",
//     "Australia",
//     "Antarctica",
//     "Blueberry",
//     "Cheese",
//     "Danish",
//     "Eclair",
//     "Fudge",
//     "Granola",
//     "Hazelnut",
//     "Ice Cream",
//     "Jely",
//     "Kiwi Fruit",
//     "Lamb",
//     "Macadamia",
//     "Nachos",
//     "Oatmeal",
//     "Palm Oil",
//     "Quail",
//     "Rabbit",
//     "Salad",
//     "T-Bone Steak",
//     "Urid Dal",
//     "Vanilla",
//     "Waffles",
//     "Yam",
//     "Zest"
//   ];

//   SimpleAutoCompleteTextField textField;

//   @override
//   Widget build(BuildContext context) {
//     Column body = new Column(children: [
//       new ListTile(
//           title: textField,
//           trailing: new IconButton(
//               icon: new Icon(Icons.add),
//               onPressed: () {
//                 setState(() {
//                   if (currentText != "") {
//                     added.add(currentText);
//                     textField.clear();
//                     currentText = "";
//                   }
//                 });
//               }))
//     ]);

//     body.children.addAll(added.map((item) {
//       return new ListTile(title: new Text('item'));
//     }));

//     return new Scaffold(
//         resizeToAvoidBottomPadding: false,
//         appBar: new AppBar(
//             title: new Text('AutoComplete TextField Demo Simple'),
//         ),
//         body: body);
//   }
// }

import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';

// import './components.dart';

class SearchView {
  final _names =  [
    "New Potato - Onion - Tomato (Hybrid)",
    "Safeda Mango",
    "Cucumber",
    "Large Round Brinjal (Bharta)",
    "Kiwi - Imported",
    "Green Chilli",
    "Fresh Beans",
    "Bitter Gaurd (Karela)"
  ];

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
      settings: new RouteSettings(
        name: 'material_search',
        isInitialRoute: false,
      ),
      builder: (BuildContext context) {
        return new Material(
          child: new MaterialSearch<String>(
            placeholder: 'Search for products',
            results: _names.map((String v) => new MaterialSearchResult<String>(
              // icon: Icons.person,
              value: v,
              text: v,
            )).toList(),
            filter: (dynamic value, String criteria) {
              return value.toLowerCase().trim()
                .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
            },
            onSelect: (dynamic value) => Navigator.of(context).pop(value),
            onSubmit: (String value) => Navigator.of(context).pop(value),
          ),
        );
      }
    );
  }

  showMaterialSearch(BuildContext context) {
    Navigator.of(context)
      .push(_buildMaterialSearchPage(context))
      .then((dynamic value) {
        print(value);
        if (value != null) {
          // dialog(context, "search select");
        }
      });
  }
}
