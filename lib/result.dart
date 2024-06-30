import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 class ResultPage extends StatefulWidget {
   const ResultPage({super.key});

   @override
   State<ResultPage> createState() => _ResultPageState();
 }

 class _ResultPageState extends State<ResultPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xff54ffa7),
         title: Text('Result'),
       ),
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Student Name: Farida Eyasmin',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               ),
               Text(
                 'ID:1111025',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               ),
               Text(
                 'Position: 1',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 20),
               SingleChildScrollView( // Wrap with SingleChildScrollView
                 scrollDirection: Axis.horizontal, // Allow horizontal scrolling
                 child: DataTable(
                   columns: [
                     DataColumn(label: Text('Subject')),
                     DataColumn(label: Text('Student\'s Marks')),
                     DataColumn(label: Text('Highest Marks')),
                   ],
                   rows: [
                     DataRow(cells: [
                       DataCell(Text('CSE 101')),
                       DataCell(Text('85')),
                       DataCell(Text('100')),
                     ]),
                     DataRow(cells: [
                       DataCell(Text('MATH-141')),
                       DataCell(Text('90')),
                       DataCell(Text('95')),
                     ]),
                     DataRow(cells: [
                       DataCell(Text('CHEM-101')),
                       DataCell(Text('75')),
                       DataCell(Text('80')),
                     ]),
                     DataRow(cells: [
                       DataCell(Text('HUM-101')),
                       DataCell(Text('65')),
                       DataCell(Text('83')),
                     ]),
                     DataRow(cells: [
                       DataCell(Text('CE-150')),
                       DataCell(Text('79')),
                       DataCell(Text('90')),
                     ]),

                   ],
                 ),
               ),
               SizedBox(height: 20),
               Text(
                 'Total Marks: 394',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 20),
               Center(
                 child: ElevatedButton(
                   style: TextButton.styleFrom(
                     backgroundColor: Colors.greenAccent
                   ),
                   onPressed: () {

                     SystemNavigator.pop();
                   },
                   child: Text("Exit",
                     style: TextStyle(
                         fontSize: 20
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }