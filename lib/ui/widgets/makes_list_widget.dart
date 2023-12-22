import 'package:car_app/cubit/make_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakesListWidget extends StatefulWidget {
  const MakesListWidget(this.vehicleMakes, {super.key});
  final vehicleMakes;
  @override
  State<MakesListWidget> createState() => _MakesListWidgetState();
}

class _MakesListWidgetState extends State<MakesListWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      // Load more data when user reaches the end of the list
      _loadMoreData();
    }
  }

  void _loadMoreData() async {
    if (!_isFetching) {
      setState(() {
        _isFetching = true;
      });
      int page = 1;
      int nextPage = page++;
      await context.read<VehicleMakeCubit>().fetchVehicleMakes(page: nextPage);
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(0),
      itemCount: widget.vehicleMakes.length + (_isFetching ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.vehicleMakes.length) {
          final makeId = widget.vehicleMakes[index].id.toString();
          final makeName = widget.vehicleMakes[index].name;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/models', arguments: {
                'makeId': makeId,
                'makeName': makeName,
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 194, 194),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: ListTile(
                title: Text(
                  widget.vehicleMakes[index].name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Image.asset(
                  'assets/logos/template.png',
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        } else {
          return _isFetching
              ? const CircularProgressIndicator()
              : const Text('No More Vehicles');
        }
      },
    );
  }
}
