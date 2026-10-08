import 'package:flutter/material.dart';
import 'package:weatherly/constants/datas.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/widgets/widgets_components/city_card_item.dart';
import 'package:weatherly/widgets/widgets_components/sliver_app_bar.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HeaderSliverAppBar(
              title: 'Manage cities',
              backgroundColor: const Color(0xFFE0F2FE),
              actionButton: HeaderSliverAppBarAction(
                UtilityIcons.locationEdit,
                () {},
              ),
            ),
          ];
        },

        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CityCardItem(
                    weather: mockWeatherList[0],
                    isCurrentLocation: true,
                    isEditMode: false,
                    isSelected: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
