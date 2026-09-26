import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selecttimr_state.dart';

class SelecttimrCubit extends Cubit<SelecttimrState> {
  SelecttimrCubit() : super(SelecttimrInitial());
}
