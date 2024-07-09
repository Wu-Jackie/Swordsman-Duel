import router from '@ohos.router'

@Component
export struct Header{
  build(){
    Row(){
      Image($r('app.media.back'))
        .width(50)
        .onClick(()=>{
          //返回前的警告
          router.showAlertBeforeBackPage({
            message:'确定要返回吗？'
          })
          //返回上一页
          router.back()
        })
      Blank()
      Image($r('app.media.CSLogo'))
        .width(50)
    }
    .width('100%')
    .height(50)
    .padding({left:25,right:25})
  }
}