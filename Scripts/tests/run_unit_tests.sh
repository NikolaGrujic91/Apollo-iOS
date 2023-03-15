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
printg "             Running tests for ApolloWeight"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloWeight \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloLocation"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloLocation \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloAudio"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloAudio \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloData"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloData \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloTheme"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloTheme \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for ApolloUI"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme ApolloUI \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "         Running tests for FeatureSettings"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme FeatureSettings \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for FoundationImages"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme FoundationImages \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "      Running tests for FoundationLocalization"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme FoundationLocalization \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for FoundationStorage"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme FoundationStorage \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for FoundationLogger"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme FoundationLogger \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty

printg "/***************************************************/"
printg "             Running tests for UtilityExtensions"
printg "/***************************************************/"

xcodebuild \
 test \
 -workspace $WORKSPACE \
 -scheme UtilityExtensions \
 -destination 'platform=iOS Simulator,name=iPhone 14 Pro' |
xcpretty