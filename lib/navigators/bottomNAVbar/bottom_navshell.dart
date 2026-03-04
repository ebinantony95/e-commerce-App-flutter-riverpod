import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_count_provider.dart';
import 'package:sneakcom_ecom/util/constants/sizes.dart';

class BottomNavshell extends ConsumerWidget {
  final Widget child;
  const BottomNavshell({super.key, required this.child});

  int _getIndex(String location) {
    if (location.startsWith('/store')) return 1;
    if (location.startsWith('/bag')) return 2;
    // if (location.startsWith('/bag')) return 3;
    return 0;
  }

  void _ontap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/store');
        break;
      case 2:
        context.go('/bag');
        break;
      // case 3:
      //   context.go('/bag');
      //   break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _getIndex(location);
    final cartCount = ref.watch(cartCountProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSizes.navBarHeight,

          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) => _ontap(context, value),
            type: BottomNavigationBarType.fixed,
            iconSize: 26,
            selectedFontSize: 11,
            unselectedFontSize: 11,

            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.storefront_outlined),
                activeIcon: Icon(Icons.storefront),
                label: 'Store',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.person_outline),
              //   activeIcon: Icon(Icons.person),
              //   label: 'Account',
              // ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag_outlined),

                    if (cartCount > 0)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'Bag',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
