import 'package:bloc/bloc.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/services/user_service.dart';

class UserBloc extends Bloc<int, List<UserModel>> {
  UserBloc() : super([]);

  @override
  Stream<List<UserModel>> mapEventToState(int event) async* {
    List<UserModel> userModel = await UserService.getUser(event);
    yield userModel;
  }
}
