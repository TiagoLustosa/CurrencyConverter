import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/views/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 100, bottom: 15),
        child: ListView(
          children: [
            Image.asset('assets/images/logo.png', width: 150, height: 150),
            SizedBox(
              height: 50,
            ),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
              child: Text('Converter'),
              onPressed: () => {homeController.convert()},
            )
          ],
        ),
      ),
    ));
  }
}
