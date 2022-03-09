import TSCBasic
import TSCUtility
import Workspace

extension Destination {
    func updated(target: Triple? = nil,
                 sdk: AbsolutePath? = nil,
                 binDir: AbsolutePath? = nil,
                 extraCCFlags: [String]? = nil,
                 extraSwiftCFlags: [String]? = nil,
                 extraCPPFlags: [String]? = nil) -> Destination {
        return Destination(target: target ?? self.target,
                           sdk: sdk ?? self.sdk,
                           binDir: binDir ?? self.binDir,
                           extraCCFlags: extraCCFlags ?? self.extraCCFlags,
                           extraSwiftCFlags: extraSwiftCFlags ?? self.extraSwiftCFlags,
                           extraCPPFlags: extraCPPFlags ?? self.extraCPPFlags)
    }
}

extension Destination: JSONSerializable {
    public func toJSON() -> JSON {
        return JSON.dictionary([
            "version": JSON.int(1),
            "target": JSON.string(self.target!.tripleString),
            "sdk": JSON.string(self.sdk!.description),
            "toolchain-bin-dir": JSON.string(self.binDir.description),
            "extra-cc-flags": JSON.array(self.extraCCFlags.map { JSON.string($0) }),
            "extra-swiftc-flags": JSON.array(self.extraSwiftCFlags.map { JSON.string($0) }),
            "extra-cpp-flags": JSON.array(self.extraCPPFlags.map { JSON.string($0) }),
        ])
    }
}
