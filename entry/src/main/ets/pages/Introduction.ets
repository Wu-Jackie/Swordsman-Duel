import { Header } from '../Common/Components'

@Entry
@Component
struct Introduction {
  build() {
    Column() {
      Header()
        .margin({top:10,bottom:10})
      Column(){
        List({space:5}){
          ListItem(){
            Text($r('app.string.Introduction'))
              .fontSize(25)
              .fontWeight(FontWeight.Bold)
          }
        }
      }
      .width('90%')
      .height('88%')
      .borderRadius(20)
      .padding({left:10,right:10,top:15,bottom:15})
      .backgroundColor('#85DEDEDE')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundImagePosition({x:100,y:800})
    .backgroundImage($r('app.media.duel'))
  }
}

