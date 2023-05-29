import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  final List<Map<String, dynamic>> students = [
    {"name": "Fatima", "phoneNumber": "03123456789", "grade": "A"},
    {"name": "Ramsha", "phoneNumber": "03187654321", "grade": "C"},
    {"name": "Mantasha", "phoneNumber": "03456789321", "grade": "A"},
    {"name": "Muntaha", "phoneNumber": "03214589651", "grade": "A"},
    {"name": "Dua", "phoneNumber": "03001287914", "grade": "A"},
    {"name": "Rayyan", "phoneNumber": "03112158912", "grade": "B"},
    {"name": "Muqeet", "phoneNumber": "03112158913", "grade": "B"},
    {"name": "Mohammad", "phoneNumber": "03891027835", "grade": "B"},
    {"name": "Hadi", "phoneNumber": "0321768914", "grade": "C"},
    {"name": "Miraal", "phoneNumber": "03124583210", "grade": "A"}

  ];

  List<Map<String, dynamic>> filteredStudents = [];
  @override
  initState(){
    filteredStudents = students;
    super.initState();
  }

  void runFilter(String enteredKeyword){
    List<Map<String, dynamic>> results = [];
    if(enteredKeyword.isEmpty){
      results = students;
    }else{
      results = students
          .where((student) {
        final name = student["name"].toLowerCase();
        final phoneNumber = student["phoneNumber"].toLowerCase();
        final grade = student["grade"].toLowerCase();

        return name.contains(enteredKeyword.toLowerCase()) ||
            phoneNumber.contains(enteredKeyword.toLowerCase()) ||
            grade.contains(enteredKeyword.toLowerCase());
      }).toList();
    }
    setState(() {
      filteredStudents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text(
            "Search List",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade900,),
        ),
        backgroundColor: Colors.yellow.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenSize.height*0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 700.0),
              child: TextField(
                onChanged: (value) => runFilter(value),
                decoration: InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(
                    color: Colors.brown.shade800,
                  ),
                  suffixIcon: Icon(Icons.search,
                  color: Colors.brown.shade800,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.brown
                    )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height*0.05,
            ),

            Expanded(
              child: SizedBox(
                height: screenSize.height*0.9,
                width: screenSize.width*0.33,
                child: filteredStudents.isNotEmpty
                    ? ListView.builder(
                  itemCount: filteredStudents.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.teal.shade50,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(filteredStudents[index]['name']),
                      subtitle: RichText(
                        text: TextSpan(
                          text: "${filteredStudents[index]['phoneNumber']}",
                          style: const TextStyle(fontSize: 12, color: Colors.teal),
                          children: <TextSpan>[
                            TextSpan(text: "\n${filteredStudents[index]['grade']}",
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown)),
                          ],
                        ),
                      )
                    ),
                  ),
                )
                    : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
