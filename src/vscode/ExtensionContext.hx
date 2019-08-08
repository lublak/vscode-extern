package vscode;

/**
 * An extension context is a collection of utilities private to an
 * extension.
 *
 * An instance of an `ExtensionContext` is provided as the first
 * parameter to the `activate`-call of an extension.
 */
typedef ExtensionContext = {
	/**
	 * An array to which disposables can be added. When this
	 * extension is deactivated the disposables will be disposed.
	 */
	var subscriptions(default, null):Array<{function dispose():Void;}>;

	/**
	 * A memento object that stores state in the context
	 * of the currently opened [workspace](#workspace.workspaceFolders).
	 */
	var workspaceState(default, null):Memento;

	/**
	 * A memento object that stores state independent
	 * of the current opened [workspace](#workspace.workspaceFolders).
	 */
	var globalState(default, null):Memento;

	/**
	 * The absolute file path of the directory containing the extension.
	 */
	var extensionPath(default, null):String;

	/**
	 * Get the absolute path of a resource contained in the extension.
	 *
	 * @param relativePath A relative path to a resource contained in the extension.
	 * @return The absolute path of the resource.
	 */
	function asAbsolutePath(relativePath:String):String;

	/**
	 * An absolute file path of a workspace specific directory in which the extension
	 * can store private state. The directory might not exist on disk and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 *
	 * Use [`workspaceState`](#ExtensionContext.workspaceState) or
	 * [`globalState`](#ExtensionContext.globalState) to store key value data.
	 */
	var storagePath(default, null):Null<String>;

	/**
	 * An absolute file path in which the extension can store global state.
	 * The directory might not exist on disk and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 *
	 * Use [`globalState`](#ExtensionContext.globalState) to store key value data.
	 */
	var globalStoragePath(default, null):String;

	/**
	 * An absolute file path of a directory in which the extension can create log files.
	 * The directory might not exist on disk and creation is up to the extension. However,
	 * the parent directory is guaranteed to be existent.
	 */
	var logPath(default, null):String;
}
