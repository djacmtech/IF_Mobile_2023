import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/getjob_api.dart';
import 'package:internship_fair/models/getjob_model.dart' as data;
import 'package:internship_fair/screens/login.dart';
import '../widgets/JobCard.dart';
import 'filter_page.dart';

class JobProfile extends StatefulWidget {
  const JobProfile({Key? key}) : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {
  List<data.Data> _getJob = [];

  getJob() async {
    _getJob = await GetJobApi().getJobData();
  }

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
            style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  GetStorage().erase();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
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
                child: FutureBuilder(
                    future: getJob(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: textgreen,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _getJob.length,
                          itemBuilder: (BuildContext context, int index) {
                            return JobCard(
                              companyName: _getJob[index].company,
                              duration: _getJob[index].duration,
                              stipend: _getJob[index].stipend.toString(),
                              location: _getJob[index].location,
                              position: _getJob[index].role,
                              mode: _getJob[index].mode,
                              logo: _getJob[index].logo,
                            );
                          },
                        );
                      }
                    })),
              )
            ],
          ),
        ));
  }
}
