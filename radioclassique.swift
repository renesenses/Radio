#!/usr/bin/env xcrun swift

import WebKit
let application = NSApplication.sharedApplication()
application.setActivationPolicy(NSApplicationActivationPolicy.Regular)
let window = NSWindow(contentRect: NSMakeRect(0, 0, 800, 600), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, defer: false)
window.center()
window.title = "Radio classique pour Albert Clec'h"
window.makeKeyAndOrderFront(window)
class WindowDelegate: NSObject, NSWindowDelegate {
    func windowWillClose(notification: NSNotification?) {
        NSApplication.sharedApplication().terminate(0)
    }
}
let windowDelegate = WindowDelegate()
window.delegate = windowDelegate
class ApplicationDelegate: NSObject, NSApplicationDelegate {
    var _window: NSWindow
    init(window: NSWindow) {
        self._window = window
    }
    func applicationDidFinishLaunching(notification: NSNotification?) {
        let webView = WebView(frame: self._window.contentView.frame)
        self._window.contentView.addSubview(webView)
//        webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.com/ncr")))
// 		<iframe src="http://www.radioclassique.fr/player-export.html" width="510" height="180" scrolling="no"></iframe>
		webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.radioclassique.fr/player/")!))
    }
}
let applicationDelegate = ApplicationDelegate(window: window)
application.delegate = applicationDelegate
application.activateIgnoringOtherApps(false)
application.run()
