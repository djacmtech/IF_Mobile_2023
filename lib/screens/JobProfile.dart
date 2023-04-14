import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/JobCard.dart';
import 'filter_page.dart';

class JobProfile extends StatefulWidget {
  const JobProfile({Key? key}) : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {
  List<String> jobPosi = ['Frontend', 'Backend', 'App Dev'];
  List<String> locations = ['Mumbai', 'Delhi', 'Bangalore'];
  List<String> Stipend = ['4500', '7000', '6000'];
  List<String> compName = ['Apple', 'AWS', 'Google'];
  List<String> time = ['2000', '1500', '2000'];
  List<String> workMode = ['Online', 'Offline', 'Online'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(left: 16, top: 25),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => filter()));
                    },
                    icon: Icon(Icons.filter_alt_sharp, color: Colors.teal)),
              ],
            ),
          ),
          elevation: 0,
          title: Text(
            'Job Profile',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.black),
          ),
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: compName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return JobCard(
                            companyName: compName[index],
                            duration: time[index],
                            stipend: Stipend[index],
                            location: locations[index],
                            position: jobPosi[index],
                            mode: workMode[index]);
                      }))
            ],
          ),
        ));
  }
}
