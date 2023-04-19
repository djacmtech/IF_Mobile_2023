import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/screens/login.dart';
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
  List<String> stipend = ['4500', '7000', '6000'];
  List<String> compName = ['Apple', 'AWS', 'Google'];
  List<String> time = ['2000', '1500', '2000'];
  List<String> workMode = ['Online', 'Offline', 'Online'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Filter();
                }));
              },
              icon: const Icon(Icons.filter_alt_sharp, color: Colors.teal)),
          elevation: 0,
          title: const Text(
            'Job Profile',
            style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.w500, color: Colors.black),
          ),
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  GetStorage().erase();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                icon: const Icon(Icons.logout, color: Colors.teal)),
          ],
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: compName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return JobCard(
                            companyName: compName[index],
                            duration: time[index],
                            stipend: stipend[index],
                            location: locations[index],
                            position: jobPosi[index],
                            mode: workMode[index]);
                      }))
            ],
          ),
        ));
  }
}
