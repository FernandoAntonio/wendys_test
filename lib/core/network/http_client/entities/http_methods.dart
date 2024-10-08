/// Http method to indicate the desired action
/// to be performed for a given resource.
enum HttpMethod {
  /// The PUT method replaces all current representations
  /// of the target resource with the request payload.
  put,

  /// The GET method requests a representation of the specified resource.
  /// Requests using GET should only retrieve data.
  get,

  /// The POST method is used to submit an entity to the specified resource,
  /// often causing a change in state or side effects on the server.
  post,

  /// The DELETE method deletes the specified resource.
  delete,

  /// The PATCH method is used to apply partial modifications to a resource.
  patch,

  /// The HEAD method asks for a response identical to that of a GET request,
  /// but without the response body.
  head
}
