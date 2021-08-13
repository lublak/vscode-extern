package vscode;

/**
 * Displays html content, similarly to an iframe.
 */
typedef Webview = {
	/**
	 * Content settings for the webview.
	 */
	var options:WebviewOptions;

	/**
	 * HTML contents of the webview.
	 *
	 * This should be a complete, valid html document. Changing this property causes the webview to be reloaded.
	 *
	 * Webviews are sandboxed from normal extension process, so all communication with the webview must use
	 * message passing. To send a message from the extension to the webview, use {@link Webview.postMessage `postMessage`}.
	 * To send message from the webview back to an extension, use the `acquireVsCodeApi` function inside the webview
	 * to get a handle to the editor's api and then call `.postMessage()`:
	 *
	 * ```html
	 * <script>
	 *     const vscode = acquireVsCodeApi(); // acquireVsCodeApi can only be invoked once
	 *     vscode.postMessage({ message: 'hello!' });
	 * </script>
	 * ```
	 *
	 * To load a resources from the workspace inside a webview, use the {@link Webview.asWebviewUri `asWebviewUri`} method
	 * and ensure the resource's directory is listed in {@link WebviewOptions.localResourceRoots `WebviewOptions.localResourceRoots`}.
	 *
	 * Keep in mind that even though webviews are sandboxed, they still allow running scripts and loading arbitrary content,
	 * so extensions must follow all standard web security best practices when working with webviews. This includes
	 * properly sanitizing all untrusted input (including content from the workspace) and
	 * setting a [content security policy](https://aka.ms/vscode-api-webview-csp).
	 */
	var html:String;

	/**
	 * Fired when the webview content posts a message.
	 *
	 * Webview content can post strings or json serializable objects back to an extension. They cannot
	 * post `Blob`, `File`, `ImageData` and other DOM specific objects since the extension that receives the
	 * message does not run in a browser environment.
	 */
	var onDidReceiveMessage(default, null):Event<Any>;

	/**
	 * Post a message to the webview content.
	 *
	 * Messages are only delivered if the webview is live (either visible or in the
	 * background with `retainContextWhenHidden`).
	 *
	 * @param message Body of the message. This must be a string or other json serializable object.
	 *
	 *   For older versions of vscode, if an `ArrayBuffer` is included in `message`,
	 *   it will not be serialized properly and will not be received by the webview.
	 *   Similarly any TypedArrays, such as a `Uint8Array`, will be very inefficiently
	 *   serialized and will also not be recreated as a typed array inside the webview.
	 *
	 *   However if your extension targets vscode 1.57+ in the `engines` field of its
	 *   `package.json`, any `ArrayBuffer` values that appear in `message` will be more
	 *   efficiently transferred to the webview and will also be correctly recreated inside
	 *   of the webview.
	 */
	function postMessage(message:Any):Thenable<Bool>;

	/**
	 * Convert a uri for the local file system to one that can be used inside webviews.
	 *
	 * Webviews cannot directly load resources from the workspace or local file system using `file:` uris. The
	 * `asWebviewUri` function takes a local `file:` uri and converts it into a uri that can be used inside of
	 * a webview to load the same resource:
	 *
	 * ```ts
	 * webview.html = `<img src="${webview.asWebviewUri(vscode.Uri.file('/Users/codey/workspace/cat.gif'))}">`
	 * ```
	 */
	function asWebviewUri(localResource:Uri):Uri;

	/**
	 * Content security policy source for webview resources.
	 *
	 * This is the origin that should be used in a content security policy rule:
	 *
	 * ```
	 * img-src https: ${webview.cspSource} ...;
	 * ```
	 */
	var cspSource(default, null):String;
}
