import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/addtocart.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDesc extends StatefulWidget {
  final String? jobPosition, companyName, minStipend, duration, workfromHome, about, description, logo, location;
  final List<dynamic> skills, perks, requirements, link;

  final int jobid;
  const JobDesc(
      {Key? key,
      required this.jobid,
      required this.jobPosition,
      required this.companyName,
      required this.minStipend,
      required this.duration,
      required this.workfromHome,
      required this.about,
      required this.perks,
      required this.location,
      required this.requirements,
      required this.link,
      this.logo,
      required this.skills,
      this.description})
      : super(key: key);

  @override
  State<JobDesc> createState() => _JobDescState();
}

class _JobDescState extends State<JobDesc> {
  bool abtcomp = false;
  bool jd = false;
  bool whocan = false;
  bool perks = false;
  bool link = false;
  bool desc = false;
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse("https://$url"); // include https:// prefix
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;
    // void _launchURL(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    void cartAdd() async {
      Loader.show(context, progressIndicator: CircularProgressIndicator(color: blackTeal));
      String status = '';
      int userid = GetStorage().read("id");
      try {
        status = await addCart(userid, widget.jobid);
      } on Exception catch (e) {
        Loader.hide();
        print(e);
      }
      Loader.hide();

      // print("Yash" + status);

