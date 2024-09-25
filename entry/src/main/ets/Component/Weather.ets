// import { http } from '@kit.NetworkKit'
//非string：string|null = null，string：string = ''
import { LiteChart } from 'lite_chart'
class Result{
  // success:string|null = null
  // city:string = ''
  // data:DataFrame[] = []
  // air:Air|null = null
  // tip:string = ''
  code:string = ''
  result:DataFrame = new DataFrame()
}
class DataFrame{
  // date:string = ''
  // low:string = ''
  // high:string = ''
  // fengxiang:string = ''
  // fengli:string = ''
  aqi:string = ''
  city_name:string = ''
  current_temperature:string = ''
  dat_high_temperature:string = ''
  dat_low_temperature:string = ''
  forecast_list:Forecast[] = []
  tips:string = ''
  update_time:string = ''
  wind_level:string = ''
  quality_level:string = ''
}
class Forecast{
  date:string = ''
  high_temperature:string = ''
  low_temperature:string = ''
  wind_direction:string = ''
  wind_level:string = ''
}

@Component
export struct Weather{
  @Consume result:Result
  @Consume temperature:string[]
  @Consume windLevel:string[]
  @Consume t_high:number[]
  @Consume t_low:number[]
  @Consume wind:number[]
  // @State lines: number[] = [25,35,64,85,86]
//    [ Number(this.result.result?.forecast_list[0]?.high_temperature),
//     Number(this.result.result?.forecast_list[1]?.high_temperature),
//     Number(this.result.result?.forecast_list[2]?.high_temperature),
//     Number(this.result.result?.forecast_list[3]?.high_temperature),
//     Number(this.result.result?.forecast_list[4]?.high_temperature),
//     Number(this.result.result?.forecast_list[5]?.high_temperature),
//     Number(this.result.result?.forecast_list[6]?.high_temperature),
// ]
  scroller: Scroller = new Scroller()
  info:string = ''

  build() {
    Scroll(this.scroller) {
      Column(){
        Search({placeholder:'欢迎搜索每日天气！'})
          .borderRadius(20)
          .backgroundColor(Color.White)
          .margin(20)
        Flex({
          justifyContent:FlexAlign.Start,
          direction:FlexDirection.Row,
          wrap:FlexWrap.Wrap
        }) {
          // Button().onClick(()=>{this.test()})
          // Text(this.result.city)
          Row() {
            Text(this.result.result.city_name)
              .textAlign(TextAlign.Start)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(25)
            Image('/pages/down.svg')
              .width(20)
              .height(20)
            Text(this.result.result.update_time)
              .textAlign(TextAlign.Start)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(25)
          }.margin({ left: 15, top: 10 })

          Row() {
            Text(this.result.result.current_temperature+'°C')
              .textAlign(TextAlign.Start)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(45)
              .margin({ left: 10 })
            Column() {
              Text(this.result.result.dat_low_temperature+'°C'+'-'+this.result.result.dat_high_temperature+'°C')
                .textAlign(TextAlign.Start)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .fontSize(18)
                .margin({ bottom: 5 })
              Text(this.result.result.tips)
                .textAlign(TextAlign.Start)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .fontSize(12)
            }.margin(20)

            Button(this.result.result.aqi+this.result.result.quality_level+ '>')
              .backgroundColor(Color.Green)
              .height(30)
              .margin({ bottom: 20 })
          }
        }
        .height('20%')
        Tabs(){
          TabContent(){
            // Flex({
            //   justifyContent:FlexAlign.Center,
            //   direction:FlexDirection.Row,
            //   wrap:FlexWrap.Wrap
            // }){
            //   Text('历史天气')
            //     .fontColor(Color.White)
            //     .fontSize(30)
            // }
            //
            // .width(100)
            // .height(100)
            // Column(){
            LiteChart({
              values: $t_high,
              axisStyle: "#999999",
              linesStyle: "#000000",
            }).backgroundColor(Color.White)
              .width("80%")
              .height("50%")
            // }

          }
          .tabBar('近7日最高气温')

          TabContent(){
            LiteChart({
              values: $t_low,
              axisStyle: "#999999",
              linesStyle: "#000000",
            }).backgroundColor(Color.White)
              .width("80%")
              .height("50%")
          }
          .backgroundColor(Color.White)
          .tabBar('近7日最低气温')
          TabContent(){
            LiteChart({
              values: $wind,
              axisStyle: "#999999",
              linesStyle: "#000000",
            }).backgroundColor(Color.White)
              .width("80%")
              .height("50%")
          }
          .tabBar('近7日风力')
          // TabContent(){
          //
          // }
          // .tabBar('紫外线')
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .height('30%')
        Column(){
          Column(){
            Text('中国天气网-专业天气预报、气象服务门户')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .padding(10)
            Text('网页2 天之前 · 查询长沙今日天气、周末天气、一周天气、蓝天预报、40日天气预报等，以及长沙的生活指数、健康指数、交通指数、旅游指数等。还可查看长沙的雷达图、气象预警信号 …')
              .margin({ top:10,left:5,right:5,bottom:5 })
              .padding(10)
            // Text('中国天气')
            //   .fontSize(5)
            //   .fontColor('#ececec')
          }
          .borderRadius(10)
          .backgroundColor(Color.White)
          .width('100%')
          .margin({top:10,bottom:10})
          Column(){
            Text('天气，天气预报查询，24小时，今天，明..')
              .padding(10)
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
            Text('网页1 天前 · 长沙市天气预报. 省份： 城市： 00:30更新. 日出06:14. 长沙市. 24.6℃. 日落18:32. 降水量. 0mm. 西北风. 4级. 相对湿度. 95% 体感温度. 25.5℃. 空气质量：- 舒适度：舒适， …')
              .margin(5)
              .padding(10)
            Text('中国天气')
              .fontSize(5)
              .fontColor('#ececec')
          }
          .borderRadius(10)
          .backgroundColor(Color.White)
          .width('100%')
          .margin({top:10,bottom:10})

        }.backgroundColor('#ececec')
        .borderRadius(20)
        .margin({top:30})
        .width('100%')
        .height(300)
      }

      // .backgroundColor(Color.Green)

      .backgroundImageSize(ImageSize.Cover)
      .backgroundImage('/pages/newsbg.jpg')
      .width('100%')
      .height('100%')
    }
    .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }


  // getInfo(){
  //   let url = 'https://api.vvhan.com/api/weather?city=北京&type=week'
  //   let httpRequest=http.createHttp()
  //   httpRequest.request(url,{
  //     method:http.RequestMethod.GET
  //   }).then((val)=>{
  //     // console.log(val.result.toString())
  //     this.result = JSON.parse(val.result.toString())
  //   })
  // }
}