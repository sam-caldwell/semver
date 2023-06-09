package semver

import "fmt"

// BumpMajor - bump version part
func (ver *SemanticVersion) BumpMajor() error {
	//Get the maximum value of Version number using bitwise math...much faster.
	maxValue := VersionNumber(2<<(versionNumberSize-1) - 1)

	if ver.major == maxValue {
		return fmt.Errorf(errVersionOverflow)
	}
	ver.major++
	return nil
}
