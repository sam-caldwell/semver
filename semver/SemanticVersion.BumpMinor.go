package semver

import "fmt"

// BumpMinor - bump version part
func (ver *SemanticVersion) BumpMinor() error {
	if ver.minor == 255 {
		return fmt.Errorf(errVersionOverflow)
	}
	ver.minor++
	return nil
}
