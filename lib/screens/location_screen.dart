import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weatherly/constants/datas.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/widgets/add_city_modal_sheet.dart';
import 'package:weatherly/widgets/city_card_item.dart';
import 'package:weatherly/widgets/sliver_app_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isEditMode = false;
  final Set<String> selectCityNames = {};

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
      if (!isEditMode) {
        selectCityNames.clear();
      }
    });
  }

  void _showAddCityModal(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      bounce: true,
      builder: (context) => AddCityModalSheet(),
    );
  }

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
                isEditMode ? UtilityIcons.circleX : UtilityIcons.locationEdit,
                () => _toggleEditMode(),
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
