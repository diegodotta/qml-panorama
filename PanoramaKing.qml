// King of Workaround - QuicKing.wordpress.com
import QtQuick 1.0

Rectangle {
    id: root
    width: 800; height: 600
    clip: true

    property Image panorama: Image { source: "imgs/panorama1_frente.png" }
    property int panWidth: panorama.width

    PathView {
        id: pathPano
        anchors.fill: parent
        model:2
        highlightRangeMode: "NoHighlightRange" // snap false
        flickDeceleration: 20

        delegate: Item{
            width: panWidth
            height: panorama.height
            clip: true

            property real posLine: PathView.posLine;


            Image{
                source: "imgs/panorama1_bg.png"
                width: panWidth
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: posLine
            }

            Image{
                anchors.horizontalCenter: parent.horizontalCenter
                source: panorama.source
            }

            Item{
                width: parent.width
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -posLine

                Image{
                    x: 200; y: 100
                    source: "imgs/ballon.png"
                }

                Image{
                    x: 1000; y: 400
                    source: "imgs/boat.png"
                }
            }
        }

        path: Path {
            startX: -panWidth/2; startY: root.height/2
            PathAttribute { name: "posLine"; value: 200 }
            PathLine {x: panWidth + panWidth/2; y:root.height/2 }
            PathAttribute { name: "posLine"; value: -200 }
        }
    }
}
