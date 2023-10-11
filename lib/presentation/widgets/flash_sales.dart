import 'package:es_magico/common/assets.dart';
import 'package:flutter/material.dart';

class FlashSales extends StatefulWidget {
  const FlashSales({super.key});

  @override
  State<FlashSales> createState() => _FlashSalesState();
}

class _FlashSalesState extends State<FlashSales>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 400,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 350,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(ProjectAssets.flashSaleImg),
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 350,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(ProjectAssets.flashSaleImg),
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabPageSelector(
              controller: _tabController,
              selectedColor: const Color(0xffEE3175),
            ),
          ),
        ],
      ),
    ));
  }
}
