import java.time.LocalDate;

public class Libro {

    public String isbn;
    public String titulo;
    public String autor;
    public String genero;
    public LocalDate fechaDePublicacion;

    public Libro (String isbn, String titulo, String autor, String genero, LocalDate fechaDePublicacion) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.genero = genero;
        this.fechaDePublicacion = fechaDePublicacion;
    }

    @Override
    public String toString() {
        return "Libro [isbn=" + isbn + ", Titulo=" + titulo + ", Autor=" + autor + ", Genero=" + genero
                + ", FechaDePublicacion=" + fechaDePublicacion + "]";
    }

}
