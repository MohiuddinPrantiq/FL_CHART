import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graph using fl_chart package',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  FlChart(),
    );
  }
}

List<Color> showColor = [
  Colors.yellow,
  Colors.lightBlue,
  Colors.orange,
  Colors.green,
  Colors.red,
  Colors.teal,
  Colors.purple,
  Colors.blue,
];

class FlChart extends StatelessWidget{
  List<double> values=[5.2, 9.2, 3.2, 6,8, 1.5, 7.7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Graph using fl_chart package',
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 10,
      ),
      body: Center(

        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.blueGrey, // Set the color of the ring
              width: 6,
              // Set the width of the ring
            ),
          ),
          padding: EdgeInsets.all(20),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 10, // Adjust based on your data
              barGroups: List.generate(
                values.length,
                    (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: values[index],
                        width: 20, // Adjust the width of the bars as needed
                        color: showColor[index],
                        rodStackItems: [
                          BarChartRodStackItem(
                            0,
                            values[index],
                            showColor[index],
                          ),
                        ],
                      ),

                    ],
                    showingTooltipIndicators: [0]
                ),
              ),
              titlesData: FlTitlesData(
                rightTitles:  AxisTitles(

                  sideTitles: SideTitles(showTitles: false,),
                ),

                topTitles: AxisTitles(

                  sideTitles: SideTitles(showTitles: false,),
                ),

                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        getTitlesWidget: (data, value) {
                          return Text(
                            'Bar${data+1}',
                            style:  TextStyle(color: showColor[data.toInt()],
                                fontSize: 20, fontWeight: FontWeight.w500),
                          );
                        },
                        showTitles: true,
                        reservedSize: 30)),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        getTitlesWidget: (data, value) {
                          return Text(
                            data.toString(),
                            style: const TextStyle( color: Colors.black,
                                fontSize: 15, fontWeight: FontWeight.w500),
                          );
                        },
                        showTitles: true,
                        reservedSize: 30)),

              ),
              borderData: FlBorderData(
                show: true,
                border: Border(bottom: BorderSide(color: Colors.white),left: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        )
      ),
    );
  }
}


