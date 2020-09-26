
// void main() {
//   final data = {
//     "1-0002": {
//       "name": "red",
//       "hex": "FF0000"
//     },
//     "1-0001": {
//       "name": "blue",
//       "hex": "0000FF"
//     },
//     "1-0003": {
//       "name": "green",
//       "hex": "008000"
//     }
//   };
//   // Map<String, dynamic> decoded = json.decode(data);
//     for (var colour in data.keys) {
//       print(colour);                   // prints 1-0001
//       print(data[colour]['name']);  // prints red
//       print(data[colour]['hex']);   // prints FF0000
//     };
// }

  // (action.transactionsPage).forEach((element) {
  //       final formatedDate = Utils.dateFormater(element.createdAt);

  //       // element.createdAt = formatedDate.dateTime;
  //       // print(formatedDate['dateClass']);
  //       if ((transactions[formatedDate['dateClass']] == null))
  //         return (transactions[formatedDate['dateClass']] = [element]);
  //       return transactions[formatedDate['dateClass']].add(element);
  //     });