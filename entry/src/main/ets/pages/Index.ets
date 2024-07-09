import router from '@ohos.router'

@Entry
@Component
struct Index {
  build() {
    Column({space:40}){
      Row(){
        Image($r('app.media.NUC'))
          .width(65)
        Blank()

        Text('剑客决斗')
          .height(80)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Blank()

        Image($r('app.media.CSLogo'))
          .width(65)

      }
      .width('100%')
      .height(80)
      .margin({top:20})
      .padding({left:20,right:20})

      Image($r("app.media.duel"))
        .width('95%')

      Button("题目介绍")
        .width("40%")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          router.pushUrl({
            url:'pages/Introduction'
          },
            router.RouterMode.Standard)
        })

      Button("算法生成")
        .width("40%")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          router.pushUrl({
            url:'pages/Input'
          },
            router.RouterMode.Standard)
        })
    }
  }
}