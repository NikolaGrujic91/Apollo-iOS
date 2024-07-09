#!/bin/sh
#
# Copy latest compiler log from DeriveData and perform fastlane analyze_imports.

# in case of permission problems run this first
# chmod +x ./run_fastlane_analyze_imports.sh
# ./run_fastlane_analyze_imports.sh ProjectName

# FUNCTIONS

print() {
    echo "---------------------------------------"
    echo "$1"
}

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

directory_exists_in_derived_data() {
    if [ ${#DerivedDataPaths[@]} -eq 0 ]; then
        err "No paths found for $SearchPattern."
        exit 1
    else
        print "${DerivedDataPaths[0]}"
    fi
}

xcactivitylog_exists() {
    if [ -z "$1" ]; then
        err "No xcactivitylog found."
        exit 1
    else
        print "$1"   
    fi
}

copy() {
     if [ ! -f "$1" ]; then
        err "Error: File '$1' does not exist."
        exit 1
    fi

    print "Copy '$1' to '$2'"
    cp "$1" "$2"
}

unzip_file() {
    if [ ! -f "$1" ]; then
        err "Error: File '$1' does not exist."
        exit 1
    fi

    gunzip -S "$2" "$1"

    if [ $? -eq 0 ]; then
        print "File '$1' successfully unzipped."
    else
        err "Failed to unzip file '$1'."
        exit 1
    fi
}

analyze_imports(){
    print "Analyze imports..."
    fastlane ios swiftlint_analyze
}

# Check if argument is provided
if [ $# -eq 0 ]; then
    err "Error: No argument provided. Usage: ./run_fastlane_analyze_imports.sh ProjectName"
    exit 1
fi

# CONSTANTS
SearchPattern="*$1*"
DerivedDataPaths=($(find ~/Library/Developer/Xcode/DerivedData -type d -name $SearchPattern))
CompilerLog="./../LATEST.xcactivitylog"

print "Start analyzing imports..."

directory_exists_in_derived_data

LatestXcactivitylog=$(ls -t ${DerivedDataPaths[0]}/Logs/Build/*.xcactivitylog | head -n 1)

xcactivitylog_exists "$LatestXcactivitylog"

copy "$LatestXcactivitylog" "$CompilerLog"

unzip_file "$CompilerLog" ".xcactivitylog"

analyze_imports

print "Finished analyzing imports."