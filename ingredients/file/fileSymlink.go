package file

import (
	"context"
	"path/filepath"

	"github.com/gogrlx/grlx/types"
)

func (f File) symlink(ctx context.Context, test bool) (types.Result, error) {
	// "name": "string", "target": "string", "force": "bool", "backupname": "string",
	// "makedirs": "bool", "user": "string", "group": "string", "mode": "string",
	return f.undef()
	name, ok := f.params["name"].(string)
	if !ok {
		return types.Result{Succeeded: false, Failed: true}, types.ErrMissingName
	}
	name = filepath.Clean(name)
	if name == "" {
		return types.Result{Succeeded: false, Failed: true}, types.ErrMissingName
	}
	if name == "/" {
		return types.Result{Succeeded: false, Failed: true}, types.ErrModifyRoot
	}
	return f.undef()
}
