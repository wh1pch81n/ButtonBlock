import UIKit

enum TouchType : String {
	case TouchUpInside = "touchUpInside:"
	func controlEvent() -> UIControlEvents {
		switch self {
		case .TouchUpInside: return UIControlEvents.TouchUpInside
		}
	}
}

typealias TargetAction = [TouchType : () -> ()]
class MYButton : UIButton {
	var targetAction : TargetAction? {
		didSet {
			removeTarget(nil, action: nil, forControlEvents: UIControlEvents.AllEvents) // removes all targets
			for (kind, block) in targetAction! {
				addTarget(self, action: Selector(kind.rawValue), forControlEvents: kind.controlEvent())
			}
		}
	}
	convenience init() {
		self.init(frame: CGRectZero)
	}
	convenience init(targetAction: TargetAction) {
		self.init()
		self.targetAction = targetAction
	}

	override func sendAction(action: Selector, to target: AnyObject?, forEvent event: UIEvent?) {
		didRecieveAction(NSStringFromSelector(action))
	}
	
	func didRecieveAction(name: String) {
		if let controlEvent : TouchType = TouchType(rawValue: name) {
			targetAction?[controlEvent]!()
		}
	}
}

/** Can be used like this

button.targetAction = [TouchType.TouchUpInside : { println("cow a bunga") }]

*/
