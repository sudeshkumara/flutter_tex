import 'package:flutter_tex/src/manifests/widgets_manifest.dart';
import 'package:flutter_tex/src/models/tex_view_widget_meta.dart';
import 'package:flutter_tex/src/style/style_utils.dart';

class TeXViewVideo extends TeXViewWidget {
  /// Uri for Image.
  final String url;

  final String _type;

  const TeXViewVideo.youtube(this.url) : this._type = 'tex-view-video-youtube';

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(tag: 'div', type: _type, node: Node.Leaf);
  }

  @override
  void onTapManager(String id) {}

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': _initData(),
        'style': "max-width: 100%; max-height: 100%; " + teXViewDefaultStyle,
      };

  String _initData() {
    return """<iframe width="100%" height="100%" frameborder="0" allowfullscreen
    src="https://www.youtube.com/embed/${Uri.parse(this.url).queryParameters['v']}"
    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>""";
  }
}
