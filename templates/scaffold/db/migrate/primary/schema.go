// Code generated by github.com/appist/appy.

package primary

import (
	"{{.projectName}}/pkg/app"
)

func init() {
	db := app.DB("primary")

	if db != nil {
		db.SetSchema(``)
	}
}