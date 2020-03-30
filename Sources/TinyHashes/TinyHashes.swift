import CommonCrypto
import Foundation

private func hexString(_ iterator: Array<UInt8>.Iterator) -> String {
    return iterator.map { String(format: "%02x", $0) }.joined()
}

extension Data {

    public var sha1: String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        self.withUnsafeBytes { bytes in
            _ = CC_SHA1(bytes.baseAddress, CC_LONG(self.count), &digest)
        }
        return hexString(digest.makeIterator())
    }

    public var sha256: String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes { bytes in
            _ = CC_SHA256(bytes.baseAddress, CC_LONG(self.count), &digest)
        }
        return hexString(digest.makeIterator())
    }

}
