package semver

// Put - Convert string to uint (VersionNumber) and store
func (v *VersionNumber) Put(s string) error {
	return v.PutP(&s)
}
