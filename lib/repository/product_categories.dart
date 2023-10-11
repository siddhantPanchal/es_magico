import 'dart:ui';

import 'package:es_magico/common/assets.dart';
import 'package:es_magico/models/product_category.dart';

final productCategories = [
  ProductCategory(
    name: "skincare",
    image: ProjectAssets.skinCareImg,
    color: const Color(0xffe5edce),
  ),
  ProductCategory(
    name: "haircare",
    image: ProjectAssets.hairCareImg,
    color: const Color(0xffD7F0F0),
  ),
  ProductCategory(
    name: "bodycare",
    image: ProjectAssets.bodyCareImg,
    color: const Color(0xffE3CAEF),
  ),
  ProductCategory(
    name: "makeup",
    image: ProjectAssets.makeupImg,
    color: const Color(0xffD9B8AA),
  ),
  ProductCategory(
    name: "fragrance",
    image: ProjectAssets.fragranceImg,
    color: const Color(0xffCEEDE2),
  ),
  ProductCategory(
    name: "phy (for guy)",
    image: ProjectAssets.phyGuyImg,
    color: const Color(0xffC7D2F9),
  ),
  ProductCategory(
    name: "baby plum",
    image: ProjectAssets.babyPlumImg,
    color: const Color(0xffFFBAE8),
  ),
  ProductCategory(
    name: "gifting",
    image: ProjectAssets.giftingImg,
    color: const Color(0xffF1E5B3),
  ),
];
