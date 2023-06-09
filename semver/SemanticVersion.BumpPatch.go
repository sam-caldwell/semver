package semver

// BumpPatch - bump version part
func (ver *SemanticVersion) BumpPatch() error {

	//Get the maximum value of Version number using bitwise math...much faster.
	maxValue := VersionNumber(2<<(versionNumberSize-1) - 1)

	if ver.patch == maxValue {
		ver.minor = 0
		if err := ver.BumpMajor(); err != nil {
			return err
		}
	}
	ver.patch++
	return nil
}
