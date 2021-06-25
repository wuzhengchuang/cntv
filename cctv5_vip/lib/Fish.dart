import 'dart:async';

class Fish {
  void listFish() {
    var fishs = [
      'A鱼',
      'B鱼',
      'C鱼',
    ];
    fishs.forEach((element) {
      print(element);
    });
    print('==========');
  }

  void listenFish() {
    var fishs = [
      'A鱼',
      'B鱼',
      'C鱼',
    ];
    var stream = Stream.fromIterable(fishs);
    stream.listen((fish) {
      print('拿到了：$fish');
    }, onDone: () {
      print('完成了');
    }, onError: (error) {
      print('异常$error');
    }, cancelOnError: false);
    print('==========');
  }

  void cancelListen() {
    var fishs = [
      'A鱼',
      'B鱼',
      'C鱼',
    ];
    var stream = Stream.fromIterable(fishs);
    var you = stream.listen(null);
    you.onData((data) {
      print('拿到了:$data');
      if (data == 'B鱼') {
        you.cancel();
      }
    });
    you.onError((e) {
      print('产生错误$e');
    });
    you.onDone(() {
      print('已全部拿到');
    });
  }

  void pushFish() {
    StreamController streamController = StreamController(onListen: () {
      print('onListen');
    }, onCancel: () {
      print('onCancel');
    }, onPause: () {
      print('onPause');
    }, onResume: () {
      print('onResume');
    });
    streamController.add('A鱼');
    streamController.add('B鱼');
    streamController.add('C鱼');
    streamController.stream.listen((fish) {
      print('你监听到$fish游到你身边');
    });
    streamController.add('D鱼');
    streamController.add('E鱼');
    streamController.add('F鱼');
    streamController.close();
  }

  void broadcastFish() {
    StreamController controller = StreamController.broadcast(onListen: () {
      print('onListen');
    }, onCancel: () {
      print('onCancel');
    });
    controller.stream.listen((fish) {
      print('$fish游到了你的身边');
    });
    controller.sink.add('A鱼');
    controller.sink.add('B鱼');
    controller.sink.add('C鱼');
    controller.stream.listen((fish) {
      print('$fish游到了你朋友的身边');
    });
    controller.sink.add('D鱼');
    controller.sink.add('E鱼');
    controller.close();
  }

  void operateFish() {
    StreamController controller = StreamController();
    controller.add('A鱼');
    controller.add('B鱼');
    controller.add('C鱼');
    controller.stream
        .map((fish) {
          if (fish == 'D鱼') {
            print('D鱼已经被我吃完了');
            return 'D鱼的骨头';
          }
          return fish;
        })
        .skip(2)
        .take(3)
        .listen((fish) {
          print('你拿到了$fish');
        });
    controller.add('D鱼');
    controller.add('E鱼');
    controller.add('F鱼');
    controller.close();
  }
}
