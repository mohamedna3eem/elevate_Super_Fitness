import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileRow extends StatelessWidget {
 final String icon;
 final String tittle;
 final IconData icon2;
   const CustomProfileRow(
       {super.key,
     required this.icon,
     required this.tittle,
     required this.icon2,
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Image.asset(icon,color: AppColors.mainColorL,),
        SizedBox(width: 16.w,),
    Text(tittle,style: Theme.of(context).textTheme.bodyMedium?.
    copyWith(color: AppColors.white),),
        const Spacer(),
        Icon(icon2,color: AppColors.mainColorL,)
      ],
    );
  }
}
