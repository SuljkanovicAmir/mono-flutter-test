import 'package:car_app/cubit/make/make_cubit.dart';
import 'package:car_app/cubit/make/make_state.dart';
import 'package:car_app/ui/widgets/makes_page_widgets/makes_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MakesDataWidget extends StatefulWidget {
  final bool isAscending;
  final Function toggleSort;

  const MakesDataWidget({
    Key? key,
    required this.isAscending,
    required this.toggleSort,
  }) : super(key: key);

  @override
  State<MakesDataWidget> createState() => _MakesDataWidgetState();
}

class _MakesDataWidgetState extends State<MakesDataWidget> {
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleMakeCubit, VehicleMakeState>(
        builder: (context, state) {
      if (state is VehicleMakeInitial) {
        context.read<VehicleMakeCubit>().fetchVehicleMakes();
      }
      if (state is VehicleMakeLoading) {
        const SizedBox(
          height: 200,
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          )),
        );
      }
      if (state is VehicleMakeError) {
        return const Text('No Data');
      }
      if (state is VehicleMakeLoaded) {
        final vehicleMakes = state.data;

        vehicleMakes.sort((a, b) {
          if (widget.isAscending) {
            return a.name.compareTo(b.name);
          } else {
            return b.name.compareTo(a.name);
          }
        });

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: (const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                    onPressed: () {
                      setState(() {
                        showSearch = !showSearch;
                      });
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      widget.isAscending
                          ? 'assets/icons/a.svg'
                          : 'assets/icons/z.svg',
                      width: 28,
                      height: 28,
                    ),
                    onPressed: () => {widget.toggleSort()},
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: MakesListWidget(vehicleMakes, showSearch),
            ),
          ],
        );
      }
      return Container(
        height: 200,
      );
    });
  }
}
