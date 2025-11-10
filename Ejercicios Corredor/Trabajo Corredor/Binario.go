package main
import "fmt"

type Binario struct {
	imagen  []byte
	audio   []byte
	video   []byte
	archivo []byte
	clave   []byte
}

func (b Binario) ContarBytes(data []byte) int { return len(data) }
func (b Binario) ObtenerPrimerByte(data []byte) byte { return data[0] }
func (b Binario) EsVacio(data []byte) bool { return len(data) == 0 }
func (b Binario) SumarBytes(a, c byte) byte { return a + c }
func (b Binario) Duplicar(data []byte) []byte { return []byte{data[0], data[0]} }

func main() {
	b := Binario{imagen: []byte{1, 0, 1, 0}}
	fmt.Println(b.ContarBytes(b.imagen))
}
