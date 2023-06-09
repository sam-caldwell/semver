package semver

import "fmt"

// BumpMajor - bump version part
func (ver *SemanticVersion) BumpMajor() error {
	if ver.major == 255 {
		return fmt.Errorf(errVersionOverflow)
	}
	ver.major++
	return nil
}
