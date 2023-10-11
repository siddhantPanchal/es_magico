import 'package:es_magico/common/assets.dart';
import 'package:es_magico/presentation/widgets/flash_sales.dart';
import 'package:es_magico/presentation/widgets/product_category_widget.dart';
import 'package:es_magico/presentation/widgets/story_preview.dart';
import 'package:es_magico/repository/product_categories.dart';
import 'package:es_magico/repository/stories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Row(
                  children: [
                    Image.asset(ProjectAssets.plamImg),
                    const SizedBox(
                      height: 15,
                      child: VerticalDivider(thickness: 2),
                    ),
                    Image.asset(ProjectAssets.buffImg),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    onPressed: () {},
                  ),
                  Badge(
                    offset: const Offset(1, -1),
                    label: const Text("2"),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ];
          },
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "hi plumster!",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              _storyPreviews(),
              const FlashSales(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              _productCatagories(),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _storyPreviews() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    StoryPreview(story: stories[index]),
                  ],
                );
              }
              if (index == stories.length - 1) {
                return Row(
                  children: [
                    StoryPreview(story: stories[index]),
                    const SizedBox(width: 10),
                  ],
                );
              }
              return StoryPreview(story: stories[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _productCatagories() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: productCategories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    ProductCategoryWidget(category: productCategories[index]),
                  ],
                );
              }
              if (index == stories.length - 1) {
                return Row(
                  children: [
                    ProductCategoryWidget(category: productCategories[index]),
                    const SizedBox(width: 10),
                  ],
                );
              }
              return ProductCategoryWidget(category: productCategories[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ),
    );
  }
}
