import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persona_r/pages/login_page.dart';

class ProfileMenu extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileMenu({super.key});

  // Show confirmation dialog
  Future<bool> showConfirmationDialog(
      BuildContext context, String title, String content) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Confirm'),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  // Show error dialog
  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Logout method with fixed navigation
  Future<void> logout(BuildContext context) async {
    bool confirm = await showConfirmationDialog(
      context,
      'Logout',
      'Are you sure you want to logout?',
    );

    if (confirm) {
      try {
        await _auth.signOut();
        if (context.mounted) {
          // Clear all routes and push to login page
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          showErrorDialog(context, 'Failed to logout: ${e.toString()}');
        }
      }
    }
  }

  // Delete account method with fixed navigation
  Future<void> deleteAccount(BuildContext context) async {
    bool confirm = await showConfirmationDialog(
      context,
      'Delete Account',
      'Are you sure you want to delete your account? This action cannot be undone.',
    );

    if (confirm) {
      try {
        await _auth.currentUser?.delete();
        if (context.mounted) {
          // Clear all routes and push to login page
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          showErrorDialog(
            context,
            'Failed to delete account. Please re-authenticate and try again.',
          );
        }
      }
    }
  }

  void showProfileBottomSheet(BuildContext context) {
    final User? user = _auth.currentUser;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              user?.displayName ?? 'User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user?.email ?? '',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close bottom sheet first
                logout(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.red),
              title: Text(
                'Delete Account',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context); // Close bottom sheet first
                deleteAccount(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showProfileBottomSheet(context),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_outline,
          size: 35,
        ),
      ),
    );
  }
}
