import 'package:flutter/material.dart';
import 'package:internship_fair/screens/jobdesc.dart';
import 'package:internship_fair/screens/summary.dart';

class JobCard extends StatelessWidget {
  final String? companyName;
  final String? duration;
  final String? stipend;
  final String? location;
  final String? position;
  final String? mode;
  final String? logo;
  final List<dynamic> perks;
  final List<dynamic> requirements;
  final List<dynamic> skills;
  final String? about;
  final int? jobid;
  final String? description;
  final List<dynamic> link;

  const JobCard(
      {Key? key,
      required this.companyName,
      required this.duration,
      required this.stipend,
      required this.location,
      required this.position,
      required this.mode,
      required this.perks,
      required this.about,
      required this.requirements,
      required this.skills,
      required this.jobid,
      this.logo,
      required this.description,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.058, 0, MediaQuery.of(context).size.width * 0.05, 10),
      // width: MediaQuery.of(context).size.width * 0.85,
      // height: MediaQuery.of(context).size.height * 0.27,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.031,
          left: MediaQuery.of(context).size.width * 0.072,
          right: MediaQuery.of(context).size.width * 0.072),
      decoration:
          BoxDecoration(border: Border.all(width: 0.3), borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
                    width: size.width * 0.6,
                    child: Text(
                      position!,
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: sizefont,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              new Spacer(),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                // height: 28.88,
                height: MediaQuery.of(context).size.width * 0.1,
                // width: 33.14,
                width: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(logo!),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
          Text(
            companyName!,
            style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.w500, fontSize: sizefont * 0.8),
          ),
          SizedBox(height: sizefont * 0.33),
          Container(
            child: Text(
              location!,
              style: TextStyle(
                  fontFamily: 'poppins', fontWeight: FontWeight.w400, fontSize: sizefont * 0.8, color: Colors.grey),
            ),
          ),

          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                height: sizefont,
                width: sizefont,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: sizefont * 0.75,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.029, left: MediaQuery.of(context).size.width * 0.0194),
                height: sizefont,
                width: MediaQuery.of(context).size.width * 0.12,
                child: Text(
                  'MODE',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: sizefont * 0.7,
                      // color: Color(0xF2D3748),
                      color: Colors.grey),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0115, left: MediaQuery.of(context).size.width * 0.0194),
                height: sizefont,
                width: sizefont,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.white,
                    size: sizefont * 0.75,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.019, left: MediaQuery.of(context).size.width * 0.0194),
                height: sizefont * 1.3,
                width: sizefont * 4.4,
                child: Text(
                  'STIPEND',
                  style: TextStyle(
                      fontFamily: 'poppins', fontWeight: FontWeight.w400, fontSize: sizefont * 0.7, color: Colors.grey),
                ),
              ),
              // SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.015,
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0115),
                height: sizefont,
                width: sizefont,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.timelapse_outlined,
                    color: Colors.white,
                    size: sizefont * 0.75,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.019, left: MediaQuery.of(context).size.width * 0.018),
                height: 21,
                width: 62,
                child: Text(
                  'DURATION',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: sizefont * 0.7,
                      // color: Color(0xF2D3748),
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          // SizedBox(height: 6),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                  height: sizefont * 1.25,
                  width: sizefont * 2.5,
                  child: Text(
                    mode!,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: sizefont * 0.7,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                  // color: Colors.black,
                  height: sizefont * 1.25,
                  width: sizefont * 2.5,
                  child: Wrap(
                    children: [
                      Text(
                        stipend!,
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: sizefont * 0.7,
                            // color: Color(0xF2D3748),
                            color: Colors.black),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
                  // color: Colors.black,
                  height: sizefont * 1.25,
                  width: sizefont * 3.5,
                  child: Wrap(
                    children: [
                      Text(
                        duration!,
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: sizefont * 0.7,
                            // color: Color(0xF2D3748),
                            color: Colors.black),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              new Spacer(),
              InkWell(
                child: Container(
                    height: size.height * 0.03,
                    child: Text(
                      'View details >',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizefont * 0.8,
                          // color: Color(0xF2D3748),
                          color: Colors.teal),
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              //Summary()
                              JobDesc(
                                companyName: companyName!,
                                duration: duration!,
                                jobid: jobid!,
                                jobPosition: position!,
                                minStipend: stipend!,
                                workfromHome: mode!,
                                about: about!,
                                perks: perks,
                                skills: skills,
                                requirements: requirements,
                                logo: logo!,
                                location: location!,
                                link: link,
                                description: description ?? "No description provided",
                              )));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
