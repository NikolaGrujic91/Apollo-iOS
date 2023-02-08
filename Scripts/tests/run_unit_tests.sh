#!/bin/sh

# in case of permission problems run this first
# chmod +x ./run_unit_tests.sh
# ./run_unit_tests.sh

WORKSPACE="../../Apollo/Apollo.xcworkspace"

printy() {
  printf "\e[33;1m%s\n" "$1"
}
printg() {
  printf "\e[32m$1\e[m\n"
}
printr() {
  echo -e "\033[1;31m$1\033[0m"
}

# Validations
if ! which xcpretty >/dev/null; then
  echo "Please install xcpretty to run this script."
  exit 1
fi

printg "/***************************************************/"
printg "             List the available schemes"
printg "/***************************************************/"

xcodebuild -list -workspace $WORKSPACE

# printg "/***************************************************/"
# printg "             List destination options"
# printg "/***************************************************/"

# xcrun simctl list

printg "/***************************************************/"
printg "             Running tests for ApolloLogger"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloLogger \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloWeight"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloWeight \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty