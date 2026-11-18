import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/extention/extentions.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_edit.dart';

class EventDetails extends StatefulWidget {
  EventModel event;

  EventDetails({super.key, required this.event});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late CategoryModel selectedCategory;
@override
  void initState() {
  selectedCategory = widget.event.category;

  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isOwner = UserModel.loggedUser!.id == widget.event.ownerid;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: InkWell(
            onTap:() => Navigator.pop(context),
            child: Card(
              child: Icon(Icons.arrow_back_ios_new_outlined,),),
          ),
        ),
        title: Text("event_details".tr()),
        actions: isOwner
            ? [
          // Edit Icon
          Card(
            child: IconButton(
              icon: Icon(Icons.edit_outlined,color: Theme.of(context).primaryColor,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditEvent(event: widget.event),
                  ),
                );
              },
            ),
          ),
          // Delete Icon
          Card(
            child: IconButton(
              icon: Icon(Icons.delete_outline, color: AppColors.errorRed),
              onPressed: () {
                _showDeleteConfirmation(context);
              },
            ),
          ),
        ]
            : null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Image
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderSideLight,width:1.5)

                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior:Clip.hardEdge ,
                    child: Image.asset(themeProvider.isDark()?selectedCategory.darkImage:selectedCategory.image,fit: BoxFit.cover,)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.018,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.event.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
                  // Date & Time
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themeProvider.isDark()
                          ? AppColors.darkNavy
                          : AppColors.Lightbg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: themeProvider.isDark()
                            ? AppColors.strokeDark
                            : AppColors.borderSideLight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height*0.018,),//16
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.event.date.showMonthWeekDay,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "${widget.event.time.hour.toString().padLeft(2, '0')}:${widget.event.time.minute.toString().padLeft(2, '0')}",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // Description Title
                  Text(
                    "description".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 12),
                  // Description
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themeProvider.isDark()
                          ? AppColors.darkNavy
                          : AppColors.Lightbg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: themeProvider.isDark()
                            ? AppColors.strokeDark
                            : AppColors.borderSideLight,
                      ),
                    ),
                    child: Text(
                      widget.event.description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
///back here to fix background color
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // ✅ الحل: الخلفية بتتغير مع Light/Dark تلقائي
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        title: Text(
          "delete_event".tr(), // ← المفتاح الصح
          style: Theme.of(context).textTheme.labelMedium,
        ),
        content: Text(
          "are_you_sure".tr(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "cancel".tr(),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseServiecs.deleteEvent(widget.event.id);
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to previous screen
              } catch (e) {
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: AppColors.white, // ← لون النص أبيض على الأحمر
            ),
            child: Text("delete".tr()), // ← المفتاح الجديد
          ),
        ],
      ),
    );
  }
  }
