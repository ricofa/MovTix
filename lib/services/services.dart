import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mov_tix/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:mov_tix/shared/shared.dart';
import 'package:mov_tix/extensions/extensions.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';