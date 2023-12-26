import 'package:car_app/cubit/vin/vin_cubit.dart';
import 'package:car_app/cubit/vin/vin_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/ui/widgets/appbar_widget.dart';
import 'package:car_app/ui/widgets/drawer_widget.dart';
import 'package:car_app/ui/widgets/vin_page_widgets/vin_data_widget.dart';
import 'package:car_app/ui/widgets/vin_page_widgets/vin_error_widget.dart';
import 'package:car_app/ui/widgets/vin_page_widgets/vin_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VinDecoderPage extends StatefulWidget {
  const VinDecoderPage({super.key});

  @override
  State<VinDecoderPage> createState() => _VinDecoderPageState();
}

class _VinDecoderPageState extends State<VinDecoderPage> {
  final VinDecoderCubit _vinDecoderCubit = getIt.get<VinDecoderCubit>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    String vin = _myController.text;
    FocusScope.of(context).unfocus();
    if (vin.isNotEmpty) {
      _vinDecoderCubit.fetchVehicleModels(vin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBarWidget(_scaffoldKey),
      body: BlocBuilder<VinDecoderCubit, VinDecoderState>(
        bloc: _vinDecoderCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextSelectionTheme(
                  data: TextSelectionThemeData(
                    selectionColor: Colors.blue,
                    cursorColor: Colors.blue,
                    selectionHandleColor: Colors.blue,
                  ),
                  child: SelectableText(
                    'Vin example: 3VWD17AJ1FM952961.\n (You can copy this text.)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(220, 255, 255, 255)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                VinInputField(controller: _myController),
                const SizedBox(height: 20.0),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      child: const Text(
                        'Decode VIN',
                        style:
                            TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
                      ),
                    ),
                  ),
                ),
                if (state is VinDecoderLoading) ...[
                  const SizedBox(height: 40.0),
                  const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
                const SizedBox(height: 20.0),
                if (state is VinDecoderLoaded) ...[
                  VinDataSection(state: state)
                ],
                const SizedBox(height: 20),
                if (state is VinDecoderError) ...[
                  const VinErrorSection(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
