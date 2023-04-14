import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobCard extends StatelessWidget {
  final String? companyName;
  final String? duration;
  final String? stipend;
  final String? location;
  final String? position;
  final String? mode;

  const JobCard(
      {Key? key,
      required this.companyName,
      required this.duration,
      required this.stipend,
      required this.location,
      required this.position,
      required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 169,
      // width: 308,
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.264,
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
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0417,
                    top: MediaQuery.of(context).size.height * 0.028),
                // width: 200,
                width: MediaQuery.of(context).size.width * 0.55,
                // height: 21,
                height: MediaQuery.of(context).size.height * 0.033,
                child: Text(
                  position!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: Colors.teal,
                  ),
                ),
              ),
              // SizedBox(width: 36.49),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.101,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.031,
                    right: MediaQuery.of(context).size.width * 0.0313),
                // height: 28.88,
                height: MediaQuery.of(context).size.height * 0.045,
                // width: 33.14,
                width: MediaQuery.of(context).size.width * 0.092,
                child: SvgPicture.asset('assets/Vector.svg'),
              )
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              companyName!,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              location!,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.grey),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0125,
                    left: MediaQuery.of(context).size.width * 0.05),
                height: 13,
                width: 13,
                child: Center(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.023,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 21,
                width: 30,
                child: Text(
                  'MODE',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      // color: Color(0xF2D3748),
                      color: Colors.grey),
                ),
              ),
              // SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.042,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0125,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 13,
                width: 13,
                child: Center(
                  child: Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.023,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 21,
                width: 63,
                child: Text(
                  'MIN STIPEND',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.grey),
                ),
              ),
              // SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.042,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.023),
                height: 13,
                width: 13,
                child: Center(
                  child: Icon(
                    Icons.timelapse_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.023,
                    left: MediaQuery.of(context).size.width * 0.0194),
                height: 21,
                width: 56.39,
                child: Text(
                  'DURATION',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
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
                      left: MediaQuery.of(context).size.width * 0.1055),
                  height: 18,
                  width: 40,
                  child: Text(
                    mode!,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0917),
                  // color: Colors.black,
                  height: 18,
                  width: 40,
                  child: Text(
                    stipend!,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1611),
                  // color: Colors.black,
                  height: 18,
                  width: 85,
                  child: Text(
                    duration!,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        // color: Color(0xF2D3748),
                        color: Colors.black),
                  )),
            ],
          ),
          // SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.016,
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(
                    // right: MediaQuery.of(context).size.width * 0.055,
                    left: MediaQuery.of(context).size.width * 0.61),
                height: 18,
                child: Text(
                  'View details >',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      // color: Color(0xF2D3748),
                      color: Colors.teal),
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
