import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/items.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';
import 'package:flutter_airbnb_ui/widgets/listing_item.dart';
import 'package:flutter_airbnb_ui/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SearchField(),
            Expanded(
              child: ListView.builder(
                itemCount: listings.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) => ListingItem(
                  listing: listings[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
