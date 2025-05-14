import Foundation
import MouseUtils

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
