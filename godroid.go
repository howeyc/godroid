// godroid
package godroid

import (
	"net/http"
)

func Start() {
	go http.ListenAndServe(":8080", http.FileServer(http.Dir("/")))
}
