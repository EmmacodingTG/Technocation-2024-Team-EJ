import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'jay/gradient_container.dart';
import 'package:firebase_core/firebase_core.dart';

int length_users = 0;

FirebaseDatabase database = FirebaseDatabase.instance;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://technovation-2024-12-03-default-rtdb.firebaseio.com/');
DatabaseReference ref = FirebaseDatabase.instance.ref();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // firebase testing

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  DatabaseReference users_list = FirebaseDatabase.instance.ref('users_list');

  // this needs to be removed, but is just put here to keep the list under control

  await users_list.set([
    {
      'name': 'apple',
      'password': 'pie',
      'community_sponsor_name': 'jay',
      'community_sponsor_email': 'jaykuo2020@gmail.com',
      'community_sponsor_phone': '123-456-789',
      'records': [
        {
          'date': '13-03-2024',
          'location': '300 Hazel Street',
          'volunteered_time': '2 hrs 15 min',
          // before and after images are only placeholders right now
          // we need to figure out how to retrieve the images from the user's photos and resize it
          'before_image': 'https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg',
          'after_image': 'https://www.lyricbirdfood.com/media/1869/indigo-bunting.jpg'
        },
        {
          'date': '15-03-2024',
          'location': '100 King Street',
          'volunteered_time': '1 hr 20 min',
          'before_image': 'https://cdn.britannica.com/20/231520-050-9DF96017/tadpole-common-frog-amphibian.jpg',
          'after_image': 'https://static.scientificamerican.com/sciam/cache/file/41DF7DA0-EE58-4259-AA815A390FB37C55_source.jpg?w=1200'
        }
      ]
    },
    {
      'name': 'banana',
      'password': 'bread',
      'community_sponsor_name': 'jay',
      'community_sponsor_email': 'jaykuo2020@gmail.com',
      'community_sponsor_phone': '123-456-789',
      'records': [
        {
          'date': '13-03-2024',
          'location': '300 Hazel Street',
          'volunteered_time': '2 hrs 15 min',
          'before_image': 'https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg',
          'after_image': 'https://www.lyricbirdfood.com/media/1869/indigo-bunting.jpg'
        },
        {
          'date': '15-03-2024',
          'location': '100 King Street',
          'volunteered_time': '1 hr 20 min',
          'before_image': 'https://cdn.britannica.com/20/231520-050-9DF96017/tadpole-common-frog-amphibian.jpg',
          'after_image': 'https://static.scientificamerican.com/sciam/cache/file/41DF7DA0-EE58-4259-AA815A390FB37C55_source.jpg?w=1200'
        }
      ]
    }
  ]);

  final snapshot_user_length = await ref.child('users_list').get();
  if (snapshot_user_length.exists){
    length_users = (snapshot_user_length.value).toString().split("{'name'").length;
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      home: const Scaffold(
        body: GradientContainer(),
      ),
    ),
  );
}
