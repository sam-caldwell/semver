package semver

// BumpMinor - bump version part
func (ver *SemanticVersion) BumpMinor() error {
	//Get the maximum value of Version number using bitwise math...much faster.
	maxValue := VersionNumber(2<<(versionNumberSize-1) - 1)

	if ver.minor == maxValue {
		ver.minor = 0
		if err := ver.BumpMajor(); err != nil {
			return err
		}
	}
	ver.minor++
	return nil
}
