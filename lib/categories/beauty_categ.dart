import 'package:flutter/material.dart';
import 'package:multi_score/utilities/categ_list.dart';
import 'package:multi_score/widgets/categ_widgets.dart';
/*List<String> imagetry = [
  'images/try/image0.png',
  'images/try/image1.png',
  'images/try/image2.png',
  'images/try/image3.png',
];*/

/*List<String> labeltry = [
  'Shirt',
  'Jeans',
  'Shoes',
  'Jacket',
];*/

class BeautyCategory extends StatelessWidget {
  const BeautyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(
                    headerLabel: 'Beauty',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 3,
                      crossAxisCount: 2,
                      children: List.generate(beauty.length, (index) {
                        return SubCategModel(
                          mainCategName: 'beauty',
                          subCategName: beauty[index],
                          assetName: 'images/beauty/beauty$index.jpg',
                          subcategLabel: beauty[index],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              maincategName: 'beauty',
            ),
          ),
        ],
      ),
    );
  }
}
