#!/bin/sh

#chmod +x ./run_swiftformat.sh
#./run_swiftformat.sh

# swiftformat --verbose "../../Apollo" --exclude "../../Apollo/Build" --swiftversion 5.10
swiftformat --verbose "../../Apollo" --exclude "../../Apollo/Build"  --swiftversion 5.10 --rules sortImports, redundantReturn, redundantOptionalBinding, headerFileName, extensionAccessControl, blankLinesAroundMark