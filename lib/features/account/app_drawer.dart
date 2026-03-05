import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/authentication/core/screen_controllers/auth_stateprovier.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi ${user?.email ?? 'User'}",
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              _drawerItem(
                icon: Icons.person_outline,
                title: "Address and Phone",
                onTap: () {
                  context.pushNamed('address');
                },
              ),

              _drawerItem(
                icon: Icons.shopping_bag_outlined,
                title: "Orders",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.favorite_border,
                title: "Wishlist",
                onTap: () {},
              ),

              const Spacer(),

              _drawerItem(
                icon: Icons.logout,
                title: "Logout",
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _drawerItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
}
