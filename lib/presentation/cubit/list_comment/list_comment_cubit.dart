import 'package:bloc/bloc.dart';
import 'package:clean_unlcebob/domain/usecase/get_listcomment.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/list_comment_entity.dart';

part 'list_comment_state.dart';

class ListCommentCubit extends Cubit<ListCommentState> {
  ListCommentCubit(this.getListComment) : super(ListCommentInitial());

  final GetListComment getListComment;
  static final controller = RefreshController();

  getCommentList() async {
    final result = await getListComment.fetchListComment(1);
    result.fold((l) {
      emit(ListCommentError(l.toString()));
      controller.refreshCompleted();
    }, (r) {
      emit(ListCommentLoaded(r, "List comment berhasil diload"));
      controller.refreshCompleted();
    });
  }

  getRefresh() async {
    getCommentList();
  }

  getLoadMore() async {
    var myState = state as ListCommentLoaded;
    int currentPages = myState.pages + 1;

    final result = await getListComment.fetchListComment(currentPages);
    result.fold((l) {
      emit(ListCommentError(l.toString()));
      controller.loadComplete();
    }, (r) {
      List<ListCommentEntity> old = myState.list;
      List<ListCommentEntity> result = [...old, ...r];

      emit(ListCommentLoaded(result, "List comment berhasil diload",
          pages: currentPages));
      controller.loadComplete();
    });
  }
}
