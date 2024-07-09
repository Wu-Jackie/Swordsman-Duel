import router from '@ohos.router'

@Entry
@Component
struct Input {
  //全局变量
  onchange(){
    globalThis.num1;
  }
  build() {
    Column({space:40}){
      Row(){
        Image($r('app.media.back'))
          .width(60)
          .onClick(()=>{
            //返回前的警告
            router.showAlertBeforeBackPage({
              message:'确定要返回吗？'
            })
            //返回上一页
            router.back()
          })
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

      TextInput({placeholder:"请输入测试数据组数" })
        .type(InputType.Number)
        .width("90%")
        .onChange(value=>{
          globalThis.num1=parseInt(value)
        })

      Button("开始")
        .width("30%")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          router.pushUrl({
            url:'pages/Show'
          },
            router.RouterMode.Single)
        })
    }
  }
}