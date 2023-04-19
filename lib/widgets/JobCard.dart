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
  final String? perks;
  final String? requirements;
  final String? skills;
  final String? about;
  final int? jobid;

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
      this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.058, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.27,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.031,
          left: MediaQuery.of(context).size.width * 0.072,
          right: MediaQuery.of(context).size.width * 0.072),
      decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                position!,
                style: const TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.teal,
                ),
              ),
              new Spacer(),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                // height: 28.88,
                height: MediaQuery.of(context).size.width * 0.1,
                // width: 33.14,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(logo!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          Text(
            companyName!,
            style: const TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
          const SizedBox(height: 4),
          Container(
            child: Text(
              location!,
              style: const TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.grey),
            ),
          ),

          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.029,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 21,
                width: MediaQuery.of(context).size.width * 0.12,
                child: const Text(
                  'MODE',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      // color: Color(0xF2D3748),
                      color: Colors.grey),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0115,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.019,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 21,
                width: 80,
                child: const Text(
                  'MIN STIPEND',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              ),
              // SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.015,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0115),
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.timelapse_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.019,
                    left: MediaQuery.of(context).size.width * 0.018),
                height: 21,
                width: 62,
                child: const Text(
                  'DURATION',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
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
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.055),
                  height: 18,
                  width: 40,
                  child: Text(
                    mode!,
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
                  // color: Colors.black,
                  height: 18,
                  width: 40,
                  child: Text(
                    stipend!,
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.168),
                  // color: Colors.black,
                  height: 18,
                  width: MediaQuery.of(context).size.width * 0.19,
                  child: Text(
                    duration!,
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
            ],
          ),
          // SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              new Spacer(),
              InkWell(
                child: Container(
                    height: 18,
                    child: const Text(
                      'View details >',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          // color: Color(0xF2D3748),
                          color: Colors.teal),
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobDesc(
                                companyName: companyName!,
                                duration: duration!,
                                jobid: jobid!,
                                jobPosition: position!,
                                minStipend: stipend!,
                                workfromHome: mode!,
                                about: about!,
                                perks: perks!,
                                skills: skills!,
                                requirements: requirements!,
                                logo: logo!,
                                location: location!,
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
