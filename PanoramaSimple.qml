// Simple Workaround - QuicKing.wordpress.com
import QtQuick 1.0

Rectangle {
    id: root
    width: 800
    height: 600
    clip: true

    property Image panorama: Image { source: "imgs/panorama1.png" }
    property int panWidth: panorama.width

    PathView {
        anchors.fill: parent
        model:2
        highlightRangeMode: "NoHighlightRange" // snap false
        flickDeceleration: 10

        delegate: Image{
            source: panorama.source
        }

        path: Path {
            startX: -panWidth/2; startY: root.height/2
            PathLine {x: panWidth + panWidth/2; y:root.height/2 }
        }
    }
}
