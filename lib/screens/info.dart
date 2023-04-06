import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';
//import 'package:internship_fair/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class InfoPage extends StatefulWidget {
   const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController sapidController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> genders = <String>['Male', 'Female', 'Prefer not to say'];
  String genderval = 'Male';
  List<String> years = <String>['FE','SE','TE','BE'];
  String yearval = 'FE';
  List<String> grads = <String>['2023','2024','2025','2026'];
  String gradval = '2023';
  List<String> depts = <String>['CS','IT','DS','AIML','AIDS','IOT','EXTC','MECH'];
  String deptval = 'CS';

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    PlatformFile? pickedfile;

    void collect(String name, String sapid, String phone, String whatsapp, String dob) async {
      if (formKey.currentState!.validate()) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const InfoPage()));
      }
    }

    Future selectPDF() async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: false,
        );
        if (result==null)
        {
          pickedfile = result!.files.first;
        }
      }
      catch (e){
        print(e);
      }
    }

    final nameField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your Name");
          }
          if (!RegExp(r"[a-zA-Z+' ]").hasMatch(value)) {
            return ("Please Enter a valid Name");
          }
          return null;
        },
        onSaved: (value) {
          nameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Enter Full Name',
          labelStyle: TextStyle(
            fontFamily: 'poppins',
            color: textgreen,
            fontSize: sizefont,
          ),
          suffixIcon: nameController.text.isEmpty ? Container(width: 0,): IconButton(
            icon: Icon(
              Icons.close,
              size: sizefont,
            ),
            onPressed: () => nameController.clear(),
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );
    
    final sapidField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: sapidController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your SAPID");
          }
          if (!RegExp(r"^[0-9]{11}$").hasMatch(value)) {
            return ("Please Enter a valid SAPID");
          }
          return null;
        },
        onSaved: (value) {
          sapidController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'SAPID',
          labelStyle: TextStyle(
            fontFamily: 'poppins',
            color: textgreen,
            fontSize: sizefont,
          ),
          suffixIcon: sapidController.text.isEmpty ? Container(width: 0,): IconButton(
            icon: Icon(
              Icons.close,
              size: sizefont,
            ),
            onPressed: () => sapidController.clear(),
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final phoneField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: phoneController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your Mobile No.");
          }
          if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
            return ("Please Enter a valid Mobile No.");
          }
          return null;
        },
        onSaved: (value) {
          phoneController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Mobile No.',
          labelStyle: TextStyle(
            fontFamily: 'poppins',
            color: textgreen,
            fontSize: sizefont,
          ),
          suffixIcon: phoneController.text.isEmpty ? Container(width: 0,): IconButton(
            icon: Icon(
              Icons.close,
              size: sizefont,
            ),
            onPressed: () => phoneController.clear(),
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final whatsappField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: whatsappController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your WhatsApp No.");
          }
          if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
            return ("Please Enter a valid WhatsApp No.");
          }
          return null;
        },
        onSaved: (value) {
          whatsappController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'WhatsApp No.',
          labelStyle: TextStyle(
            fontFamily: 'poppins',
            color: textgreen,
            fontSize: sizefont,
          ),
          suffixIcon: whatsappController.text.isEmpty ? Container(width: 0,): IconButton(
            icon: Icon(
              Icons.close,
              size: sizefont,
            ),
            onPressed: () => whatsappController.clear(),
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final dobField= Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: dobController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Date of Birth';
          }
          return null;
        },
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2003),
            firstDate: DateTime(2000),
            lastDate: DateTime(2005),
          );
          if (pickedDate != null) {
            print(pickedDate);
            String formattedDate =
                DateFormat('yyyy-MM-dd').format(pickedDate);
            print(formattedDate);
            setState(() {
              dobController.text = formattedDate;
            });
          } else {
            print("Date is not selected");
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_today,
            color: textgreen,
            size: 20,
          ),
          labelText: "Enter DOB",
          labelStyle: TextStyle(fontSize: sizefont,
            fontFamily: 'poppins',
            color: textgreen,
          ),
          suffixIcon: dobController.text.isEmpty? Container(width: 0,): IconButton(
            icon: Icon(
              Icons.close,
              size: 20,
              color: textgreen,
            ),
            onPressed: () => dobController.clear(),
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        )
      ),
    );

    final gender = Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            'Gender',
            style: TextStyle(
                fontFamily: 'poppins',
                color: textgreen,
                fontSize: sizefont),
          ),
        ),
        SizedBox(
          width: 0.05 * size.width,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            child: DropdownButton<String>(
              value: genderval,
              isExpanded: true,
              elevation: 16,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              dropdownColor: whiteColor,
              style: TextStyle(color: textgreen, fontFamily: 'poppins', fontSize: sizefont),
              underline: Container(
                height: 2,
                color: darkgrey,
              ),
              onChanged: (String? value) {
                setState(() {
                  genderval = value!;
                });
              },
              items: genders.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );

    final year = Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            'Academic Year',
            style: TextStyle(
                fontFamily: 'poppins',
                color: textgreen,
                fontSize: sizefont),
          ),
        ),
        SizedBox(
          width: 0.05 * size.width,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: DropdownButton<String>(
            value: yearval,
            elevation: 16,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            dropdownColor: whiteColor,
            style: TextStyle(color: textgreen, fontFamily: 'poppins', fontSize: sizefont),
            underline: Container(
              height: 2,
              color: darkgrey,
            ),
            onChanged: (String? value) {
              setState(() {
                yearval = value!;
              });
            },
            items: years.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );

    final department = Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            'Department',
            style: TextStyle(
                fontFamily: 'poppins',
                color: textgreen,
                fontSize: sizefont),
          ),
        ),
        SizedBox(
          width: 0.05 * size.width,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: DropdownButton<String>(
            value: deptval,
            elevation: 16,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            dropdownColor: whiteColor,
            style: TextStyle(color: textgreen, fontFamily: 'poppins', fontSize: sizefont),
            underline: Container(
              height: 2,
              color: darkgrey,
            ),
            onChanged: (String? value) {
              setState(() {
                deptval = value!;
              });
            },
            items: depts.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );

    final gradyear = Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            'Graduation Year',
            style: TextStyle(
                fontFamily: 'poppins',
                color: textgreen,
                fontSize: sizefont),
          ),
        ),
        SizedBox(
          width: 0.05 * size.width,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: DropdownButton<String>(
            value: gradval,
            elevation: 16,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            dropdownColor: whiteColor,
            style: TextStyle(color: textgreen, fontFamily: 'poppins', fontSize: sizefont),
            underline: Container(
              height: 2,
              color: darkgrey,
            ),
            onChanged: (String? value) {
              setState(() {
                gradval = value!;
              });
            },
            items: grads.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );

    final uploadButton = Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            'Resume',
            style: TextStyle(
                fontFamily: 'poppins',
                color: textgreen,
                fontSize: sizefont),
          ),
        ),
        SizedBox(
          width: 0.05 * size.width,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: SizedBox(
            height: sizefont*2.6,
            width: size.width*0.27,
            child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                color: whiteColor,
                child: MaterialButton(                    padding: EdgeInsets.symmetric(vertical: sizefont*0.8),
                    onPressed: () {
                      selectPDF();
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.file_upload_outlined, color: darkgrey, size: sizefont*0.9,)),
                          WidgetSpan(child: SizedBox(width: size.width*0.01,)),
                          TextSpan(
                            text: "Add File",
                                style: TextStyle(
                                    fontFamily: 'poppins', fontSize: sizefont*0.8, color: darkgrey),
                ),],)
               )
              )   
            )
          )
        ),
      ],
    );

    final submitButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: sizefont*0.7),
            onPressed: () {
              collect(nameController.text, sapidController.text, phoneController.text, whatsappController.text, dobController.text);
            },
            child: SizedBox(
              width: size.width,
              child: Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: sizefont, color: whiteColor),
              ),
            )));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),),
          centerTitle: true,
          backgroundColor: textgreen,
          title: const Text(
            'Student Details',
            style: TextStyle(fontFamily: 'poppins'),
          )),
      body:SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 27, horizontal: size.width * 0.06),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nameField,
                sapidField,
                phoneField,
                whatsappField,
                dobField,
                gender,
                year,
                department,
                gradyear,
                const SizedBox(
                height: 12,
                ),
                uploadButton,
                const SizedBox(
                height: 18,
                ),
                submitButton,
              ],
            )
          ),
      ),
    ),
    );
  }
}