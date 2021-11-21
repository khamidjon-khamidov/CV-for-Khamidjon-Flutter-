part of posts_page;

class PostsBloc extends Bloc<_PostsEvent, _PostsState> {
  final PostsRepository _postsRepository;

  PostsBloc(this._postsRepository) : super(_PostsLoadingState()) {
    on<_GetPostsEvent>(
      (event, emit) async {
        emit(_PostsLoadingState());

        BlocResponse response = await _postsRepository.getSkills();
        if (response is FromNetworkBlocResponse) {
          emit(_PostsLoadedFromNetworkState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is FromStorageBlockResponse) {
          emit(_PostsLoadedFromStorageState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is ErrorBlockResponse) {
          emit(_PostsErrorState(response.extraMessage!));
        }
      },
      transformer: droppable(),
    );

    add(_GetPostsEvent());
  }
}
