import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cctv5_vip/home/model/novel.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;

class FileManager {
  static getDir() {
    String dir = Directory.systemTemp.path;

    var filePath = path.join(dir, 'lib', 'home', 'model', 'video.dart');
    print(filePath);
    print(path.extension(filePath));
    return filePath;
  }

  static redFileInfo() async {
    var dir = Directory.systemTemp.path;
    var filePath = path.join(dir, 'novel', '一路青云.txt');
    var file = File(filePath);
    print(filePath);
    if (!await file.exists()) {
      print('创建文件');
      file.create(recursive: true);
    }
    print(FileSystemEntity.isFile(filePath));
    print(FileSystemEntity.isDirectory(filePath));
//    await file.rename(path.dirname(filePath) + path.separator + '十方乾坤1.txt');
//    file.copy(path.dirname(filePath) + path.separator + '十方乾坤3.txt');
    var stat = await file.stat();
    print(stat.size / 1000 / 1000);
    print(stat.type);
    print(stat.changed);
    print(stat.modified);
    print(stat.accessed);
    print(stat.mode);
  }

  static readFile() async {
    var dir = Directory.systemTemp.path;
    print(dir);
    var filePath = path.join(dir, 'novel', '一路青云.txt');
    var fileDirPath = path.join(dir, 'novel', '一路青云目录.txt');
    File file = File(filePath);
    File dirFile = File(fileDirPath);
    if (!await file.exists()) {
      file.create(recursive: true);
    }
    if (!await dirFile.exists()) {
      dirFile.create(recursive: true);
    }
    IOSink sink = dirFile.openWrite(mode: FileMode.writeOnlyAppend);
    List<String> list = await file.readAsLines();
    Stream<String> stream = Stream.fromIterable(list);
//    StreamController<String> controller = StreamController<String>();
//    controller.addStream(stream);
    var count = 0;
    var lineNum = 0;
    String content;
    stream.transform(StreamTransformer<String, Novel>.fromHandlers(
        handleData: (String data, EventSink<Novel> sink) {
      lineNum++;
      if (data.startsWith('------')) {
        count = 0;
        content = '';
      } else {
        count++;
      }
      if (count == 2) {
        sink.add(Novel(data, lineNum, content));
      } else if (count > 2) {
//        print(data);
        content = content + data;
      }
    })).listen((data) {
      print('行号:${data.lineNum}   ${data.title}');
      sink.write(data.title + '\n');
//      print('${data.content}');
    }, onDone: () {
      print('目录获取完成了${lineNum}');
      sink.close();
    }, onError: (e) {
      print(e);
    });

//    controller.close();
//    controller.stream.listen((data) {
//      if (data.startsWith('------')) {
//        print('$data');
//      }
//    });
  }
}
