import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/Mydata.dart';
import '../../../data/models/2Register_Model/Register_Model.dart';
import '../../../data/models/3AddPost_Model/Posts_Model.dart';
import '../../../data/models/3AddPost_Model/question.dart';
import '../../../presentation/screens/0LearnApp/1ShowData/done_tasks/done_tasks_screen.dart';
import '../../../presentation/screens/0LearnApp/1ShowData/new_tasks/new_tasks_screen.dart';
import '../../../shared/network/local/cache_helper.dart';
import 'Exam_State.dart';

class ExamCubit extends Cubit<HomeStates> {
  ExamCubit() : super(HomeInitialState());

  static ExamCubit get(context) => BlocProvider.of(context);
//____________________________________________________________________________
// Work with Drawer
  SocialUserModel socialUserModel = SocialUserModel();
  void GetStudentInformation({required String StudentEmail}) {
    FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: StudentEmail)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        socialUserModel = SocialUserModel.fromJson(element.data());
      });
      emit(GetStudentInformationState());
    });
  }

//------------------------------------------------------------
  bool? isDark = CacheHelper.getData(key: 'isDark');
  void changeAppMode({required bool fromShared}) {
    if (isDark == null) {
      isDark = false;
    }
    if (fromShared == true) {
      isDark = true;
      CacheHelper.putBoolean(key: 'isDark', value: isDark!).then((value) {
        emit(AppChangeModeState());
      });
    } else {
      isDark = false;
      CacheHelper.putBoolean(key: 'isDark', value: isDark!).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  /////////////////////////////////////////////////////////////////////
  List<Icon> MyIcons = [
    Icon(Icons.add_task),
    Icon(Icons.addchart),
    Icon(Icons.adobe),
    Icon(Icons.air),
    Icon(Icons.align_horizontal_center),
    Icon(Icons.all_inclusive),
    Icon(Icons.architecture),
    Icon(Icons.badge),
    Icon(Icons.balance),
    Icon(Icons.share_sharp)
  ];

///////////////////////////////////////////////////////////////////////
  ///  Get Email and Change Screen
  int currentIndex = 0;
  String? Email;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
  ];

  void changeIndex({required int index, required String StudEmail}) {
    Email = StudEmail;
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

///////////////////////////////////////////////////////////////////////////////
  /// Get Done And New Exames
  ///
  var AllPosts = [];
  void GetAllPosts({required String StudentEmail}) {
    emit(AppGetDatabaseLoadingState());

    FirebaseFirestore.instance
        .collection('DataBase')
        .doc("Table")
        .collection('Posts')
        // .where("dateTime", isEqualTo: DataTime)
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) {
      AllPosts = [];
      event.docs.forEach((element) {
        AllPosts.add(PostModel.fromJson(element.data()));
      });
      print(AllPosts[0].toString());
      SearchAboutUsers(StudentEmail: StudentEmail);
      emit(GetDataSuccessState());
    });
  }

  List Emails = [];
  List NewExames = [];
  List DoneExames = [];
  void SearchAboutUsers({required String StudentEmail}) {
    Emails = [];
    NewExames = [];
    DoneExames = [];
    AllPosts.forEach((element) {
      if (element.Users == null) {
        element.Users = [
          {"Name": "A", "degree": 0}
        ];
      }
      element.Users.forEach((element2) {
        Emails.add(element2["name"].toString());
      });
      if (Emails.contains("$StudentEmail")) {
        DoneExames.add(element);
      } else {
        NewExames.add(element);
      }
      Emails.clear();
    });
    emit(SearchDataState());
  }

  /////////////////////////////////////////////////////////////////////////////////////////
  /// Arangment Student Degree
  List? ArangmentUsers;
  bool? Fiend;
  void ArangmentStudentDegree({required List? data}) {
    Fiend = false;

    data?.forEach((element) async {
      if (element["name"].length == 0) {
        Fiend = true;
      }
    });
    if (Fiend == true) {
      data!.removeAt(0);
      Fiend = false;
    }

    ArangmentUsers = data!..sort((a, b) => b["degree"].compareTo(a["degree"]));
    emit(ArangmentStudentDegreeState());
  }

//////////////////////////////////////////////////////////////////////////////////////
  ///  Work With Exam
  //////////////////////////////////////////////////////////////
  ///  Work with Question Page
  String? FAnswer = null;
  List FinalAnswer = [];
  void ChoiseAnswer(String index) {
    FAnswer = index;
    emit(ChoisAnserState());
  }

  List Data = [];
  List<dynamic> Question = [];
  List<dynamic> Answer = [];
  List<dynamic> CorrectAnswer = [];

  void GetExame({required String IdPosts}) {
    emit(GetExamLoadingState());

    FirebaseFirestore.instance
        .collection('DataBase')
        .doc("Table")
        .collection('Posts')
        .doc(IdPosts.toString())
        .collection("Question")
        .snapshots()
        .listen((event) {
      Data = [];
      Question = [];
      Answer = [];
      CorrectAnswer = [];
      event.docs.forEach((element) {
        Question = element.data()["Question"];
        Answer = element.data()["Answer"];
        CorrectAnswer = element.data()["correctAnswer"];
      });
      print(CorrectAnswer.toString());

      emit(GetExamState());
    });
  }

  int Qindex = 0;
  List AllFInalAnswer = [];
  void ChangeIndexOFQuestion() {
    if (Qindex + 1 == Question.length) {
      Qindex = 0;
      AllFInalAnswer.add(FAnswer);
      FAnswer = null;
    } else {
      Qindex++;
      AllFInalAnswer.add(FAnswer);
      FAnswer = null;
    }
    emit(ChangeIndexOFQuestionState());
  }

  int degree = 0;
  void ComberBetwentowAnswer() {
    degree = 0;
    print(AllFInalAnswer.toString());
    print(CorrectAnswer.toString());
    for (int x = 0; x < CorrectAnswer.length; x++) {
      if (CorrectAnswer[x] == AllFInalAnswer[x]) {
        degree++;
      }
    }
    print(degree.toString());

    emit(ComberBetwentowAnswerState());
  }

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
  /// Work with Update Users in Exames
  var data200 = [];
  void UpdateUsersInExames(
      {required PostModel postModel,
      required String StudentEmail,
      required int Degree,
      required String PostID}) {
    postModel.Users!.add({"name": StudentEmail, "degree": Degree});
    print(postModel.Users);
    print(StudentEmail);

    print(Degree.toString());

    PostModel model = PostModel(
        Users: postModel.Users,
        Id: postModel.Id,
        date: postModel.date,
        desc: postModel.desc,
        title: postModel.title,
        imageUrl: postModel.imageUrl);

    FirebaseFirestore.instance
        .collection('DataBase')
        .doc('Table')
        .collection('Posts')
        .doc(PostID)
        .update(model.toMap())
        .then((value) {
      // getUserInformation();
    }).catchError((error) {
      emit(UpdateUsersInExamesState());
    });
  }
}
