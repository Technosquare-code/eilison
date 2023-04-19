import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class PaymentPart extends StatefulWidget {
  @override
  _PaymentPartState createState() => _PaymentPartState();
}

class _PaymentPartState extends State<PaymentPart> {
  String selectedMethod = "";
  List<Map<String, dynamic>> methods = [
    {'image': 'assets/images/card.png', 'name': 'Debit/Credit Card'},
    // {'image': 'assets/images/upi.png', 'name': 'UPI'},
    // {'image': 'assets/images/wallet.png', 'name': 'Eilison Wallets'},
    {'image': 'assets/images/cash.jpg', 'name': 'Cash on Delivey'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: methods.length,
            itemBuilder: (ctx, i) => SelectPayment(
              image: methods[i]['image'],
              name: methods[i]['name'],
              selectedMethod: selectedMethod,
              onTap: () {
                selectedMethod = methods[i]['name'];
                setState(() {});
              },
            ),
          ),
        ),
        Divider(color: Colors.grey.shade100, thickness: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "Dilivery Address",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manoj Saini",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Technosquare IT Solution Private Limited, Near Bahagat Singh Circle, Pliani, 333031, Rajestan",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Contact Number: 702433543",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class SelectPayment extends StatelessWidget {
  final String image;
  final String name;
  final String selectedMethod;
  final VoidCallback onTap;

  const SelectPayment({
    required this.image,
    required this.name,
    required this.selectedMethod,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 5),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 45,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Radio(
                  value: name,
                  groupValue: selectedMethod,
                  activeColor: primaryColor,
                  onChanged: (_) => onTap(),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
