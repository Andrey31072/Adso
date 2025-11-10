package main
import (
	"fmt"
	"strings"
)

type Texto struct {
	nombre    string
	apellido  string
	ciudad    string
	pais      string
	profesion string
}

func (t Texto) Concatenar(a, b string) string { return a + " " + b }
func (t Texto) Contar(texto string) int { return len(texto) }
func (t Texto) Mayuscula(texto string) string { return strings.ToUpper(texto) }
func (t Texto) Minuscula(texto string) string { return strings.ToLower(texto) }
func (t Texto) Contiene(texto, palabra string) bool { return strings.Contains(texto, palabra) }

func main() {
	fmt.Println(Texto{}.Concatenar("Hola", "Mundo"))
}
