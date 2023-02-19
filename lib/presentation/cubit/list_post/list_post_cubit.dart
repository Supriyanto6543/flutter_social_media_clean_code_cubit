import 'package:bloc/bloc.dart';
import 'package:clean_unlcebob/domain/usecase/get_listpost.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/list_post_entity.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit(this.getListPost) : super(ListPostInitial());

  final GetListPost getListPost;
  static final controller = RefreshController();

  getPostList() async {
    final result = await getListPost.fetchListPost(1);
    result.fold((l) {
      emit(ListPostError(l.toString()));
      controller.refreshCompleted();
    }, (r) {
      emit(ListPostLoaded(r, "Sukses data didapatkan"));
      controller.refreshCompleted();
    });
  }

  getRefresh() {
    getPostList();
  }

  getLoadMore() async {
    var myState = state as ListPostLoaded;
    int totalPages = myState.pages + 1;

    final result = await getListPost.fetchListPost(totalPages);
    result.fold((l) {
      emit(ListPostError(l.toString()));
      controller.loadComplete();
    }, (r) {
      List<ListPostEntity> old = myState.list;
      List<ListPostEntity> result = [...old, ...r];

      emit(ListPostLoaded(result, "Sukses data didapatkan", pages: totalPages));
      controller.loadComplete();
    });
  }
}
