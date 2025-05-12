import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_applicarion/core/cache/app_shared_pref.dart';
import 'package:test_applicarion/di.dart';
import 'package:test_applicarion/feature/fullfilment_center/presentation/cubit/fullfilment_center_cubit.dart';

import '../../../../core/constant/constant.dart';
import '../widget/fullfilment_center_list_view_body.dart';

void fullfilmentCenterDialog(
  BuildContext context, {
  void Function()? onDoubleTap,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
        create:
            (context) =>
                FullfilmentCenterCubit(getIt())..getFullfilmentCenter(),
        child: BlocBuilder<FullfilmentCenterCubit, FullfilmentCenterState>(
          builder: (context, state) {
            final cubit = context.read<FullfilmentCenterCubit>();
            return Dialog(
              child:
                  state is FullfilmentCenterLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: ListView.builder(
                          itemBuilder:
                              (context, index) => FullfilmentCenterListViewBody(
                                onDoubleTap: onDoubleTap,
                                line1:
                                    cubit
                                        .fullfilmentCenterModel
                                        ?.fulfillmentCenters
                                        ?.items?[index]
                                        .address
                                        ?.line1 ??
                                    "",
                                onTap: () async {
                                  await SharedPref().set(
                                    fullfilmentCenterId,
                                    cubit
                                        .fullfilmentCenterModel!
                                        .fulfillmentCenters!
                                        .items![index]
                                        .id!,
                                  );
                                  log(
                                    cubit
                                        .fullfilmentCenterModel!
                                        .fulfillmentCenters!
                                        .items![index]
                                        .id!,
                                  );
                                  cubit.changeIndex(index);
                                },
                                borderColor:
                                    cubit.currentIndex == index
                                        ? Colors.orange
                                        : Colors.blueGrey,
                                name:
                                    cubit
                                        .fullfilmentCenterModel
                                        ?.fulfillmentCenters
                                        ?.items?[index]
                                        .name ??
                                    '',
                              ),
                          itemCount:
                              cubit
                                  .fullfilmentCenterModel
                                  ?.fulfillmentCenters
                                  ?.items
                                  ?.length ??
                              0,
                        ),
                      ),
            );
          },
        ),
      );
    },
  );
}
