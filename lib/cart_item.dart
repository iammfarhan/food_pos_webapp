import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String text;
  final String subtitle;
  final double height;
  final Color color;
  final Color subtileTextColor;
  final Color subtileBackColor;

  const CartItem({
    Key? key,
    required this.text,
    required this.subtitle,
    required this.height,
    required this.color,
    required this.subtileTextColor,
    required this.subtileBackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 100.0, // Fixed width for each cart item
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: subtileTextColor,
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5.0), // Spacing between text and subtitle
            Container(
              decoration: BoxDecoration(
                color: subtileBackColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: subtileTextColor,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////
///
class ThirdSegment extends StatelessWidget {
  const ThirdSegment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.0, // Adjust the height as needed
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cartsList.length,
                itemBuilder: (context, index) {
                  final cart = cartsList[index];
                  return CartItem(
                    text: cart.text,
                    subtitle: cart.subtitle,
                    height: cart.height,
                    color: cart.color,
                    subtileTextColor: cart.subtileTextColor,
                    subtileBackColor: cart.subtileBackColor,
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Product",
                        style: TextStyle(
                          color: Color(0xff222B45),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Color(0xff222B45),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 2,
                    color: Color(0xffF5F5F5),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Burger Big Bug",
                        style: TextStyle(
                          color: Color(0xff222B45),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "36.00£",
                        style: TextStyle(
                          color: Color(0xff222B45),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Big-24cm",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff222B45),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: const Text(
                          "Ketchup (+0.22 €)",
                          style: TextStyle(
                            color: Color(0xff222B45),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: const Text(
                          "Salt (+0.22 €)",
                          style: TextStyle(
                            color: Color(0xff222B45),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  CounterWidget(
                    // Add the CounterWidget here
                    initialValue:
                        0, // Initialize with the desired initial value
                    onChanged: (value) {
                      // Handle quantity changes here
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 2,
                    color: Color(0xffF5F5F5),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Delivery Option",
                    style: TextStyle(
                      color: Color(0xff222B45),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const OptionsRow(),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 2,
                    color: Color(0xffF5F5F5),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Discount",
                    style: TextStyle(
                      color: Color(0xff222B45),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DiscountRow(),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 2,
                    color: Color(0xffF5F5F5),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Table",
                    style: TextStyle(
                      color: Color(0xff222B45),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TableRow(),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 2,
                    color: Color(0xffF5F5F5),
                  ),
                  const SizedBox(height: 15),
                  const SubtotleRow(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////
///
final List<CartItem> cartsList = [
  const CartItem(
    text: 'Cart 1',
    subtitle: '200 items',
    height: 60.0,
    color: Color(0xffED5151),
    subtileBackColor: Color(0xffDE3B3B),
    subtileTextColor: Colors.white,
  ),
  const CartItem(
    text: 'Cart 2',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 3',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 4',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 5',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 6',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 7',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 8',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 9',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
  const CartItem(
    text: 'Cart 10',
    subtitle: '12 items',
    height: 60.0,
    color: Colors.white,
    subtileBackColor: Color(0xffF3F3F3),
    subtileTextColor: Color(0xff222B45),
  ),
];

//////////
class CounterWidget extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  const CounterWidget({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 60,
          child: ElevatedButton(
            onPressed: () {
              // Implement delete functionality here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Change color as needed
              minimumSize: const Size(60, 50),
              padding: const EdgeInsets.all(5),
            ),
            child: Image.asset(
              "assets/images/delete.png",
              height: 14,
              width: 14,
            ),
          ),
        ),
        const SizedBox(width: 7),
        SizedBox(
          height: 50,
          width: 60,
          child: ElevatedButton(
            onPressed: _increment,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xffFBFBFB), // Change color as needed
              padding: const EdgeInsets.all(5),
            ),
            child: const Icon(Icons.add, size: 14, color: Color(0xff222B45)),
          ),
        ),
        const SizedBox(width: 7),
        Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white, // Change background color as needed
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              '$_quantity',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff222B45), // Change text color as needed
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        SizedBox(
          height: 50,
          width: 60,
          child: ElevatedButton(
            onPressed: _decrement,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xffFBFBFB), // Change text color as needed
              // Change color as needed
              padding: const EdgeInsets.all(5),
            ),
            child: const Icon(
              Icons.remove,
              color: Color(0xff222B45),
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}

///////
///
///
class OptionsRow extends StatefulWidget {
  const OptionsRow({super.key});

  @override
  _OptionsRowState createState() => _OptionsRowState();
}

class _OptionsRowState extends State<OptionsRow> {
  int selectedOption = -1; // Initial value to indicate no selection

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OptionWidget(
          text: 'In-store',
          borderColor: selectedOption == 0
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 0; // Set to 0 when tapped
            });
          },
        ),
        const SizedBox(
          width: 3,
        ),
        OptionWidget(
          text: 'Pickup',
          borderColor: selectedOption == 1
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 1; // Set to 1 when tapped
            });
          },
        ),
        const SizedBox(
          width: 3,
        ),
        OptionWidget(
          text: 'Nearby Delivery',
          borderColor: selectedOption == 2
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 2; // Set to 2 when tapped
            });
          },
        ),
        const SizedBox(
          width: 3,
        ),
        OptionWidget(
          text: 'Home Delivery',
          borderColor: selectedOption == 3
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 3; // Set to 3 when tapped
            });
          },
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String text;
  final Color borderColor;
  final VoidCallback onTap;

  const OptionWidget({
    super.key,
    required this.text,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff222B45),
            ),
          ),
        ),
      ),
    );
  }
}

