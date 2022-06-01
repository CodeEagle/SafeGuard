
extension SafeGuard {
    public enum ExitTrigger {
        case onJailbreak
        case onRepack(RepackConfig?)
        case onInject(hasInvalidImageVerifier)
        case onArmMacBook
        case onPtrace
        case onIsatty
        case onIoctl
        
        public typealias hasInvalidImageVerifier = (_ images: [String]) -> Bool
        
        public struct RepackConfig {
            public let allowCodeSigns: [CodeSignInfo]

            public init(allowCodeSigns: [CodeSignInfo]) {
                self.allowCodeSigns = allowCodeSigns
            }

            public struct CodeSignInfo {
                public let teamId: String
                public let bundleId: String
                public init(teamId: String, bundleId: String) {
                    self.teamId = teamId
                    self.bundleId = bundleId
                }
            }
        }
    }
}
