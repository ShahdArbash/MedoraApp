import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting&profile/data/model/update_profile_request.dart';
import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting&profile/logic/update_profile/update_profile_cubit.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/EditView/edit_photo_section.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/EditView/gender_bottom_sheet_field.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/EditView/profile_filed.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/EditView/section_card.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.user});

  final UserProfileModel user;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController genderController;
  late final TextEditingController birthDateController;

  String? selectedGender;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.user.name);

    emailController = TextEditingController(text: widget.user.email);

    phoneController = TextEditingController(text: widget.user.phone);

    genderController = TextEditingController(text: widget.user.gender);

    birthDateController = TextEditingController(text: widget.user.birthDate);

    selectedGender = widget.user.gender;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    birthDateController.dispose();

    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    DateTime? initialDate;

    if (birthDateController.text.isNotEmpty) {
      try {
        initialDate = DateTime.parse(birthDateController.text);
      } catch (_) {
        initialDate = null;
      }
    }

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('ar'),
    );

    if (pickedDate != null) {
      setState(() {
        birthDateController.text =
            '${pickedDate.year}-'
            '${pickedDate.month.toString().padLeft(2, '0')}-'
            '${pickedDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _saveProfile() {
    final request = UpdateProfileRequest(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      birthDate: birthDateController.text.trim(),
      gender: selectedGender ?? '',
    );

    context.read<UpdateProfileCubit>().updateProfile(request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          Navigator.pop(context, state.user);
        }

        if (state is UpdateProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        final isLoading = state is UpdateProfileLoading;

        return Scaffold(
          appBar: AppBar(
            title: Text("تعديل حسابي", style: CairoFonts.bold(fontSize: 20)),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                const SizedBox(height: 2),

                EditPhotoSection(image: widget.user.avatarUrl!),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  child: SectionCard(
                    title: 'المعلومات الشخصية',
                    child: Column(
                      spacing: 10,
                      children: [
                        ProfileFiled(
                          text: 'الاسم الكامل',
                          icon: Icons.person_2_outlined,
                          controller: nameController,
                        ),

                        ProfileFiled(
                          text: 'البريد الإلكتروني',
                          icon: Icons.email_outlined,
                          controller: emailController,
                        ),

                        ProfileFiled(
                          text: 'رقم الهاتف',
                          icon: Icons.phone,
                          controller: phoneController,
                        ),

                        GestureDetector(
                          onTap: _selectBirthDate,
                          child: AbsorbPointer(
                            child: ProfileFiled(
                              text: 'تاريخ الميلاد',
                              icon: Icons.calendar_month_outlined,
                              controller: birthDateController,
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الجنس',
                              style: CairoFonts.semiBold(fontSize: 12),
                            ),

                            const SizedBox(height: 8),

                            GenderBottomSheetField(
                              value: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GenericButton(
                label: 'حفظ الإعدادات',
                onPressed: _saveProfile,
                isLoading: isLoading,
                isEnabled: !isLoading,
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
                hasBorder: false,
                hasShadow: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
