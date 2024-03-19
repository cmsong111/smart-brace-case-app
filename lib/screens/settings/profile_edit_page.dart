import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/snackbar.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {

  XFile? _imageFile;
  final picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();


  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile?.path);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _uploadImage() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String filePath = 'users/$userId/profile';

      await FirebaseStorage.instance.ref(filePath).putFile(File(_imageFile!.path));

      String downloadURL =
      await FirebaseStorage.instance.ref(filePath).getDownloadURL();

      // Update user's photoURL
      User user = FirebaseAuth.instance.currentUser!;
      await user.updatePhotoURL(downloadURL);

      Snackbar.show(ABC.a, 'Profile image updated', success: true);

    } catch (e) {
      print('Error: $e');
      Snackbar.show(ABC.a, prettyException('Error: ', e), success: false);
    }
  }

  Future<void> _updateDisplayName() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.updateDisplayName(_nameController.text);
      Navigator.pop(context); // Close the dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Display name updated'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating display name: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter New Name'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'New Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateDisplayName();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Profile Edit'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('프로필 사진 변경'),
            subtitle: const Text('User'),
            leading: CircleAvatar(
              child: FirebaseAuth.instance.currentUser?.photoURL != null
                  ? Image.network(FirebaseAuth.instance.currentUser!.photoURL!)
                  : const Icon(Icons.person),
            ),
            onTap: ()  async {
              await _getImage();
              await _uploadImage();
            },
          ),
          ListTile(
            title: const Text("이름 변경"),
            subtitle:
                Text(FirebaseAuth.instance.currentUser?.displayName ?? ''),
            leading: const Icon(Icons.person),
            onTap: () {
              _showNameDialog();
            },
          ),
          ListTile(
            title: const Text("비밀번호 변경"),
            subtitle: const Text('********'),
            leading: const Icon(Icons.lock),
            onTap: () {
              Snackbar.show(ABC.a, 'Password change not implemented', success: false);
            },
          ),
        ],
      ),
    );
  }
}
