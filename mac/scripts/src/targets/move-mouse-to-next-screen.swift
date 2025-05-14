import Cocoa
import Foundation
import Utils

if NSScreen.screens.count < 2 {
    exit(0)
}

let result = moveMouseToRelativeScreen(screenNumber: 1).flatMap { screen in
    focusScreenTopApp(screen)
}

switch result {
case .success:
    exit(0)
case .failure(let error):
    print(error)
    exit(1)
}
