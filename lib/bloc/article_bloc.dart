import 'package:bloc/bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/article_service.dart';

enum ArticleEvent { to_get }

class ArticleBloc extends Bloc<ArticleEvent, List<ArticleModel>> {
  ArticleBloc() : super([]);

  @override
  Stream<List<ArticleModel>> mapEventToState(ArticleEvent event) async* {
    if (event == ArticleEvent.to_get) {
      List<ArticleModel> articleModel = await ArticleService.getArticles();
      yield articleModel;
    } else {
      print("ERROR");
    }
  }   
}
