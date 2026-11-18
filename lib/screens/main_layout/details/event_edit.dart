import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_tab_bar.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/extention/extentions.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EditEvent extends StatefulWidget {
  EventModel event;

  EditEvent({super.key, required this.event});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late CategoryModel selectedCategory;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event.title);
    descriptionController =
        TextEditingController(text: widget.event.description);
    dateController =
        TextEditingController(text: widget.event.date.showMonthWeekDay);
    timeController = TextEditingController(
        text:
        "${widget.event.time.hour.toString().padLeft(2, '0')}:${widget.event.time.minute.toString().padLeft(2, '0')}");
    selectedCategory = widget.event.category;
    selectedDate = widget.event.date;
    selectedTime = widget.event.time;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

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
        title: Text("event_edit".tr()),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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

                CustomTabBar(
                  currentCategory: (category){
                    setState(() {
                      selectedCategory=category;
                    });

                  },
                  categories:CategoryModel.categories,
                  //TODO selected fr should be white
                  selectedbg: Theme.of(context).primaryColor,
                  unselectedbg:Theme.of(context).scaffoldBackgroundColor ,
                  selectedfg: Theme.of(context).scaffoldBackgroundColor ,
                  unselectedfg: Theme.of(context).textTheme.bodySmall!.color!,
                  selectedicon:Theme.of(context).scaffoldBackgroundColor ,
                  unselectedicon:Theme.of(context).primaryColor ,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
                Text("title".tr(),style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: MediaQuery.of(context).size.height*0.009,),//8
                CustomTextField(
                        hintText: "event_title".tr(),
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event title";
                          }
                          return null;
                        },
                      ),
                SizedBox(height: MediaQuery.of(context).size.height*0.018,),
                Text("description".tr(),style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: MediaQuery.of(context).size.height*0.009,),//8
                      CustomTextField(
                        hintText: "Event description",
                        controller: descriptionController,
                        maxlines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event description";
                          }
                          return null;
                        },
                      ),
                SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
                      // Date Picker
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("event_date".tr(),
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(width: MediaQuery.of(context).size.height*0.009,),//8
                                InkWell(
                                  onTap: () async {
                                    DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate ?? DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(
                                          Duration(days: 365)),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        selectedDate = picked;
                                        dateController.text =
                                            picked.showMonthWeekDay;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: CustomTextField(
                                      hintText: "Select date",
                                      controller: dateController,
                                      suffixIcon: Icon(Icons.calendar_month,color: Theme.of(context).primaryColor,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
                      // Time Picker
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("event_time".tr(),
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(height: 8),
                                InkWell(
                                  onTap: () async {
                                    TimeOfDay? picked = await showTimePicker(
                                      context: context,
                                      initialTime: selectedTime ?? TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        selectedTime = picked;
                                        timeController.text =
                                        "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: CustomTextField(
                                      hintText: "Select time",
                                      controller: timeController,
                                      suffixIcon: Icon(Icons.access_time,color: Theme.of(context).primaryColor,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: MediaQuery.of(context).size.height*0.044,),                    // Update Button
                CustomElevatedButton(
                    onPress: _updateEvent,
                    hintText: "update_event".tr()),

                SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
                    ],
                  ),
          ),
              ),

          ),


    );
  }

  void _updateEvent() async {
    if (_formKey.currentState!.validate()) {
      if (selectedDate == null || selectedTime == null) {
        FirebaseServiecs.Tosta(
            msg: "please_select_date_time", bgColor: Colors.red);
        return;
      }

      try {
        EventModel updatedEvent = EventModel(
          id: widget.event.id,
          category: selectedCategory,
          title: titleController.text,
          description: descriptionController.text,
          date: selectedDate!,
          time: selectedTime!,
          ownerid: widget.event.ownerid,
        );

        await FirebaseServiecs.updateEvent(updatedEvent);
        Navigator.pop(context);
      } catch (e) {
        FirebaseServiecs.Tosta(msg: e.toString(), bgColor: Colors.red);
      }
    }
  }
}