///////////
class DiscountRow extends StatefulWidget {
  const DiscountRow({super.key});

  @override
  _DiscountRowState createState() => _DiscountRowState();
}

class _DiscountRowState extends State<DiscountRow> {
  int selectedOption = -1; // Initial value to indicate no selection

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OptionWidget(
          text: 'Add Discount',
          borderColor: selectedOption == 0
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 0; // Set to 0 when tapped
            });
          },
        ),
        const SizedBox(
          width: 3,
        ),
        OptionWidget(
          text: 'Add Note',
          borderColor: selectedOption == 1
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 1; // Set to 1 when tapped
            });
          },
        ),
      ],
    );
  }
}

///////////
class TableRow extends StatefulWidget {
  const TableRow({super.key});

  @override
  _TableRowState createState() => _TableRowState();
}

class _TableRowState extends State<TableRow> {
  int selectedOption = -1; // Initial value to indicate no selection

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OptionWidget(
          text: 'Select Table',
          borderColor: selectedOption == 0
              ? const Color(0xffED5151) // Red when selected
              : const Color(0xffF3F3F3),
          onTap: () {
            setState(() {
              selectedOption = 0; // Set to 0 when tapped
            });
          },
        ),
      ],
    );
  }
}
/////////////

class SubtotleRow extends StatefulWidget {
  const SubtotleRow({super.key});

  @override
  _SubtotleRowState createState() => _SubtotleRowState();
}

class _SubtotleRowState extends State<SubtotleRow> {
  int selectedOption = -1; // Initial value to indicate no selection

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Subtotle",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
            Text(
              "400£",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Discount",
                  style: TextStyle(
                    color: Color(0xff222B45),
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "subtitle",
                        style: TextStyle(
                          color: Color(0xff222B45),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/images/remove.png",
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              "400£",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Delivery Fee",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
            Text(
              "2.0£",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "VAT A (15%)",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
            Text(
              "0.2£",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(
          height: 2,
          color: Color(0xffF5F5F5),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Total",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "5,50£",
              style: TextStyle(
                color: Color(0xff222B45),
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement delete functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF3F3F3),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Color(0xff222B45),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 150,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffED5151),
                    minimumSize: const Size(63, 50),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
