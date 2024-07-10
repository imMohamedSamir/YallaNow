import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DrRequiredPapers extends StatelessWidget {
  const DrRequiredPapers({super.key});
  static List<String> papersData = [
    "صورة البطاقة أمامي و خلفي (إجباري)",
    "صورة رخصة القيادة أمامي و خلفي (إجباري)",
    "صورة رخصة السكوتر أمامي و خلفي (إجباري)",
    "فيش وتشبية موجه لشركة يلا ناو (إجباري)",
    " تحليل مخدرات"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppLang.isArabic() ? 0 : 8.0,
          right: AppLang.isArabic() ? 8 : 0),
      child: Column(
        children: List.generate(
            papersData.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PaperCard(data: papersData[index]),
                )),
      ),
    );
  }
}

class PaperCard extends StatelessWidget {
  const PaperCard({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, color: Colors.black, size: 8),
        const Gap(8),
        Text(data, style: AppStyles.styleMedium14(context))
      ],
    );
  }
}
