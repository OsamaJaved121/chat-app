// ignore_for_file: constant_identifier_names, unused_field

//Packages
import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "Users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "Messages";

class DatabaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService();
}