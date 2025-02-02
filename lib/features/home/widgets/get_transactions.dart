  import 'package:cloud_firestore/cloud_firestore.dart';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches all transactions for a given user id from Firestore.
  ///
  /// The method returns a list of maps. Each map contains a transaction's id,
  /// name, price, and date. The list is empty if there are no transactions.
  ///
  /// The method throws a [FirebaseException] if it fails to fetch the
  /// transactions.
/******  fb100105-0354-4bea-9774-58f1de66cd84  *******/
Future<List<Map<String, dynamic>>> getTransactions(String userId) async {
    List<Map<String, dynamic>> transactions = [];

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('transactions')
          .doc(userId)
          .collection('transactions')
          .get();

      for (var doc in querySnapshot.docs) {
        transactions.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print(e.toString());
    }

    return transactions;
  }
