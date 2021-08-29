import QtQuick 2.15
import QtGraphicalEffects 1.0


Item{
    property int süre: 2000
    property bool kontrol: true
    id: horizonnew
    width: 1400
    height: 700

    Rectangle{
        id:arkaplan
        anchors.fill:parent
        color:"gray"
        z:-1

    }

    Image{
        id: metalplan
        source: "pngwing.com (4).png"
        anchors{
            left: parent.left
            right:parent.right
            bottom:parent.bottom
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        height: parent.height

    }
    Image{
        id:kahve_maviksım
        source: "KAHVE-MAVİPLAN_1.png"
        width: metalplan.width*0.47
        height: width
        x:cam.x
        y:cam.y
    }

    Image{
        id:icufuk
        source: "İCUFUK_1.png"
        width:501
        height: 495
        x:120
        y:98

    }

    Image{
        id:discember
        source: "DİSCEMBER.png"
        width: metalplan.width*0.47
        height: width
        x:cam.x
        y:cam.y


    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if(kontrol==true)
            {
                sag.start()
                kontrol=false
            }
            else if(kontrol==false)
            {
                sol.start()
                kontrol=true
            }

        }
    }



    ParallelAnimation{
        id:sag
        PropertyAnimation{
            target: discember
            loops: Animation.running
            property: "rotation"
            to:30
            duration:süre

        }
        PropertyAnimation{
            target: kahve_maviksım
            loops: Animation.running
            property: "rotation"
            to:30
            duration:süre

        }
        PropertyAnimation{
            target : icpusula
            loops: Animation.running
            property: "rotation"
            to: 30
            duration: süre
        }

    }

    ParallelAnimation{
        id:sol
        PropertyAnimation{
            target:discember
            loops: Animation.running
            property: "rotation"
            to:-30
            duration:süre
        }
        PropertyAnimation{
            target:kahve_maviksım
            loops: Animation.running
            property: "rotation"
            to:-30
            duration:süre


        }
        PropertyAnimation{
            target:icpusula
            loops: Animation.running
            property: "rotation"
            to: -30
            duration: süre
        }
    }


    states: [
        State {
            name: "ucak_up"  //uçak burnu aşağıdan----> yukarıya
            AnchorChanges { target: icufuk; anchors.bottom: horizonnew.bottom}
        },
        State {
            name: "ucak_down" //uçak burnu yukarıdan---> aşağıya
            AnchorChanges { target: icufuk; anchors.top: horizonnew.top}
        }

    ]
    transitions: Transition {

        AnchorAnimation { duration:1700}
    }
    Component.onCompleted: horizonnew.state = "ucak_up"
    Timer {
        interval: 1700
        running: true
        repeat: true
        onTriggered: {
            if(icufuk.y == 0 ) horizonnew.state = "ucak_up"
            else horizonnew.state= "ucak_down"
        }

    }

    Image{
        id:dısekran
        source: "Dıs_ekran.png"
        width: metalplan.width*0.47
        height: width
        x:695
        y:cam.y/2
    }
    Image{
        id:icpusula
        source:"iç pusula.png"
        width: metalplan.width*0.34
        height:width
        x:784
        y:101
    }
    Image{
        id:cyrocam
        source:"istikamet_cami.png"
        width: metalplan.width*0.33
        height: width
        x:793
        y:108
    }


    Image{
        id:kanatlar
        source: "kanatlar.png"
        width: metalplan.width*0.47
        height: width
        x:cam.x
        y:cam.y
    }
    Image {
        id: cam
        source: "HORİZONCAM.png"
        width: metalplan.width*0.47
        height: width
        x:45
        y:22

    }

}
