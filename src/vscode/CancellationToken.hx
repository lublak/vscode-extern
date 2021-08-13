package vscode;

/**
 * A cancellation token is passed to an asynchronous or long running
 * operation to request cancellation, like cancelling a request
 * for completion items because the user continued to type.
 *
 * To get an instance of a `CancellationToken` use a
 * {@link CancellationTokenSource}.
 */
typedef CancellationToken = {
	/**
	 * Is `true` when the token has been cancelled, `false` otherwise.
	 */
	var isCancellationRequested:Bool;

	/**
	 * An {@link Event} which fires upon cancellation.
	 */
	var onCancellationRequested:Event<Any>;
}
