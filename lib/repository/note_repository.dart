abstract class NoteRepository<T> {
  List<T> getNotes();
  Future<void> addNote({required T entity});
  Future<void> updateNote({required T entity, required int index});
  Future<void> removeNote({required int index});
}
