#!/bin/sh

#chmod +x ./run_swiftformat.sh
#./run_swiftformat.sh

# swiftformat --verbose "../../Apollo" --exclude "../../Apollo/Build" --swiftversion 5.9
swiftformat --verbose "../../Apollo" --exclude "../../Apollo/Build"  --swiftversion 5.9 --rules sortImports, redundantReturn, redundantOptionalBinding, headerFileName, extensionAccessControl, blankLinesAroundMark