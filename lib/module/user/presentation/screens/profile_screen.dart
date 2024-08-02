import 'package:edge_pro/core/app_injection/app_injection.dart';
import 'package:edge_pro/core/app_router/app_router.dart';
import 'package:edge_pro/core/constants/app_colors.dart';
import 'package:edge_pro/core/network/network_checker.dart';
import 'package:edge_pro/core/utils/validator.dart';
import 'package:edge_pro/core/widgets/app_text_form_field.dart';
import 'package:edge_pro/module/user/data/models/user.dart';
import 'package:edge_pro/module/user/presentation/bloc/user_bloc.dart';
import 'package:edge_pro/module/user/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    UserBloc.of(context).clearControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is SuccessCashedUserState) {
          AppRouter.offAll(const HomeScreen());
        }
      },
      builder: (context, state) {
        UserBloc userBloc = UserBloc.of(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Profile',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary)),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  children: [
                    AppTextFormField(
                        keyboardType: TextInputType.name,
                        hint: 'first name',
                        controller: userBloc.firstNameController,
                        validator: (value) =>
                            Validator.requiredFieldValidator(value)),
                    20.verticalSpace,
                    AppTextFormField(
                        keyboardType: TextInputType.name,
                        hint: 'middle Name',
                        controller: userBloc.middleNameController,
                        validator: (value) =>
                            Validator.requiredFieldValidator(value)),
                    20.verticalSpace,
                    AppTextFormField(
                        keyboardType: TextInputType.name,
                        hint: 'last name',
                        controller: userBloc.lastNameController,
                        validator: (value) =>
                            Validator.requiredFieldValidator(value)),
                    20.verticalSpace,
                    AppTextFormField(
                        keyboardType: TextInputType.name,
                        hint: 'address',
                        controller: userBloc.addressController,
                        validator: (value) =>
                            Validator.requiredFieldValidator(value)),
                    100.verticalSpace,
                    MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          User user = User(
                            firstName: userBloc.firstNameController.text,
                            middleName: userBloc.middleNameController.text,
                            lastName: userBloc.lastNameController.text,
                            address: userBloc.addressController.text,
                          );
                          userBloc.add(CacheUserEvent(user: user));
                          if (await sl<NetworkChecker>().isConnected) {
                            userBloc.add(CallApiEvent());
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      color: AppColors.primary,
                      minWidth: 200.w,
                      child: (state is LoadingCacheUserState)
                          ? const CircularProgressIndicator()
                          : Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