      if (status == "Success") {
        MotionToast.success(
          toastDuration: Duration(milliseconds: 500),
          width: size.width * 0.7,
          height: sizefont * 4,
          borderRadius: sizefont * 0.45,
          padding: EdgeInsets.zero,
          title: Text(
            "Internship added",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          description: Text(
            "Added to cart successfully",
            style: TextStyle(
              color: Colors.white,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      } else if (status == "Job already in cart") {
        MotionToast(
          toastDuration: Duration(milliseconds: 500),
          primaryColor: darkgrey,
          width: size.width * 0.7,
          height: sizefont * 4,
          borderRadius: sizefont * 0.45,
          padding: EdgeInsets.zero,
          title: Text(
            "Already in Cart",
            style: TextStyle(
              fontFamily: "Poppins",
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: sizefont * 0.8,
            ),
          ),
          description: Text(
            "Book your interview",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      } else if (status == 'Job ordered already') {
        MotionToast(
          toastDuration: Duration(milliseconds: 500),
          primaryColor: darkgrey,
          width: size.width * 0.7,
          height: sizefont * 4,
          borderRadius: sizefont * 0.45,
          padding: EdgeInsets.zero,
          title: Text(
            "Already applied",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: sizefont * 0.8,
            ),
          ),
          description: Text(
            "You have applied for this internship",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      } else {
        MotionToast.error(
          toastDuration: Duration(milliseconds: 500),
          height: sizefont * 5,
          borderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          title: Row(
            children: [
              // Icon(
              //   Icons.error_outline,
              //   color: Colors.white,
              //   size: 24,
              // ),
              // SizedBox(width: 16),
              Text(
                "Could Not Add to Cart",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: sizefont * 0.9,
                ),
              ),
            ],
          ),
          description: Text(
            "Please check your internet connection and try again",
            style: TextStyle(
              fontFamily: "Poppins",
              color: whiteColor,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      }
    }

    final jobPosn = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    widget.jobPosition!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: textgreen, fontFamily: "poppins", fontSize: sizefont * 1.5, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.003 * size.height,
            ),
            Wrap(
              children: [
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    widget.companyName!,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "poppins",
                      fontSize: sizefont * 1.2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.003 * size.height,
            ),
            Wrap(
              children: [
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    widget.location!,
                    style: TextStyle(
                      color: darkgrey,
                      fontFamily: "poppins",
                      fontSize: sizefont,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.13,
        ),
        Container(
          height: size.height * 0.1,
          width: size.height * 0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.logo!),
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      ],
    );

    final jobDetails = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.location_on_sharp,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MODE',
                  style: TextStyle(
                    color: darkgrey,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),
                ),
                Wrap(
                  children: [
                    Container(
                      width: size.width * 0.12,
                      child: Text(
                        widget.workfromHome!,
                        style: TextStyle(
                          color: blackColor,
                          fontFamily: "poppins",
                          fontSize: sizefont * 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.currency_rupee_outlined,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STIPEND',
                  style: TextStyle(
                    color: darkgrey,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),
                ),
                Text(
                  widget.minStipend!,
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont * 0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.timer,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DURATION',
                  style: TextStyle(
                    color: darkgrey,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),
                ),
                Wrap(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      child: Text(
                        widget.duration!,
                        style: TextStyle(
                          color: blackColor,
                          fontFamily: "poppins",
                          fontSize: sizefont * 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

    final aboutComp = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          abtcomp = !abtcomp;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'About The Company',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: sizefont),
            child: ListTile(
              contentPadding: EdgeInsets.only(bottom: sizefont * 0.6),
              title: Text(
                widget.about!,
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: abtcomp,
          canTapOnHeader: true,
        ),
      ],
    );

    final description = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          desc = !desc;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: sizefont),
            child: ListTile(
              contentPadding: EdgeInsets.only(bottom: sizefont * 0.6),
              title: Text(
                widget.description!,
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: desc,
          canTapOnHeader: true,
        ),
      ],
    );

    final jD = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          jd = !jd;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'Skills',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          isExpanded: jd,
          canTapOnHeader: true,
          body: Container(
              width: size.width,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.skills.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                          // alignment: WrapAlignment.start,
                          // crossAxisAlignment: WrapCrossAlignment.start,
                          // direction: Axis.horizontal,
                          // alignment: Wra.,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: sizefont, bottom: sizefont * 0.45),
                                  height: 5.0,
                                  width: 5.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: size.width * 0.8,
                                  margin: EdgeInsets.only(top: 11),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      // SizedBox(
                                      //   width: 15,
                                      // ),
                                      Text(
                                        widget.skills[index],
                                        softWrap: true,
                                        style: TextStyle(
                                          color: blackColor,
                                          fontFamily: "poppins",
                                          fontSize: sizefont * 0.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    );
                  })),
          // child: ListTile(
          //   title: Text(
          //     widget.skills.toString(),
          // style: TextStyle(
          //   color: blackColor,
          //   fontFamily: "poppins",
          //   fontSize: sizefont * 0.8,
          // ),
          //   ),
          // ),
        ),
      ],
    );

    final whoCan = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          whocan = !whocan;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'Requirements',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          body: Container(
              width: size.width,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.requirements.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                          // alignment: WrapAlignment.start,
                          // crossAxisAlignment: WrapCrossAlignment.start,
                          // direction: Axis.horizontal,
                          // alignment: Wra.,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: sizefont, bottom: sizefont * 0.45),
                                  height: 5.0,
                                  width: 5.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: size.width * 0.8,
                                  margin: EdgeInsets.only(top: 11),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      // SizedBox(
                                      //   width: 15,
                                      // ),
                                      Text(
                                        widget.requirements[index],
                                        softWrap: true,
                                        style: TextStyle(
                                          color: blackColor,
                                          fontFamily: "poppins",
                                          fontSize: sizefont * 0.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    );
                  })),

          // body: Padding(
          //   padding: EdgeInsets.only(bottom: sizefont * 0.7),
          //   child: Wrap(
          //     children: widget.requirements.map((e) {
          //       return Wrap(
          //         children: [
          //           Row(
          //             children: [
          // Container(
          //   margin: EdgeInsets.only(left: sizefont, bottom: sizefont * 0.45),
          //   height: 5.0,
          //   width: 5.0,
          //   decoration: const BoxDecoration(
          //     color: Colors.black,
          //     shape: BoxShape.circle,
          //   ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only(left: sizefont * 0.45, bottom: sizefont * 0.45),
          //                 child: Text(
          //                   e,
          //                   softWrap: true,
          //                   style: TextStyle(
          //                     color: blackColor,
          //                     fontFamily: "poppins",
          //                     fontSize: sizefont * 0.8,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       );
          //     }).toList(),
          //   ),
          // ),
          isExpanded: whocan,
          canTapOnHeader: true,
        ),
      ],
    );

    final perkS = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          perks = !perks;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'Perks',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.only(bottom: sizefont * 0.7),
            child: Wrap(
              children: widget.perks.map((e) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: sizefont, bottom: sizefont * 0.45),
                      height: 5.0,
                      width: 5.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: sizefont * 0.45, bottom: sizefont * 0.45),
                      child: Text(
                        e,
                        style: TextStyle(
                          color: blackColor,
                          fontFamily: "poppins",
                          fontSize: sizefont * 0.8,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          isExpanded: perks,
          canTapOnHeader: true,
        ),
      ],
    );

    final applyButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: Container(
          height: sizefont * 3,
          padding: EdgeInsets.symmetric(vertical: sizefont * 0.5),
          child: MaterialButton(
              onPressed: () {
                cartAdd();
              },
              child: SizedBox(
                width: size.width,
                child: Text(
                  "Apply",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: whiteColor),
                ),
              )),
        ));

    final links = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          link = !link;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                'Link',
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont,
                ),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.only(bottom: sizefont * 0.7),
            child: Wrap(
              children: widget.link.map((e) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: sizefont, bottom: sizefont * 0.45),
                      height: 5.0,
                      width: 5.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: sizefont * 0.45, bottom: sizefont * 0.45),
                      child: InkWell(
                        onTap: () => _launchURL(e),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: "poppins",
                            fontSize: sizefont * 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          isExpanded: link,
          canTapOnHeader: true,
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
            iconSize: sizefont * 1.5,
            onPressed: () => Navigator.pop(context),
          ),
          // centerTitle: true,
          backgroundColor: whiteColor,
          title: Text(
            'Job Description',
            style: TextStyle(fontFamily: 'poppins', fontSize: sizefont * 1.5, color: blackColor),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: sizefont * 2, horizontal: size.width * 0.06),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                jobPosn,
                SizedBox(
                  height: size.width * 0.05,
                ),
                jobDetails,
                SizedBox(
                  height: size.width * 0.05,
                ),
                aboutComp,
                SizedBox(
                  height: size.width * 0.03,
                ),
                description,
                SizedBox(
                  height: size.width * 0.03,
                ),
                links,
                SizedBox(
                  height: size.width * 0.03,
                ),
                jD,
                SizedBox(
                  height: size.width * 0.03,
                ),
                whoCan,
                SizedBox(
                  height: size.width * 0.03,
                ),
                perkS,
                SizedBox(
                  height: size.width * 0.05,
                ),
                applyButton
              ]),
        ),
      ),
    );
  }
}
