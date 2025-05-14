import Carbon

public enum RunAppleScriptError: Error {
    case NSAppleScriptInitError
    case scriptRunningError
}

public func runAppleScript(source: String) -> Result<NSAppleEventDescriptor, RunAppleScriptError> {
    if let appleScript = NSAppleScript(source: source) {
        var error: NSDictionary?
        let result = appleScript.executeAndReturnError(&error)
        if let error = error {
            print(error)
            return .failure(RunAppleScriptError.scriptRunningError)
        }

        return .success(result)
    } else {
        return .failure(RunAppleScriptError.NSAppleScriptInitError)
    }
}
