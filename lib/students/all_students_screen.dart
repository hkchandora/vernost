import 'package:flutter/material.dart';
import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/students/all_student_bloc.dart';
import 'package:vernost/util/strings.dart';
import 'package:vernost/util/utility.dart';
import 'package:vernost/util/widgets/error_message_widget.dart';
import 'package:vernost/util/widgets/loading_widget.dart';
import 'package:vernost/util/widgets/no_data_widget.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({Key? key}) : super(key: key);

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {

  AllStudentBloc allStudentBloc = AllStudentBloc();

  @override
  void initState() {
    ///Call Api to get data
    allStudentBloc.getAllStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility.commonAppBar(title: Strings.allStudents, isCenter: false),
      body: listWidget(),
    );
  }


  listWidget(){
    return StreamBuilder(
      stream: allStudentBloc.listAllStudent,
      builder: (context, AsyncSnapshot<List<AllStudentResponseBean>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null) {
            return const NoDataWidget();
          } else {
            return showStudentListWidget(snapshot);
          }
        } else if (snapshot.hasError) {
          return ErrorMessageWidget(error: snapshot.error.toString());
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  showStudentListWidget(AsyncSnapshot<List<AllStudentResponseBean>> snapshot){
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(16, 8, 8, 16),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                      snapshot.data![index].image != null && snapshot.data![index].image!.isNotEmpty
                          ? snapshot.data![index].image!
                          : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
                      fit: BoxFit.fill,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data![index].name ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data![index].gender ?? ""),
                    Text(snapshot.data![index].dateOfBirth ?? ""),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
