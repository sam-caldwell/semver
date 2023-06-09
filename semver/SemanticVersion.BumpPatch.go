package semver

import "fmt"

// BumpPatch - bump version part
func (ver *SemanticVersion) BumpPatch() error {
	if ver.patch == 255 {
		return fmt.Errorf(errVersionOverflow)
	}
	ver.patch++
	return nil
}
