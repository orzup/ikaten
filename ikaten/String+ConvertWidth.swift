import Foundation

extension String {
    private func convertFullWidthToHalf() -> String {
        var str = self
        let pattern = "[Ａ-Ｚ＆]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let results = regex.matchesInString(str, options: [], range: NSMakeRange(0, str.characters.count))

        for result in results.reverse() {
            let subStr = (str as NSString).substringWithRange(result.range)
            let halfSubStr = NSMutableString(string: subStr) as CFMutableString

            CFStringTransform(halfSubStr, nil, kCFStringTransformFullwidthHalfwidth, false)
            str = str.stringByReplacingOccurrencesOfString(subStr, withString: halfSubStr as String)
        }
        return str
    }

    var toHalfWidth: String {
        return convertFullWidthToHalf()
    }
}
