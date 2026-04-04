class PromotionModel {
  final String image; // رابط الصورة أو asset
  final String title; // عنوان العرض
  final String description; // وصف قصير
  final String? ctaUrl; // optional - رابط "اشترِ الآن"

  PromotionModel({
    required this.image,
    required this.title,
    required this.description,
    this.ctaUrl,
  });
}
