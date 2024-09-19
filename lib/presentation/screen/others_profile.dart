import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OthersProfile extends StatelessWidget {
  const OthersProfile({
    super.key,
    required this.username,
    required this.id,
    required this.url,
  });
  final String username;
  final String id;
  final String url;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        child: Container(
          color: kblackdarktrans,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(url),
              ),
              Text(
                username,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Text('UI designer'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    kLocation,
                  ),
                  Text('Location')
                ],
              ),
              Card(
                color: const Color.fromARGB(80, 11, 102, 148),
                child: SizedBox(
                  height: size.height / 9,
                  width: size.width / 2,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      medianumber(
                        number: '6',
                        name: 'voices',
                      ),
                      VerticalDivider(
                        color: klightwhite,
                        endIndent: 10,
                        indent: 10,
                      ),
                      medianumber(
                        number: '13',
                        name: 'Media',
                      ),
                      VerticalDivider(
                        color: klightwhite,
                        endIndent: 10,
                        indent: 10,
                      ),
                      medianumber(
                        number: '347',
                        name: 'Texts',
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Recent Activity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  height: size.height / 3,
                  width: size.width,
                  child: SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: const CategoryAxis(),
                      series: <LineSeries<SalesData, String>>[
                        LineSeries<SalesData, String>(
                            color: Colors.blueGrey,
                            dataSource: <SalesData>[
                              SalesData('Jan', 0),
                              SalesData('Feb', 28),
                              SalesData('Mar', 34),
                              SalesData('Apr', 32),
                              SalesData('May', 40)
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ]))
            ],
          )),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class medianumber extends StatelessWidget {
  const medianumber({
    super.key,
    required this.number,
    required this.name,
  });
  final String number;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(number), Text(name)],
    );
  }
}
