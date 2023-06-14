package main

import (
	"flag"
	"fmt"
	"github.com/sam-caldwell/semver/v2/semver"
)

func main() {
	const (
		flagMajor  = "major"
		flagMinor  = "minor"
		flagPatch  = "patch"
		flagOutput = "%s output"
		flagUpdate = "updateTag"

		flagVerboseShort = "v"
		flagVerboseLong  = "verbose"
		errString        = "Error: %s\n"
		verString        = "Version: %s\n"
		helpUpdate       = "Update the git tag"
		helpVersion      = "Bump %s version"
	)

	major := flag.Bool(flagMajor, false, fmt.Sprintf(helpVersion, flagMajor))
	minor := flag.Bool(flagMinor, false, fmt.Sprintf(helpVersion, flagMinor))
	patch := flag.Bool(flagPatch, false, fmt.Sprintf(helpVersion, flagPatch))
	v := flag.Bool(flagVerboseShort, false, fmt.Sprintf(flagOutput, flagVerboseLong))
	verbose := flag.Bool(flagVerboseLong, false, fmt.Sprintf(flagOutput, flagVerboseLong))
	updateTag := flag.Bool(flagUpdate, false, helpUpdate)
	flag.Parse()

	var version semver.SemanticVersion
	if err := version.GetMostRecentTag(); err != nil {
		fmt.Printf(errString, err)
	}

	if *v || *verbose {
		fmt.Printf(verString, version.String())
	}

	if *major {
		if err := version.BumpMajor(); err != nil {
			fmt.Printf(errString, err)
		}
	}

	if *minor {
		if err := version.BumpMinor(); err != nil {
			fmt.Printf(errString, err)
		}
	}

	if *patch {
		if err := version.BumpPatch(); err != nil {
			fmt.Printf(errString, err)
		}
	}

	if *updateTag {
		if err := version.UpdateTag(); err != nil {
			fmt.Printf(errString, err)
		}
	}
	fmt.Printf("%s\n", version.String())
}
