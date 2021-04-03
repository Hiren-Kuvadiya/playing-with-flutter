import 'dart:async';


class StreamUtil{


  static StreamController streamController = StreamController<String>.broadcast();

  StreamSubscription<String> streamSubscription;


}