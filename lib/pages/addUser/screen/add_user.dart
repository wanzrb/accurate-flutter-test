import 'package:accurate_test/const/color.dart';
import 'package:accurate_test/pages/addUser/bloc/add_user_bloc.dart';
import 'package:accurate_test/pages/addUser/cubit/add_user_cubit.dart';
import 'package:accurate_test/pages/addUser/widgets/custom_textfeld.dart';
import 'package:accurate_test/pages/addUser/widgets/dropdown_city.dart';
import 'package:accurate_test/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final TextEditingController nameC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneNumberC = TextEditingController();
  final TextEditingController cityC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddUserBloc addUserBloc = context.read<AddUserBloc>();
    AddUserCubit addUserCubit = context.read<AddUserCubit>();
    HomeBloc homeBloc = context.read<HomeBloc>();

    return Scaffold(
      backgroundColor: ColorApp.lightBlue1,
      appBar: AppBar(
        backgroundColor: ColorApp.lightBlue1,
        title: const Text("Tambah User"),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nama',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: nameC,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Alamat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: addressC,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: emailC,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nomor Handphone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: phoneNumberC,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Kota',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const DropDownCity(),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AddUserBloc, AddUserState>(
                listener: (context, state) {
                  if (state is AddUserStatePostSuccess) {
                    homeBloc.add(HomeEventGetUser());
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Berhasil')));
                    context.pop();
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: state is AddUserStatePostLoading
                        ? null
                        : () {
                            if (nameC.text.isNotEmpty &&
                                addressC.text.isNotEmpty &&
                                emailC.text.isNotEmpty &&
                                phoneNumberC.text.isNotEmpty) {
                              addUserBloc.add(AddUserEventPost(
                                  name: nameC.text,
                                  address: addressC.text,
                                  email: emailC.text,
                                  phoneNumber: phoneNumberC.text,
                                  city: addUserCubit.state));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Tidak boleh ada yang kosong')));
                            }
                          },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            ColorApp.mediumBlue1,
                            ColorApp.mediumBlue2
                          ])),
                      child: Center(
                          child: state is AddUserStatePostLoading
                              ? LoadingAnimationWidget.waveDots(
                                  color: ColorApp.darkBlue, size: 30)
                              : const Text(
                                  'Simpan',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
