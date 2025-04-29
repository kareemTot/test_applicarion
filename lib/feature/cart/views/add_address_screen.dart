import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/constant/constant.dart';
import 'package:test_applicarion/core/func/show_toast.dart';
import 'package:test_applicarion/core/widget/cstom_text_form_filed.dart';
import 'package:test_applicarion/core/widget/custom_app_button.dart';
import 'package:test_applicarion/feature/cart/service/add_cart_address_ql.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _line1Controller = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _line1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Address'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: Mutation(
          options: MutationOptions(
            onCompleted: (data) {
              if (data != null) {
                log("address is added successfully and Data is $data");
                showToast(
                  message: "address is added successfully",
                  backgroundColor: Colors.green,
                );
              }
            },
            onError: (error) {
              showToast(
                message: error.toString(),
                backgroundColor: Colors.redAccent,
              );
              log(error.toString());
            },
            document: gql(addAddressQl),
            variables: {
              'cityName': _cityController.text,
              'countryName': _countryController.text,
              'firstName': _firstnameController.text,
              'lastName': _lastNameController.text,
              'line1': _line1Controller.text,
            },
          ),

          builder:
              (runMutation, result) => Form(
                key: _formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    CustomTextFormFiled(
                      controller: _firstnameController,
                      hintText: "First Name",
                      validator: (val) {
                        return val!.isEmpty ? validationText : null;
                      },
                    ),
                    CustomTextFormFiled(
                      controller: _lastNameController,
                      hintText: "Last Name",
                      validator: (val) {
                        return val!.isEmpty ? validationText : null;
                      },
                    ),
                    CustomTextFormFiled(
                      controller: _cityController,
                      hintText: "City",
                      validator: (val) {
                        return val!.isEmpty ? validationText : null;
                      },
                    ),
                    CustomTextFormFiled(
                      controller: _line1Controller,
                      hintText: "Line1",
                      validator: (val) {
                        return val!.isEmpty ? validationText : null;
                      },
                    ),
                    CustomTextFormFiled(
                      controller: _countryController,
                      hintText: "Country",
                      validator: (val) {
                        return val!.isEmpty ? validationText : null;
                      },
                    ),
                    SizedBox(height: 60),
                    result!.isLoading
                        ? const CircularProgressIndicator()
                        : CustomAppButton(
                          text: "Save",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              runMutation({
                                'cityName': _cityController.text,
                                'countryName': _countryController.text,
                                'firstName': _firstnameController.text,
                                'lastName': _lastNameController.text,
                                'line1': _line1Controller.text,
                              });
                            }
                          },
                          containerColor: Colors.orange,
                        ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
