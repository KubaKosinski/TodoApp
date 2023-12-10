abstract class NoteRepository<T> {
  List<T> get getNotes;
  Future<void> addNote({required T entity});
  Future<void> updateNote({required T entity, required String id});
  Future<void> removeNote({required String id});
}
