package main
import "fmt"

type Numerico struct {
	edad     int
	salario  float64
	altura   float32
	telefono int64
	cantidad int16
}

func (n Numerico) Sumar(a, b int) int             { return a + b }
func (n Numerico) Promedio(a, b float64) float64  { return (a + b) / 2 }
func (n Numerico) Multiplicar(a, b int64) int64   { return a * b }
func (n Numerico) ConvertirMetros(km float32) float32 { return km * 1000 }
func (n Numerico) Restar(a, b int) int            { return a - b }

func main() {
	fmt.Println(Numerico{}.Sumar(5, 10))
}
