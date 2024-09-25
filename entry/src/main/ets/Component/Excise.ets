@Component
export struct Excise {
  // @State words
  @State accRate: number = 0
  @State progressVal: number = 0
  @State cnt: number = 0
  @State timeCnt:number = 0
  @State taskId:number = -1
  @State format: string = 'HH:mm:ss:SS'
  @State page:number = 0
  @State correctCnt:number = 0
  //
  @State ansColor:string[] = ['#1ac07b','#c95351']
  @State ansColorIdx:number = -1
  @State startSign:number = 0
  idx:number = 0
  scroller: Scroller = new Scroller()
  textTimerController: TextTimerController = new TextTimerController()
  example:string[][] = [
    ['flower','The garden is filled with colorful flowers.','树木','草地','花','灌木'],
    ['student', 'No student is to leave the room.','电脑','学生','桌子','门'],
    ['teacher',
  'There is a growing need for qualified teachers of Business English.','字母','人类','页面','教师'],
    ['ant','Ants are small crawling insects that live in large groups.','正确','蚂蚁','天空','大楼'],
   ['year','It\'s years since we last met.','年','裤子','鼠标','手机'],
   [ 'day', 'I could sit and watch the river all day long.','日、天','商店','时间','数量'],
    ['month', 'A month is a period of about four weeks.', '食物','饮料','月份','玩具'],
    ['sun','A sun is any star which has planets going around it.','小孩','服装','家','太阳'],
    ['moon', 'They were the first men to land on the moon.' ,'护肤品','舅舅','核桃','月亮'],
    ['light', 'Could you move─you\'re in my light.','蓝色','光线','屏幕','酒']
  ]
  @State totalCnt:number = this.example.length
  @State ans:number[][]=[
    [0,0,0,0,1,1,0,0,0,0],
    [0,1,1,1,0,0,0,0,0,1],
    [1,0,0,0,0,0,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0]
  ]

  build() {
    Scroll(this.scroller) {
    Column() {
      Row() {
        Column() {
          Row() {
            Image('/pages/acc.svg')
              .width(20)
              .height(20)
              .margin({top:20,left:20,right:15,bottom:10})
            Text('准确率')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
              .margin({top:10})
          }

          Row() {
            Image('/pages/progress.svg')
              .width(20)
              .height(20)
              .margin(10)
            Text(' 进度')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
          }

          Row() {
            Image('/pages/cnt.svg')
              .width(20)
              .height(20)
              .margin(10)
            Text(' 个数')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
          }

          Row() {
            Image('/pages/time.svg')
              .width(20)
              .height(20)
              .margin(10)
            Text(' 用时')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
          }

        }.margin({right:70})

        Column() {
          Text(this.accRate.toString()+'%').fontSize(15)
            .fontWeight(FontWeight.Bold)
            .margin({ top:10,bottom:20 })
          Progress({ value: this.page, total: 10, type: ProgressType.Linear })
            .width(80)
            .margin(10)
            .backgroundColor(Color.Black)
          Text(this.page.toString()).fontSize(15)
            .fontWeight(FontWeight.Bold)
            .margin({top:17})
          TextTimer({ isCountDown: false, controller: this.textTimerController })
            .format(this.format)
                .fontSize(15)
                .margin({top:20})
                .fontWeight(FontWeight.Bold)
            .onTimer((utc: number, elapsedTime: number) => {
              console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
            })
        }
      }
      .borderRadius(20)
        .backgroundColor(Color.White)
      .margin({ top:30,left:20,right:20 })

        Column() {
          Text(this.example[this.page][0])
            .margin({top:30,bottom:20})
            .fontSize(40)
            .fontWeight(FontWeight.Bolder)
          Text(this.example[this.page][1])
            .margin({bottom:30,right:10,left:10})
            .fontColor('#9aa0a0')

          Column() {
            Button(this.example[this.page][2])
              .backgroundColor(this.ans[0][this.page]===1?'#1ac07b':Color.White)
              .fontColor(Color.Black)
              .width(300)
              .margin(10)
              .onClick(()=>{
                this.changePage()
              })
            Button(this.example[this.page][3])
              .backgroundColor(this.ans[1][this.page]===1?'#1ac07b':Color.White)
              .fontColor(Color.Black)
              .width(300)
              .margin(10)
              .onClick(()=>{
                this.changePage()
              })
            Button(this.example[this.page][4])
              .backgroundColor(this.ans[2][this.page]===1?'#1ac07b':Color.White)
              .fontColor(Color.Black)
              .margin(10)
              .width(300)
              .onClick(()=>{
                this.changePage()
              })
            Button(this.example[this.page][5])
              .backgroundColor(this.ans[3][this.page]===1?'#1ac07b':Color.White)
              .fontColor(Color.Black)
              .margin(10)
              .width(300)
              .onClick(()=>{
                this.changePage()
              })
          }

          Row() {
            Button('结束答题')
              .backgroundColor('#c75450')
              .fontColor(Color.White)
              .margin(20)
              .onClick(() => {
                this.cease()
                this.textTimerController.reset()
              })
            Button('开始答题')
              .backgroundColor('#1ebf7b')
              .fontColor(Color.White)
              .margin(20)
              .onClick(() => {
                this.textTimerController.start()
                this.start()
              })
          }
        }


    }
    .backgroundColor('#e7fafe')
    .width('100%')
    .height('100%')

  }.scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
  changePage(){
    if(this.startSign === 1){
    ++this.page
    // this.cnt+=this.page
    }
    if(this.page>10){
      this.page = 10
    }
  }
  checkAnswer(){
    ++this.correctCnt
    if(this.correctCnt>10)this.correctCnt=10
  }
  calcAcc(){
    this.accRate = this.correctCnt/this.totalCnt
  }
  start(){
    if(this.page === 0)
    this.startSign = 1
    // else
  }
  cease(){
    this.page=0
    this.accRate=0
    this.cnt=0
    this.timeCnt=0
    this.correctCnt=0
    this.startSign = 0
  }
}
//