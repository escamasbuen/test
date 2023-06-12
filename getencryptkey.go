import (
	"github.com/tidwall/gjson"
)

fmt.Print(gjson.Get(string(state),"os_crypt.encrypted_key"))
