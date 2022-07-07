import 'package:flutter/material.dart';
import 'package:network_template/core/networking/models/api_response.dart';
import 'package:network_template/module/models/sample.dart';
import 'package:network_template/module/view_models/sample_view_model.dart';
import 'package:provider/provider.dart';

class SampleScreen extends StatefulWidget {
  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  void fetchData() {
    context.read<SampleViewModel>().fetchMediaData();
  }

  Widget getDataWidget(BuildContext context, ApiResponse apiResponse) {
    var mediaList = apiResponse.data as List<Sample>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        if (mediaList != null && mediaList.first.title != null) {
          return Center(
            child: Text('Response Title is\n${mediaList.first.title!}'),
          );
        } else {
          return Center(
            child: Text('No Data !'),
          );
        }
      case Status.ERROR:
        return Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return Center(
          child: ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Get Data'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiResponse = context.watch<SampleViewModel>().response;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: getDataWidget(context, apiResponse)),
        ],
      ),
    );
  }
}