import Foundation
import SafeGuardOC
import MachO.dyld

public final class SafeGuard  {
    /// Start check
    @inline(__always)
    public static func kDtCrgGBkyh8VY3u(type: [ExitTrigger]) {
        var needExit = false
        type.forEach { t in
            switch t {
            case let .onInject(hasInvalidImageVerifier):
                let list = gEUhH7gP7LWZv769()
                let value = hasInvalidImageVerifier(list)
                needExit = value || needExit
            
            case .onArmMacBook: needExit = ogL11S0j0azAECBE() || needExit
            
            case .onJailbreak: needExit = sSxKPVAtVxdmdqzk() || fgwq6CODsIVIcbHu() || dchfoBYXyMAja16t() || needExit
            
            case let .onRepack(config): needExit = !gzriJ5StwDXYPQ5g(config) || needExit
            
            case .onPtrace:
                #if !DEBUG
                crz57CumFacZeOLh()
                #endif
            case .onIsatty:
                #if !DEBUG
                    needExit = isatty(STDOUT_FILENO) != 0 || needExit
                #endif
            case .onIoctl:
                needExit = (((ioctl(1, TIOCGWINSZ) == 0)) ? true : false) || needExit
            }
        }

        guard needExit else { return }
        k9FpnXPDNh0HvtXC()
        while(true){}
    }
    
    /// Has read app file authority
    /// - Returns: Bool
    @inline(__always)
    private static func sSxKPVAtVxdmdqzk() -> Bool {
        // User/Applications/
        //:obfuscate
        let obData = String(bytes: [85,115,101,114,47,65,112,112,108,105,99,97,116,105,111,110,115,47], encoding: .utf8)!
        return FileManager.default.fileExists(atPath: obData)
    }
    
    /// Has jailbreak app | file or not
    /// - Returns: Bool
    @inline(__always)
    private static func fgwq6CODsIVIcbHu() -> Bool {
        #if targetEnvironment(simulator)
          return false
        #else
        // /Applications/Cydia.app
        //:obfuscate
        let path1 = String(bytes: [47,65,112,112,108,105,99,97,116,105,111,110,115,47,67,121,100,105,97,46,97,112,112], encoding: .utf8)!

        // /private/var/lib/apt/
        //:obfuscate
        let path2 = String(bytes: [47,112,114,105,118,97,116,101,47,118,97,114,47,108,105,98,47,97,112,116,47], encoding: .utf8)!
        
        if FileManager.default.fileExists(atPath: path1) || FileManager.default.fileExists(atPath: path2) {
            return true
        }
        /*
         /etc/ssh/sshd_config
         /usr/libexec/ssh-keysign
         /usr/sbin/sshd
         /bin/sh
         /bin/bash
         /etc/apt
         /Application/Cydia.app/
         /Library/MobileSubstrate/MobileSubstrate.dylib
         */
        let paths = [
            String(bytes: [47,101,116,99,47,115,115,104,47,115,115,104,100,95,99,111,110,102,105,103], encoding: .utf8),
            String(bytes: [47,117,115,114,47,108,105,98,101,120,101,99,47,115,115,104,45,107,101,121,115,105,103,110], encoding: .utf8),
            String(bytes: [47,117,115,114,47,115,98,105,110,47,115,115,104,100], encoding: .utf8),
            String(bytes: [47,98,105,110,47,115,104], encoding: .utf8),
            String(bytes: [47,98,105,110,47,98,97,115,104], encoding: .utf8),
            String(bytes: [47,101,116,99,47,97,112,116], encoding: .utf8),
            String(bytes: [47,65,112,112,108,105,99,97,116,105,111,110,47,67,121,100,105,97,46,97,112,112,47], encoding: .utf8),
            String(bytes: [47,76,105,98,114,97,114,121,47,77,111,98,105,108,101,83,117,98,115,116,114,97,116,101,47,77,111,98,105,108,101,83,117,98,115,116,114,97,116,101,46,100,121,108,105,98], encoding: .utf8)
        ]
        let r = paths.compactMap { $0 != nil ? (FileManager.default.fileExists(atPath: $0!) ? 1 : 0) : 0 }.reduce(0, { $0 + $1 })
        return r > 0
        #endif
    }
    
    /// Has dyld insert libraries or not
    /// - Returns: Bool
    @inline(__always)
    private static func dchfoBYXyMAja16t() -> Bool {
        #if DEBUG
            return false
        #else
            // DYLD_INSERT_LIBRARIES
            //:obfuscate
            let d = String(bytes: [68,89,76,68,95,73,78,83,69,82,84,95,76,73,66,82,65,82,73,69,83], encoding: .utf8)!
            let p = getenv(d)
            return p != nil
        #endif
    }
    
    /// Arm macBook or not
    /// - Returns: Bool
    @inline(__always)
    private static func ogL11S0j0azAECBE() -> Bool {
        if #available(iOS 14.0, *) {
            return ProcessInfo.processInfo.isiOSAppOnMac
        } else {
            return false
        }
    }
    
    /// Is valid codesign info or not
    /// - Returns: Bool
    @inline(__always)
    private static func gzriJ5StwDXYPQ5g(_ c: ExitTrigger.RepackConfig?) -> Bool {

        guard let config = c else { return true }
        // embedded
        //:obfuscate
        let k1 = String(bytes: [101,109,98,101,100,100,101,100], encoding: .utf8)
        // mobileprovision
        //:obfuscate
        let k2 = String(bytes: [109,111,98,105,108,101,112,114,111,118,105,115,105,111,110], encoding: .utf8)
        let path = Bundle.main.path(forResource: k1, ofType: k2)
        guard let p = path else { return true }
        var isValid = false
        do {
            var coding = String.Encoding.ascii
            let file = try String(contentsOfFile: p, usedEncoding: &coding)
            var isValidTeam = false
            var isValidBundleId = false
            config.allowCodeSigns.forEach { codeSign in
                if isValid { return }
                if !isValidTeam && file.contains(codeSign.teamId) {
                    isValidTeam = true
                    isValid = isValidTeam && isValidBundleId
                }
                if isValid { return }
                if !isValidBundleId && file.contains(codeSign.bundleId) {
                    isValidBundleId = true
                    isValid = isValidTeam && isValidBundleId
                }
            }
        } catch {}
        return isValid
    }
}

