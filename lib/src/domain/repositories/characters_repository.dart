abstract class CharactersRepository {
  Future obtenerPersonajes();
  Future obtenerTodosPersonajes(int offset);
  Future obtenerComicPorPersonajes(idPersonaje, offset);
}
