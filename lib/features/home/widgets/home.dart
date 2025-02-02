import 'package:flutter/material.dart';
import 'package:sarfah/features/home/widgets/add_transaction_screen.dart';
import 'package:sarfah/features/home/widgets/balance_widget.dart';
import 'package:sarfah/features/home/widgets/expense_tile_widget.dart';
import 'package:sarfah/features/home/widgets/my_app_bar.dart';
import 'package:sarfah/features/home/widgets/my_menu.dart';
import 'package:sarfah/features/home/widgets/percents_widget.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/networking/firebase_helper.dart';
import '../../../core/theming/fonts.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const MyMenu(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                verticalSpace(10),
                const MyAppBar(),
                verticalSpace(10),
                const BalanceWidget(),
                verticalSpace(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Transactions",
                    style: FontHelper.font18BoldWhite,
                  ),
                ),
                verticalSpace(20),
                const PercentsWidget(),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions",
                      style: FontHelper.font18BoldWhite,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddTransaction()));
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: StreamBuilder(
                      stream: FirebaseHelper().getTransactions(
                        FirebaseHelper().getCurrentUser()?.uid ?? '',
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: FontHelper.font18BoldWhite,
                            ),
                          );
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: Text(
                              'No transactions found',
                              style: FontHelper.font18BoldWhite,
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final transaction = snapshot.data!.docs[index]
                                .data() as Map<String, dynamic>;
                            return ExpenseTileWidget(
                              name: transaction['name'] ?? '',
                              price: transaction['price'] ?? '',
                              date: transaction['date'] ?? '',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
