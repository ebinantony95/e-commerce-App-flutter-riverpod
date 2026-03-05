import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/address_and_phone/ui/widgets/address_screen.dart';
import 'package:sneakcom_ecom/features/authentication/core/screen_controllers/auth_stateprovier.dart';
import 'package:sneakcom_ecom/features/authentication/ui/create_account.dart';
import 'package:sneakcom_ecom/features/authentication/ui/login.dart';
import 'package:sneakcom_ecom/features/bag/bag.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';
import 'package:sneakcom_ecom/features/buynow/ui/buy_now_screen.dart';
import 'package:sneakcom_ecom/features/home/homepage.dart';
import 'package:sneakcom_ecom/features/onboarding/getstarted_page/getstarted.dart';
import 'package:sneakcom_ecom/features/onboarding/onboarding_pages/core/screen_controllers/onboarding_provider.dart';
import 'package:sneakcom_ecom/features/onboarding/onboarding_pages/onboaring_screen.dart';
import 'package:sneakcom_ecom/features/payment%20screen/core/models/payment_model.dart';
import 'package:sneakcom_ecom/features/payment%20screen/ui/payment_screen.dart';
import 'package:sneakcom_ecom/features/product_detailed/produt_details/ui/product_details_page.dart';
import 'package:sneakcom_ecom/features/store/store.dart';
import 'package:sneakcom_ecom/features/wishlist/ui/widgets/wishlist_page.dart';
import 'package:sneakcom_ecom/navigators/bottomNAVbar/bottom_navshell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final onboardingAsync = ref.watch(onboardingStatusProvider);

  return GoRouter(
    initialLocation: '/onboarding',

    redirect: (context, state) {
      final isLoggedIn = authState.value != null;

      //  Wait until onboarding status loads
      if (onboardingAsync.isLoading) {
        return '/onboarding';
      }
      final hasOnboarded = onboardingAsync.value ?? false;

      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/create_account';

      final isOnboarding =
          state.matchedLocation == '/onboarding' ||
          state.matchedLocation == '/get_started';

      //  FIRST TIME USER → must see onboarding
      if (!isLoggedIn && !hasOnboarded && !isOnboarding && !isAuthRoute) {
        return '/onboarding';
      }

      //  Not logged in → block protected pages
      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }

      // Logged in → block auth & onboarding
      if (isLoggedIn && (isAuthRoute || isOnboarding)) {
        return '/home';
      }

      return null;
    },

    routes: [
      // onboarding screen
      GoRoute(
        path: '/onboarding',
        name: 'onboardingScreen',
        builder: (context, state) => OnboaringScreen(),
      ),

      // get started
      GoRoute(
        path: '/get_started',
        name: 'getStarted',
        builder: (context, state) => Getstarted(),
      ),

      // login
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => Login(),
      ),

      // create account
      GoRoute(
        path: '/create_account',
        name: 'createAcc',
        builder: (context, state) => CreateAccount(),
      ),
      // wishlist
      GoRoute(
        path: '/wishlist',
        name: 'wishlist',
        builder: (context, state) => WishlistPage(),
      ),

      // buy now screen
      GoRoute(
        path: '/buyNow',
        name: 'buyNow',
        builder: (context, state) {
          final items = state.extra as List<BuyNowItem>;

          return BuyNowScreen(items: items);
        },
      ),

      // address screen
      GoRoute(
        path: '/address',
        name: 'address',
        builder: (context, state) => AddressScreen(),
      ),

      // payment
      GoRoute(
        path: '/payment',
        name: 'payment',
        builder: (context, state) {
          final checkout = state.extra;

          if (checkout == null || checkout is! CheckoutModel) {
            return const Scaffold(
              body: Center(child: Text("No checkout data")),
            );
          }

          return PaymentScreen(checkout: checkout);
        },
      ),

      // main app with Bottom NAV bar
      ShellRoute(
        builder: (context, state, child) => BottomNavshell(child: child),
        routes: [
          // home.........
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => Homepage(),
          ),
          // strore......
          GoRoute(
            path: '/store',
            name: 'store',
            builder: (context, state) => Store(),
          ),
          // account......
          // GoRoute(
          //   path: '/account',
          //   name: 'account',
          //   builder: (context, state) => Account(),
          // ),
          //bag...
          GoRoute(
            path: '/bag',
            name: 'bag',
            builder: (context, state) => Bag(),
          ),
          // product details page with param-id
          // inside main shell because to show the nav bar in screen
          GoRoute(
            path: '/product-details/:id',
            name: 'productDetails',
            builder: (context, state) {
              {
                final productId = state.pathParameters['id']!;
                return ProductDetailsPage(productId: productId);
              }
            },
          ),
        ],
      ),
    ],
  );
});
