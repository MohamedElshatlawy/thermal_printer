import 'package:flutter/material.dart';

class CustomReceipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildDivider(),
              _buildSectionTitle('اسم مندوب الاستلام:'),
              _buildValueText('احمد علي حسين',),
              _buildDivider(),
              _buildSectionTitle('بيانات التوريدة'),
              _buildKeyValue('المحصول:', 'طمام فرش'),
              _buildKeyValue('رقم التوريدة:', 'FD-4321'),
              _buildKeyValue('تاريخ الاستلام:', '2024-08-22'),
              _buildDivider(),
              _buildSectionTitle('بيانات المورد'),
              _buildKeyValue('اسم المورد:', 'يوسف محمد'),
              _buildKeyValue('كود المورد:', 'F-4321'),
              _buildDivider(),
              _buildSectionTitle('بيانات العقد'),
              _buildKeyValue('اسم العقد:', 'طمام فرش 2024'),
              _buildKeyValue('كود العقد:', 'F-4321'),
              _buildKeyValue('وحدة القياس:', 'كيلوجرام'),
              _buildDivider(),
              _buildSectionTitle('بيانات المحطة'),
              _buildKeyValue('اسم المحطة:', 'محطة استلامات عملاء'),
              _buildKeyValue('كود المحطة:', '2320'),
              _buildDivider(),
              _buildSectionTitle('الاصناف'),
              _buildTable(),
              _buildDivider(),
              _buildSectionTitle('خصم الجودة'),
              _buildKeyValue('نسبة الخصم:', '2%'),
              _buildKeyValue('الفلاح ارسل الكود:', 'لا'),
              _buildKeyValue('سبب عدم ارسال الكود:', 'لا يمكن الوصول لهاتف الفلاح'),
              _buildDivider(),
              _buildSectionTitle('كميات الاستلام'),
              _buildKeyValue('الكمية المستلمة:', '1450'),
              _buildKeyValue('وحدة القياس:', 'كيلوجرام'),
              _buildKeyValue('الكمية المقبولة:', '1000'),
            ],
          ),
        ),
      
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'تم الطباعة في وقت:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
        ),
        Text(
          '30:30  -  2024-08-22',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(
        thickness: 3,
        color: Colors.black,
        height: 1,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }

  Widget _buildKeyValue(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              key,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: 'Cairo',
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: 'Cairo',
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 3),
      children: [
        TableRow(children: [
          _buildTableCell('المحصول', isHeader: true),
          _buildTableCell('كمية التوريد', isHeader: true),
          _buildTableCell('الكمية المقبولة', isHeader: true),
        ]),
        TableRow(children: [
          _buildTableCell('طمام فرش'),
          _buildTableCell('1450'),
          _buildTableCell('1000'),
        ]),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isHeader ? 20 : 18,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontFamily: 'Cairo',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
