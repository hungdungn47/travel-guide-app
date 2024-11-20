import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_guide_app/presentation/controllers/profile_controller.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/ForgetPassword/forget_password_page.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_page.dart';
import 'dart:io';

import 'package:travel_guide_app/utils/helper_functions.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  // final ProfilePageController _controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePicture(),
                Username(),
                SizedBox(height: 20),
                SetTheme(),
                SizedBox(height: 20),
                ChangePasswordButton(),
                LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// THAY DOI AVATAR CHO USER
class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
            child: CircleAvatar(
            radius: 100,
            backgroundImage: _profileImage != null ? FileImage(_profileImage!) : AssetImage('assets/images/profile.jpg'),
            ),
          ),
          FilledButton(
            onPressed: _pickImage,
            child: Text('Change Profile Picture'),
        )
      ],
    );
  }
}


// SET USERNAME CHO USER
class Username extends StatefulWidget {
  Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  bool isEditing = false;
  // TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.text = 'Sarasa Saionji';
  // }

  final ProfilePageController _controller = Get.put(ProfilePageController());  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isEditing
              ? Container(
                  width: 200,
                  child: TextField(
                    // controller: _controller,
                    autofocus: true,
                    onSubmitted: (value) {
                      _controller.editUsername(value, '');
                      showSnackBar(context, "Username changed successfully");
                    },
                  ),
                )
              : Container(
                constraints: BoxConstraints(
                  maxWidth: 200,
                ),
                child: Text(
                    _controller.name.value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
              ),
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
                if (!isEditing) {
                  showSnackBar(context, "Username changed successfully");
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}


// CHON THEME MODE CHO UNG DUNG
enum ThemeModeOption { light, dark, system }

class SetTheme extends StatefulWidget {
  const SetTheme({Key? key}) : super(key: key);

  @override
  _SetThemeState createState() => _SetThemeState();
}

class _SetThemeState extends State<SetTheme> {
  ThemeModeOption _themeModeOption = ThemeModeOption.light;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            'Color Theme:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          ListTile(
            title: Text('Light Mode'),
            leading: Radio(
              value: ThemeModeOption.light,
              groupValue: _themeModeOption,
              onChanged: (value) {
                setState(() {
                  _themeModeOption = value as ThemeModeOption;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            leading: Radio(
              value: ThemeModeOption.dark,
              groupValue: _themeModeOption,
              onChanged: (value) {
                setState(() {
                  _themeModeOption = value as ThemeModeOption;
                });
              },
            ),
          ),
          ListTile(
            title: Text('System'),
            leading: Radio(
              value: ThemeModeOption.system,
              groupValue: _themeModeOption,
              onChanged: (value) {
                setState(() {
                  _themeModeOption = value as ThemeModeOption;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        // TODO: Navigate to change password page
        HelperFunctions.navigateToScreen(screen: ForgetPasswordPage());
      },
      child: Text('Change Password'),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      child: Text('Logout'),
      onPressed: () {
        // TODO: Show logout dialog
        showDialog(
          context: context,
          builder: (context) {
            return LogoutDialog();
          },
        );
        
      },
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // TODO: Navigate to login page
            HelperFunctions.navigateToScreen(screen: LoginPage());
          },
          child: Text('Logout'),
        ),
      ]
    );
  }
}