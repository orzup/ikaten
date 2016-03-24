import UIKit

@IBDesignable class SegmentedControl: UISegmentedControl {
    @IBInspectable var fontSize: CGFloat = 25.0 {
        didSet {
            setFont()
        }
    }

    @IBInspectable var fontFamily: String = "ikamodoki" {
        didSet {
            setFont()
        }
    }

    private func setFont() {
        setTitleTextAttributes([NSFontAttributeName : UIFont(name: fontFamily, size: fontSize)!], forState: .Normal)
    }
}
