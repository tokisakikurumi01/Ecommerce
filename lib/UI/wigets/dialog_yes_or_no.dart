part of 'widgets.dart';

class YesOrNoDialog {
  static Future<bool> show(BuildContext context,
      {required String title, required String desc}) async {
    bool returnValue = false;

    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 2,
              backgroundColor: Colors.white,
              child: Container(
                  height: 32.0.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 2.0.h),
                          child: Text(title,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 2.0.h),
                          width: double.infinity,
                          height: 0.2.w,
                          color: Colors.black87),
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                children: [
                                  Flexible(
                                      flex: 6,
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0.w),
                                          child: Text(desc,
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontSize: 12.0.sp,
                                                  color: Colors.black87)))),
                                  Flexible(
                                      flex: 4,
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0.w,
                                              vertical: 3.0.w),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  flex: 10,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10),
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                width: 0.5.w,
                                                                color: Theme.of(context)
                                                                    .primaryColor)),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text('Tidak',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    12.0.sp,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight: FontWeight
                                                                    .bold))),
                                                  )),
                                              Flexible(
                                                  flex: 1,
                                                  child: SizedBox(
                                                      width: double.infinity)),
                                              Flexible(
                                                  flex: 10,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      returnValue = true;
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text('Ya',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    12.0.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                  ))
                                            ],
                                          )))
                                ],
                              )))
                    ],
                  )));
        });

    return returnValue;
  }
}
