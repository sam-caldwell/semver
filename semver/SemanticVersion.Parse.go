package semver

// Parse - Parse a string into the semantic version numeric form
func (ver *SemanticVersion) Parse(v string) (err error) {
	return ver.ParseP(&v)
}
