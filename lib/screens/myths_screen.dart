import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import '../data/greek_data.dart';

class MyThsScreen extends StatefulWidget {
  const MyThsScreen({Key? key}) : super(key: key);

  @override
  State<MyThsScreen> createState() => _MyThsScreenState();
}

class _MyThsScreenState extends State<MyThsScreen> {
  late List<GreekMyth> myths;

  @override
  void initState() {
    super.initState();
    myths = GreekData.myths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الأساطير اليونانية',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF6600cc),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: myths.length,
        itemBuilder: (context, index) {
          final myth = myths[index];
          return GestureDetector(
            onTap: () {
              _showMythDetails(context, myth);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF6600cc).withOpacity(0.3),
                              Color(0xFF6600cc).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.book,
                            size: 60,
                            color: Color(0xFF6600cc),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myth.titleAr,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1a3a52),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              myth.descriptionAr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              children: myth.characters
                                  .take(2)
                                  .map(
                                    (character) => Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF6600cc).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        character,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Color(0xFF6600cc),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showMythDetails(BuildContext context, GreekMyth myth) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myth.titleAr,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1a3a52),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  myth.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'القصة',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  myth.descriptionAr,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.8,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'الشخصيات',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: myth.characters
                      .map(
                        (character) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF6600cc).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFF6600cc),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            character,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Color(0xFF6600cc),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF6600cc).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFF6600cc).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الدرس المستفاد',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1a3a52),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        myth.lessonAr,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
