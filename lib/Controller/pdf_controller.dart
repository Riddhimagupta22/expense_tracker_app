import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../Model/expense_model.dart';

void CreatePDF(List<ExpenseModel> expenses) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Center(
          child: pw.Text('Expense Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          headers: ['Title', 'Amount', 'Date', 'Category'],
          data: expenses.map((data) {
            return [
              data.note,
              'Rs ${data.amount.toStringAsFixed(2)}',
              data.date ?? '',
              data.item ?? '',
            ];
          }).toList(),
        ),
      ],
    ),
  );

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}
