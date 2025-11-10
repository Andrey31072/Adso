package main
import (
	"encoding/json"
	"fmt"
)

type Usuario struct {
	Nombre string `json:"nombre"`
	Edad   int    `json:"edad"`
}

type JsonEjemplo struct{}

func (j JsonEjemplo) CrearUsuario(nombre string, edad int) Usuario {
	return Usuario{Nombre: nombre, Edad: edad}
}
func (j JsonEjemplo) ObtenerNombre(u Usuario) string { return u.Nombre }
func (j JsonEjemplo) ObtenerEdad(u Usuario) int { return u.Edad }
func (j JsonEjemplo) AJson(u Usuario) string {
	data, _ := json.Marshal(u)
	return string(data)
}
func (j JsonEjemplo) ContarCampos(u Usuario) int { return 2 }

func main() {
	u := JsonEjemplo{}.CrearUsuario("Kevin", 25)
	fmt.Println(JsonEjemplo{}.AJson(u))
}
