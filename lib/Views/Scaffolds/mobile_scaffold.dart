// ignore_for_file: prefer_final_fields

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_portfolio/Components/about_container.dart';
import 'package:e_portfolio/Components/custom_button.dart';
import 'package:e_portfolio/Components/long_field.dart';
import 'package:e_portfolio/Components/os_container_mobile.dart';
import 'package:e_portfolio/Components/text_field.dart';
import 'package:e_portfolio/Services/Text%20Class/text_class.dart';
import 'package:e_portfolio/Services/Utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation for floating/shaking effect
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //  instance for text class
  final textClass = TextClass();

  //  global key for form
  final _formKey = GlobalKey<FormState>();

  //  loading variable
  bool _isLoading = false;

  //  controllers for contacting
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  //  method for contact form
  Future<void> sendEmail() async {
    setState(() {
      _isLoading = true;
    });
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'moaiz3110@gmail.com.com', // Recipient's email
      query: 'subject=Portfolio Inquiry&body=$messageController',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri).then((value) {
        setState(() {
          _isLoading = false;
        });
        print('Email Sent Successfully!');
      }).onError((error, stackTrace) {
        setState(() {
          _isLoading = false;
        });
        print('Error Sending Email: $error');
      });
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    // * responsive ui elements
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      // * background color
      backgroundColor: Theme.of(context).colorScheme.surface,

      // * app bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        title: _appbarTitle(height),
      ),

      // ! drawer
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Icon(
                Icons.route_outlined,
                color: Colors.white,
                size: height * 0.07,
              ),
              SizedBox(height: height * 0.1),
              ListTile(
                horizontalTitleGap: 20,
                onTap: () async {
                  String url = 'https://github.com/igmoiiz';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    Utils().toastMessage(
                        'Error Redirecting! Please Check your Connection\nand try again');
                  }
                },
                title: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'GitHub',
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
                leading: Image.asset('Assets/Icons/github.png'),
              ),
              SizedBox(height: height * 0.04),
              ListTile(
                horizontalTitleGap: 20,
                onTap: () async {
                  String url =
                      'https://www.linkedin.com/in/moaiz-baloch-a615392b4/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    Utils().toastMessage(
                        'Error Redirecting! Please Check your Connection\nand try again');
                  }
                },
                title: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'LinkedIn',
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
                leading: Image.asset('Assets/Icons/linkedin.png'),
              ),
              SizedBox(height: height * 0.04),
              ListTile(
                horizontalTitleGap: 20,
                onTap: () async {
                  String url = 'https://www.instagram.com/ig_moiiz';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    Utils().toastMessage(
                        'Error Redirecting! Please Check your Connection\nand try again');
                  }
                },
                title: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Instagram',
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
                leading: Image.asset('Assets/Icons/insta.png'),
              ),
              SizedBox(height: height * 0.04),
              ListTile(
                horizontalTitleGap: 20,
                onTap: () async {
                  String url = 'https://wa.me/message/A25K52AC26PTH1';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    Utils().toastMessage(
                        'Error Redirecting! Please Check your Connection\nand try again');
                  }
                },
                title: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Whatsapp',
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
                leading: Image.asset('Assets/Icons/whatsapp.png'),
              ),
              const Spacer(),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made in ',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String url = 'https://pub.dev';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        Utils().toastMessage(
                            'Error Redirecting! Please Check your Connection\nand try again');
                      }
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    ' with Flutter',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),

      // * body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025),
        child: _buildUI(height, width),
      ),
    );
  }

  //  ? portfolio essentials
  // ! app bar title
  Widget _appbarTitle(var height) {
    return AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText(
          'Welcome!',
          textStyle: TextStyle(
            fontSize: height * 0.035,
            fontFamily: 'BaskervvilleSC',
            letterSpacing: .5,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        TyperAnimatedText(
          'Let\'s create something amazing!',
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: height * 0.02,
            fontFamily: 'BaskervvilleSC',
          ),
        ),
      ],
    );
  }

  // ! Body of Page
  Widget _buildUI(var height, var width) {
    return ListView(
      children: [
        SizedBox(height: height * 0.04),
        _portfolioHeader(height, width),
        SizedBox(height: height * 0.03),
        _aboutMe(height, width),
        SizedBox(height: height * 0.03),
        _offerStatus(height, width),
        SizedBox(height: height * 0.02),
        _contactMe(height, width),
      ],
    );
  }

  //  ? portfolio creation

  //  ! header of portfolio
  Widget _portfolioHeader(var height, var width) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          'Hey! I\'m Moiz Baloch!',
          textStyle: TextStyle(
            fontSize: height * 0.025,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        ColorizeAnimatedText(
          'Your Go To Flutter Partner!',
          textStyle: TextStyle(
            fontFamily: 'BaskervvilleSC',
            fontSize: height * 0.025,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          colors: [
            Colors.red,
            Colors.grey.shade300,
            Theme.of(context).colorScheme.primary,
          ],
        ),
      ],
    );
  }

  //  ! about me
  Widget _aboutMe(var height, var width) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: child,
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'Assets/Images/my pic.png',
              fit: BoxFit.cover,
              width: width * 0.5,
              height: height * 0.5,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedTextKit(
            totalRepeatCount: 2,
            animatedTexts: [
              TyperAnimatedText(
                'Allow me to Introduce Myself..!',
                textStyle: TextStyle(
                  fontFamily: 'BaskervvilleSC',
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.03),
        Text(
          textClass.aboutMe,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: height * 0.019,
          ),
        ),
        SizedBox(height: height * 0.02),
        Divider(
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  // ! What do I offer
  Widget _offerStatus(var height, var width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedTextKit(
          totalRepeatCount: 3,
          animatedTexts: [
            TyperAnimatedText(
              'Platforms I Have Worked With..!',
              textStyle: TextStyle(
                fontFamily: 'BaskervvilleSC',
                color: Theme.of(context).colorScheme.tertiary,
                letterSpacing: .5,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.027,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsContainerMobile(
              height: height * 0.25,
              width: width * 0.45,
              icon: Icon(
                Icons.android_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Android',
              backText: textClass.android,
            ),
            OsContainerMobile(
              height: height * 0.25,
              width: width * 0.45,
              icon: Icon(
                Icons.apple_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'IOS',
              backText: textClass.ios,
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsContainerMobile(
              height: height * 0.25,
              width: width * 0.45,
              icon: Icon(
                Icons.desktop_mac_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Desktop',
              backText: textClass.desktop,
            ),
            OsContainerMobile(
              height: height * 0.25,
              width: width * 0.45,
              icon: Icon(
                Icons.web_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Website Application',
              backText: textClass.web,
            ),
          ],
        ),
        SizedBox(height: height * 0.05),
        Divider(
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  // ! Let's Get in Touch..!
  Widget _contactMe(var height, var width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          totalRepeatCount: 2,
          animatedTexts: [
            TyperAnimatedText(
              'What can I help you with?',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                fontFamily: 'BaskervvilleSC',
                fontSize: height * 0.025,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            FlickerAnimatedText(
              'What can I help you with?',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                fontFamily: 'BaskervvilleSC',
                fontSize: height * 0.025,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            TypewriterAnimatedText(
              'What can I help you with?',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                fontFamily: 'BaskervvilleSC',
                fontSize: height * 0.025,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        AboutContainer(
          text: 'Let\'s Get in Touch..!',
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFormField(
                        controller: nameController,
                        icon: Icons.person,
                        hint: 'What\'s your Good Name?',
                        inputType: TextInputType.name,
                        validatorHint: 'Please Enter Your Name!',
                      ),
                      SizedBox(height: height * 0.02),
                      CustomFormField(
                        controller: emailController,
                        icon: Icons.alternate_email,
                        hint: 'Enter your Email Address...',
                        inputType: TextInputType.emailAddress,
                        validatorHint: 'Please Enter Your Email Address!',
                      ),
                      SizedBox(height: height * 0.02),
                      LongFormField(
                        controller: messageController,
                        hint: 'What can I Help you with?',
                        inputType: TextInputType.multiline,
                        validatorHint: 'Please Let me know how can I help you?',
                      ),
                      SizedBox(height: height * 0.02),
                      CustomButton(
                        loading: _isLoading,
                        height: height * 0.08,
                        width: width * 0.00,
                        onTap: () {
                          sendEmail();
                        },
                        text: 'Get in Touch',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // !  Projects showcase
}
