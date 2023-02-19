import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/list_user_entity.dart';
import '../../../domain/usecase/get_listuser.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit(this.getListUser) : super(ListUserInitial());

  final GetListUser getListUser;
  static final controller = RefreshController();

  getUserList() async {
    final result = await getListUser.fetchUserList(1);
    result.fold((l) {
      emit(ListUserError(l.toString()));
      controller.refreshCompleted();
    }, (r) {
      emit(ListUserLoaded(r, "List user berhasil diload"));
      controller.refreshCompleted();
    });
  }

  getRefresh() {
    getUserList();
  }

  getLoadMore() async {
    var myState = state as ListUserLoaded;
    int currentPages = myState.pages + 1;

    final result = await getListUser.fetchUserList(currentPages);
    result.fold((l) {
      emit(ListUserError(l.toString()));
      controller.loadComplete();
    }, (r) {
      List<ListUserEntity> old = myState.list;
      List<ListUserEntity> result = [...old, ...r];

      emit(ListUserLoaded(result, "List user berhasil diload",
          pages: currentPages));
      controller.loadComplete();
    });
  }
}
