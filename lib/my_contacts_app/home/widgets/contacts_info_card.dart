import 'package:flutter/material.dart';
import 'package:my_contacts_app/constants/app_constant.dart';
import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

enum UrlLaunchType { phone, email, sms }

class ContactsInfoCard extends StatelessWidget {
  final dynamic contactModel;
  const ContactsInfoCard({Key? key, required this.contactModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Icon(
          //       Icons.card_membership,
          //       size: AppConstant.headingIconSize,
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //         child: Text(
          //       contactModel.position!,
          //       style: AppConstant.headingTextStyle,
          //     ))
          //   ],
          // ),
          Column(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: AppConstant.subHeadingIconSize,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      contactModel.name!,
                      style: AppConstant.subHeadingTextStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_post_office,
                            size: AppConstant.subHeadingIconSize,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              contactModel.company!,
                              style: AppConstant.subHeadingTextStyle,
                            ),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: AppConstant.subHeadingIconSize,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              contactModel.address!,
                              style: AppConstant.subHeadingTextStyle,
                            ),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // SizedBox(
                    //   height: 30,
                    //   child: InkWell(
                    //     onTap: () => _urlLauncher(UrlLaunchType.phone,contactModel.phone!),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.mobile_screen_share_outlined,
                    //           size: AppConstant.subHeadingIconSize,
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           'Make a phone call Mobile ${contactModel.phone!}',
                    //           style: AppConstant.subHeadingTextStyle,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _urlLauncher(
                                UrlLaunchType.phone, contactModel.phone!),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: AppConstant.subHeadingIconSize,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Make a phone call',
                                      style: AppConstant.subHeadingTextStyle,
                                    )
                                  ],
                                ),
                                Text(contactModel.phone!)
                              ],
                            ),
                          ),

                          // InkWell(
                          //   onTap: () => _urlLauncher(
                          //       UrlLaunchType.sms, contactModel.phone!),
                          //   child: SizedBox(
                          //     height: 45,
                          //     child: Row(
                          //       children: [
                          //         Icon(
                          //           Icons.sms,
                          //           size: AppConstant.subHeadingIconSize,
                          //         ),
                          //         const SizedBox(
                          //           width: 10,
                          //         ),
                          //         Text(
                          //           "Send SMS",
                          //           style: AppConstant.subHeadingTextStyle,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      child: InkWell(
                        onTap: () => _urlLauncher(UrlLaunchType.email,contactModel.email!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email,
                              size: AppConstant.subHeadingIconSize,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text('Send email',
                                  style: AppConstant.subHeadingTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                      child: InkWell(
                        onTap: () => _urlLauncher(UrlLaunchType.sms,contactModel.phone!),
                        child: Row(
                          children: [
                            Icon(
                              Icons.sms,
                              size: AppConstant.subHeadingIconSize,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Send SMS Message",
                              style: AppConstant.subHeadingTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]);
  }

  void _urlLauncher(UrlLaunchType urlLaunchType, String data) {
    switch (urlLaunchType) {
      case UrlLaunchType.phone:
        _launchPhone(data);
        break;
      case UrlLaunchType.email:
        _launchEmail(data);
        break;
      case UrlLaunchType.sms:
        _launchSms(data);
        break;
    }
  }

  void _launchEmail(String email) async {
    await launchUrl(Uri(
      scheme: 'mailto',
      path: email,
    ));
  }

  void _launchSms(String mobileNumber) async {
    await launchUrl(Uri(scheme: 'sms', path: mobileNumber));
  }

  void _launchPhone(String phoneNumber) async {
    await launchUrl(Uri(scheme: 'tel', path: phoneNumber));
  }
}
