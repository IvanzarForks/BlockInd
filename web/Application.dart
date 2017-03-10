import 'dart:html';

import 'package:di/di.dart' as di;
import 'package:mdl/mdl.dart';
import 'package:markdown/markdown.dart';

@MdlComponentModel @di.Injectable()
class Application implements MaterialApplication {

  Application()
  {
    _init();
    _load("/content/introduction/main.md");
  }

  _init() async
  {
    querySelector("#tab___introduction").onClick
        .listen((mouse)
    {
      _load("/content/introduction/main.md");
    });

    querySelector("#tab___privilege").onClick
        .listen((mouse)
    {
      _load("/content/privilege/main.md");
    });

    querySelector("#tab___problems").onClick
        .listen((mouse)
    {
      _load("/content/problems/main.md");
    });

    querySelector("#tab___interview").onClick
        .listen((mouse)
    {
      _load("/content/interview/main.md");
    });

    querySelector("#tab___stories").onClick
        .listen((mouse)
    {
      _load("/content/stories/main.md");
    });

    querySelector("#tab___movie").onClick
        .listen((mouse)
    {
      _load("/content/movie/main.md");
    });

  }

  _load(String url) async
  {

     NodeValidatorBuilder htmlValidator=new NodeValidatorBuilder.common()
      ..allowHtml5()
      ..allowElement("video", attributes: ["src", "controls", "preload", "loop", "tabindex", "name"])
      ..allowElement("source", attributes: ["src", "type", "style"])
      ..allowElement("iframe", attributes: ["src", "allowfullscreen"]);

    String markdown = markdownToHtml(await HttpRequest.getString(url),
        blockSyntaxes: [const TableSyntax()]);

    querySelector(".page-content").setInnerHtml(markdown, validator: htmlValidator);

  }

  @override
  void run() {
    // TODO: implement run
  }
}