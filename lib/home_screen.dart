import 'package:flutter/material.dart';
import 'package:food_pos_webapp/cart_item.dart';

import 'pizza_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // First Segment (Menu)
          LayoutBuilder(
            builder: (context, constraints) {
              double containerHeight = 70;
              return Container(
                width: 180.0,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                color: const Color(0xffF2F2F2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F2F2),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 27,
                            width: 121,
                          ),
                        ),
                      ),
                    ),
                    MenuItem(
                      iconImage: "assets/images/menu.png",
                      text: 'Cart',
                      subtitle: '2 open carts',
                      height: containerHeight,
                      color: const Color(0xffED5151),
                      subtileBackColor: const Color(0xffDE3B3B),
                      subtileTextColor: Colors.white,
                    ),
                    const SizedBox(height: 1),
                    const SizedBox(height: 1),
                    MenuItem(
                      iconImage: "assets/images/order.png",
                      text: 'Order',
                      subtitle: '23 open orders',
                      height: containerHeight,
                      color: Colors.white,
                      subtileBackColor: const Color(0xffF3F3F3),
                      subtileTextColor: const Color(0xff222B45),
                    ),
                    const SizedBox(height: 1),
                    MenuItem(
                      iconImage: "assets/images/tables.png",
                      text: 'Table',
                      subtitle: '9 free tables',
                      height: containerHeight,
                      color: Colors.white,
                      subtileBackColor: const Color(0xffF3F3F3),
                      subtileTextColor: const Color(0xff222B45),
                    ),
                    const SizedBox(height: 1),
                    MenuItem(
                      iconImage: "assets/images/reservation.png",
                      text: 'Reservation',
                      subtitle: '7 reservations today',
                      height: containerHeight,
                      color: Colors.white,
                      subtileBackColor: const Color(0xffF3F3F3),
                      subtileTextColor: const Color(0xff222B45),
                    ),
                    const Spacer(),
                    MenuItem(
                      iconImage: "assets/images/settings.png",
                      text: 'Settings',
                      subtitle: '5 members online',
                      height: containerHeight,
                      color: Colors.white,
                      subtileBackColor: const Color(0xffF3F3F3),
                      subtileTextColor: const Color(0xff222B45),
                    ),
                    // Add other menu items here...
                  ],
                ),
              );
            },
          ),
Container(
                width: 1000.0,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                color: const Color(0xffF3F3F3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Categories grid
                      CategoriesGrid(),
                    ],
                  ),
                ),
              ),
          // Other segments of your homepage go here
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     return Container(
          //       width: 1000.0,
          //       constraints: const BoxConstraints(maxHeight: double.infinity),
          //       color: const Color(0xffF3F3F3),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             // Categories grid
          //             CategoriesGrid(),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),

          // Second Segment (Categories)
          // Container(
          //   width: 1000.0,
          //   color: const Color(0xffF3F3F3),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: const [
          //         // Categories grid
          //         CategoriesGrid(),
          //       ],
          //     ),
          //   ),
          // ),

          // Expanded(
            // child:
            Container(
              color: Colors.white,

              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ThirdSegment(),
              ),
            ),
          //)
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     return Container(
          //       width: 420,
          //       color: Colors.white,
          //       constraints: const BoxConstraints(maxHeight: double.infinity),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             // Categories grid
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String iconImage;
  final String text;
  final String subtitle;
  final double height;
  final Color color;
  final Color subtileTextColor;
  final Color subtileBackColor;

  const MenuItem({
    Key? key,
    required this.iconImage,
    required this.text,
    required this.subtitle,
    required this.height,
    required this.color,
    required this.subtileTextColor,
    required this.subtileBackColor,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // When tapped, set isTapped to true to trigger the zoom-in effect
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (_) {
        // When the tap is released, set isTapped back to false to trigger the zoom-out effect
        setState(() {
          isTapped = false;
        });
      },
      onTapCancel: () {
        // If the tap is canceled, also set isTapped to false
        setState(() {
          isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
            milliseconds: 100), // Adjust the animation duration as needed
        height: widget.height,
        child: Transform.scale(
          scale: isTapped ? 0.97 : 1.0, // Increase scale when tapped

          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
            ),
            padding: const EdgeInsets.all(10.0), // Add padding for spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.iconImage,
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(width: 7.0),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.subtileTextColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.subtileBackColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Text(widget.subtitle,
                        style: TextStyle(
                            fontSize: 10.0, color: widget.subtileTextColor)),
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
///////

class CategoryItemWidget extends StatelessWidget {
  final CategoryItem category;

  const CategoryItemWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: category.height,
      width: category.width,
      decoration: BoxDecoration(
        color: category.color,
      ),
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.text,
            style: TextStyle(
              color: category.subtileTextColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7.0),
          Container(
            decoration: BoxDecoration(
              color: category.subtileBackColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Text(
                category.subtitle,
                style: TextStyle(
                  fontSize: 10.0,
                  color: category.subtileTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String text;
  final String subtitle;
  final double height;
  final double width;
  final Color color;
  final Color subtileTextColor;
  final Color subtileBackColor;

  CategoryItem({
    required this.text,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.color,
    required this.subtileTextColor,
    required this.subtileBackColor,
  });
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // List of category items

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Number of columns in the grid
                childAspectRatio:
                    156 / 60, // Aspect ratio (width / height) of each item
                crossAxisSpacing: 1, // Horizontal spacing between items
                mainAxisSpacing: 1, // Vertical spacing between items
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryItemWidget(category: category);
              },
            ),
          ),
          const SizedBox(height: 10.0), // Spacing between Categories and Pizza
          const Text(
            'Pizza',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              color: Color(0xffED5151),
            ),
          ),
          const SizedBox(height: 10.0), // Spacing below Pizza heading
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for the pizza grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Number of columns in the grid
                childAspectRatio:
                    155 / 159, // Aspect ratio (width / height) of each item
                crossAxisSpacing: 2, // Horizontal spacing between items
                mainAxisSpacing: 2, // Vertical spacing between items
              ),
              itemCount: pizzaList.length,
              itemBuilder: (context, index) {
                final pizza = pizzaList[index];
                return PizzaItem(
                  imageUrl: pizza.imageUrl,
                  price: pizza.price,
                  title: pizza.title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// List of pizza items
final List<PizzaItem> pizzaList = [
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  const PizzaItem(
    imageUrl: "assets/images/burger.png",
    price: 5.5,
    title: 'Burger Big Bug',
  ),
  // Add more pizza items as needed...
];

final List<CategoryItem> categories = [
  CategoryItem(
    text: 'All',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: const Color(0xffED5151),
    subtileBackColor: const Color(0xffDE3B3B),
    subtileTextColor: Colors.white,
  ),
  CategoryItem(
    text: 'Pizza ',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Burger',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Softdrinks',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Beer',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Beer',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Veggie',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Veggie',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Veggie',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Veggie',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
  CategoryItem(
    text: 'Veggie',
    subtitle: '12 items',
    height: 60.0,
    width: 156.0,
    color: Colors.white,
    subtileBackColor: const Color(0xffF3F3F3),
    subtileTextColor: const Color(0xff222B45),
  ),
];
