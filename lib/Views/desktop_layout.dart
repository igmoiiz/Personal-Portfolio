import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_portfolio/Components/about_container.dart';
import 'package:e_portfolio/Components/os_container.dart';
import 'package:e_portfolio/Services/Text%20Class/text_class.dart';
import 'package:e_portfolio/Services/Utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold>
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

  //  controllers for contacting
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

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
        centerTitle: true,
        title: _appbarTitle(height),
      ),

      // ! drawer
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'Assets/Icons/aot.png',
                fit: BoxFit.contain,
              ),
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
            const Spacer(),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
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
            fontSize: height * 0.045,
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
            fontSize: height * 0.035,
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
        SizedBox(height: height * 0.08),
        _portfolioHeader(height, width),
        SizedBox(height: height * 0.03),
        _aboutMe(height, width),
        SizedBox(height: height * 0.05),
        _offerStatus(height, width),
        SizedBox(height: height * 0.1),
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
            fontSize: height * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        ColorizeAnimatedText(
          'Your Go To Flutter Partner!',
          textStyle: TextStyle(
            fontFamily: 'BaskervvilleSC',
            fontSize: height * 0.05,
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
              'assets/images/my pic.png',
              width: width * 0.4,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Allow me to Introduce Myself..!',
                textStyle: TextStyle(
                  fontFamily: 'BaskervvilleSC',
                  color: Theme.of(context).colorScheme.tertiary,
                  letterSpacing: .5,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.05,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.06),
        Text(
          textClass.aboutMe,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: height * 0.026,
          ),
        ),
        SizedBox(height: height * 0.08),
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
          animatedTexts: [
            TyperAnimatedText(
              'Services I Offer..!',
              textStyle: TextStyle(
                fontFamily: 'BaskervvilleSC',
                color: Theme.of(context).colorScheme.tertiary,
                letterSpacing: .5,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.05,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.06),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsContainer(
              height: height * 0.35,
              width: width * 0.2,
              icon: Icon(
                Icons.android_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Android',
              backText: textClass.android,
            ),
            OsContainer(
              height: height * 0.35,
              width: width * 0.2,
              icon: Icon(
                Icons.apple_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'IOS',
              backText: textClass.ios,
            ),
            OsContainer(
              height: height * 0.35,
              width: width * 0.2,
              icon: Icon(
                Icons.desktop_mac_outlined,
                size: height * 0.06,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Desktop',
              backText: textClass.desktop,
            ),
            OsContainer(
              height: height * 0.35,
              width: width * 0.2,
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
      ],
    );
  }

  // ! Let's Get in Touch..!
  Widget _contactMe(var height, var width) {
    return AboutContainer(
      text: 'Let\'s Get in Touch..!',
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                FlickerAnimatedText(
                  'What can I help you with?',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontFamily: 'BaskervvilleSC',
                    fontSize: height * 0.045,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                  ),
                  TextFormField(
                    controller: emailController,
                  ),
                  TextFormField(
                    controller: messageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // !  Projects showcase
}
