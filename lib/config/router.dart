import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/widgets/bottomnavbar.dart';
import 'package:tripsharemobile_s4/screens/home.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(name: 'home', path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      name: 'create/edit itinerary',
      path: '/create',
      builder: (context, state) => Placeholder(),
    ),
  ],
);
