import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/getjob_api.dart';
import 'package:internship_fair/models/getjob_model.dart' as data;
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/login.dart';
import 'package:internship_fair/widgets/navigationbar.dart';
import '../widgets/JobCard.dart';
import 'filter_page.dart';

class JobProfile extends StatefulWidget {
  final int low, high;
  final String? mode;
  const JobProfile(
      {Key? key, required this.low, required this.high, required this.mode})
      : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {
  List<data.Data> _getJob = [];

  getJob(int low, int high, String? mode) async {
    _getJob = await GetJobApi().getJobData(low, high, mode);
    print(_getJob);
  }

  @override
  void initState() {
    // TODO: implement initState
    getJob(widget.low, widget.high, widget.mode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;
    return Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const Filter();
                // }));
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    final screenHeight = MediaQuery.of(context).size.height;
                    final modalHeight = screenHeight *
                        0.9; // set the height to 80% of the screen height

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Filter(),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * 0.05),
                        topRight: Radius.circular(size.width * 0.05)),
                  ),
                );
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyCart();
                }));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: blackTeal,
              ),
            ),
            IconButton(
                onPressed: () {
                  GetStorage().erase();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              //Summary()
                              MyCart()));
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
                    future: getJob(widget.low, widget.high, widget.mode),
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
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if (_getJob[index].requirements == null) {
                              _getJob[index].requirements = [
                                "No specific requirements"
                              ];
                            }
                            if (_getJob[index].skills == null) {
                              _getJob[index].skills = ["No specific skills"];
                            }
                            if (_getJob[index].perks == null) {
                              _getJob[index].perks = ["No specific perks"];
                            }
                            return JobCard(
                              companyName: _getJob[index].company,
                              duration: _getJob[index].duration,
                              stipend: _getJob[index].stipend.toString(),
                              location: _getJob[index].location,
                              position: _getJob[index].role,
                              mode: _getJob[index].mode,
                              logo: _getJob[index].logo,
                              requirements: _getJob[index].requirements,
                              perks: _getJob[index].perks,
                              about: _getJob[index].about,
                              skills: _getJob[index].skills,
                              jobid: _getJob[index].id,
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
