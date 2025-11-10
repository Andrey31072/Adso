package main
import "fmt"

type Booleano struct {
	activo     bool
	encendido  bool
	aprobado   bool
	disponible bool
	visible    bool
}

func (b Booleano) EsVerdadero(valor bool) bool { return valor }
func (b Booleano) Negacion(valor bool) bool { return !valor }
func (b Booleano) AmbosVerdaderos(a, c bool) bool { return a && c }
func (b Booleano) AlgunoVerdadero(a, c bool) bool { return a || c }
func (b Booleano) Iguales(a, c bool) bool { return a == c }

func main() {
	fmt.Println(Booleano{}.AmbosVerdaderos(true, false))
}
