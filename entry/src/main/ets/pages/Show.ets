import router from '@ohos.router';

function calculatePossibleWinners(matrix: number[][], n: number): number {
  // dp[i] 表示第 i 个人是否可能成为最后的胜者
  let dp: boolean[] = new Array(n).fill(true);

  // 逐一模拟每场决斗并更新 dp 数组
  for (let k = 0; k < n; k++) {
    // 淘汰第 k 个人和他右边的人（k+1），注意 k+1 可能超过 n-1，需要取模
    let loserIndex = (k + 1) % n;
    // 如果第 k 个人败给了 loserIndex，则 dp[k] = false
    if (matrix[k][loserIndex] === 0) {
      dp[k] = false;
    }
  }

  // 统计 dp 数组中 true 的数量
  let possibleWinners = dp.filter(val => val).length;
  return possibleWinners;
}

function stringToMultiDArray(str: string, dimensions: number[]): number[][] {
  const elements = str.split(';');
  const result: number[][] = [];

  function populateArray(arr: any[], dims: number[], index: number): void {
    for (let i = 0; i < dims[index]; i++) {
      if (index === dims.length - 1) {
        arr.push(Number(elements.shift()));
      } else {
        arr.push([]);
        populateArray(arr[i], dims, index + 1);
      }
    }
  }

  populateArray(result, dimensions, 0);
  return result;
}


@Entry
@Component
struct Show{
  @State num2: number=0 ;
  @State num3: string='0';
  @State result: number=0;
  build(){
    Column({space:20}){
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

        Image($r('app.media.home'))
          .width(55)
          .onClick(()=>{
            //返回前的警告
            router.showAlertBeforeBackPage({
              message:'确定要返回首页吗？'
            })
            //返回到首页
            router.back({
              url: 'pages/Index'
            })
          })
      }
      .width('100%')
      .height(80)
      .margin({top:20})
      .padding({left:20,right:20})

      Image($r("app.media.duel"))
        .width("95%")

      TextInput({placeholder:"请输入决斗总人数" })
        .type(InputType.Number)
        .width("90%")
        .onChange(value=>{
          this.num2=parseInt(value)
        })

      TextInput({placeholder:"请输入数组并用;隔开" })
        .width("90%")
        .type(InputType.Normal)
        .onChange(value=>{
          this.num3=value
        })

      Button('确认')
        .width("30%")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          this.result=calculatePossibleWinners(stringToMultiDArray(this.num3,[this.num2,this.num2]),this.num2);
        })

      Text('最后可能获胜的人数为'+this.result+'人')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      if (globalThis.num1>1){
        Button('继续执行下一组')
          .width("60%")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            globalThis.num1--
            if (globalThis.num1>0){
              router.pushUrl(
                {
                  url:'pages/Show'
                },
                router.RouterMode.Standard)
            }
          })
      }
    }
  }
}
