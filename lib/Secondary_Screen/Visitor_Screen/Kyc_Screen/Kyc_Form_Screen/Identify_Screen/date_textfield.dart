// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:nepali_date_picker/nepali_date_picker.dart';
// import 'package:pass/Constant/colors.dart';
//
// class DateTextField extends StatefulWidget {
//   const DateTextField({Key? key, required this.englishdateofbirth}) : super(key: key);
//   final String englishdateofbirth;
//
//   @override
//   State<DateTextField> createState() => _DateTextFieldState();
// }
//
// class _DateTextFieldState extends State<DateTextField> {
//   NepaliDateTime selectedDate = NepaliDateTime.now();
//   DateTime datetime=DateTime.now();
//   final englishdateofbirth=TextEditingController(
//       text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
//   final dateofbirth = TextEditingController(
//       text: DateFormat('yyyy-MM-dd').format(NepaliDateTime.now()));
//
//   selectEnglishDate(BuildContext context)async{
//     DateTime? _selectDate= await showDatePicker(
//         context: context,
//         initialDate: datetime,
//         firstDate: DateTime(1950),
//         lastDate: DateTime(2101));
//     if (_selectDate != null && _selectDate != datetime) {
//       setState(() {
//         englishdateofbirth.text = DateFormat('yyyy-MM-dd').format(_selectDate);
//       });
//     }}
//   @override
//   Widget build(BuildContext context) {
//     return  TextFormField(
//       readOnly: true,
//       enableInteractiveSelection: false,
//       controller: englishdateofbirth,
//
//       onChanged: (value) {
//         setState(() {
//           englishdateofbirth.text =
//           "${englishdateofbirth}".split(' ')[0];
//         });
//       },
//       validator: (value) {
//         if (englishdateofbirth.text.toString() ==
//             DateTime.now().toString()) {
//           return 'Please Choose Valid Date';
//         }
//         if ((int.parse(DateFormat('yyyy')
//             .format(DateTime.now()))) -
//             int.parse(DateFormat('yyyy').format(
//                 DateTime.parse(englishdateofbirth.text.toString()))) <
//             16) {
//           return 'Age Must be greater than 16';
//         }
//         return null;
//       },
//
//       decoration: InputDecoration(
//
//           prefixIcon: IconButton(
//             onPressed: () {
//               FocusScopeNode currentFocus = FocusScope.of(context);
//               if (currentFocus.focusedChild != null) {
//                 currentFocus.focusedChild!.unfocus();
//               }
//               selectEnglishDate(context);
//             },
//             icon: const Icon(Icons.date_range_outlined),
//           ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
//         fillColor: Colors.white,
//         filled: true,
//         hintStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color:boarderColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: boarderColor,
//             width: 0.0,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         border: OutlineInputBorder(
//
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.blueGrey),
//         ),
//         hoverColor: primaryColor,
//       ),
//     );
//   }
// }
