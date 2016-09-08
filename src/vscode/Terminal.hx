package vscode;

/**
 * An individual terminal instance within the integrated terminal.
 */
typedef Terminal = {
	/**
	 * The name of the terminal.
	 *
	 * @readonly
	 */
	var name(default,null):String;

	/**
	 * Send text to the terminal. The text is written to the stdin of the underlying pty process
	 * (shell) of the terminal. Note that this will currently force the terminal panel to the
	 * foreground, this is changing in v1.6 such that it will require an explicit call to
	 * [Terminal.show](#Terminal.show) in order to show the terminal panel.
	 *
	 * @param text The text to send.
	 * @param addNewLine Whether to add a new line to the text being sent, this is normally
	 * required to run a command in the terminal. The character(s) added are \n or \r\n
	 * depending on the platform. This defaults to `true`.
	 */
	function sendText(text:String, ?addNewLine:Bool):Void;

	/**
	 * Show the terminal panel and reveal this terminal in the UI.
	 *
	 * @param preserveFocus When `true` the terminal will not take focus.
	 */
	function show(?preserveFocus:Bool):Void;

	/**
	 * Hide the terminal panel if this terminal is currently showing.
	 */
	function hide():Void;

	/**
	 * Dispose and free associated resources.
	 */
	function dispose():Void;
}