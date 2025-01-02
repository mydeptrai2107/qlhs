import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Theloai> theloai = [];
  final repository = Repository();
  init() async {
    theloai = await repository.getCategory();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Mã Thể Loại')),
            DataColumn(label: Text('Thể Loại')),
          ],
          rows: [
            for (int i = 0; i < theloai.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(theloai[i].maTl),
                  ),
                  DataCell(
                    Text(theloai[i].tenTl),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}