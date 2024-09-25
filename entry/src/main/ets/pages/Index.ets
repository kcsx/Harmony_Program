// import {} from ''
import { http } from '@kit.NetworkKit'
import { Home } from '../Component/Home'
import { News } from '../Component/News'
import { Weather } from '../Component/Weather'
import { Excise } from '../Component/Excise'
// import { LiteChart } from '../Component/Shop'
interface Tabs{
  name:string
  iconUrl:string
  icon_s_Url:string
  idx:number
}
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
// class Air{
//   aqi:number = 0
// }
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State idx:number = 0
  @Provide result:Result = new Result()
  @Provide temperature:string[] = []
  @Provide windLevel:string[] = []
  @Provide t_high:number[] = []
  @Provide  t_low:number[] = []
  @Provide wind:number[] = []
  tab:Tabs[]=[
    {name:'首页',iconUrl:'/pages/main.svg',icon_s_Url:'/pages/main_s.svg',idx:0},
    {name:'新闻',iconUrl:'/pages/new.svg',icon_s_Url:'/pages/new_s.svg',idx:1},
    {name:'练习',iconUrl:'/pages/excise.svg',icon_s_Url:'/pages/excise_s.svg',idx:2},
    {name:'天气',iconUrl:'/pages/c.svg',icon_s_Url:'/pages/c_s.svg',idx:3}
  ]
  build() {
    Column(){
      Tabs(){
        TabContent(){
          Home()
          // News()
            // .backgroundImage('https://tse2-mm.cn.bing.net/th/id/OIP-C.0hJOEH-nBe8nxpWMznmkcgHaQC?rs=1&pid=ImgDetMain')
        }
          .tabBar(this.Tab(this.tab[0]))
        TabContent(){
          News()
          // Home()
        }
        .tabBar(this.Tab(this.tab[1]))
        TabContent(){
          // Text("Page 3")
          Excise()
        }
        .tabBar(this.Tab(this.tab[2]))
        TabContent(){
          Weather()
        }
        .tabBar(this.Tab(this.tab[3]))
      }
      .barPosition(BarPosition.End)
      .onChange((idx)=>{
        if(idx === 0) this.idx = 0
        if(idx === 1) {
          this.idx = 1
          // this.getInfo()
          // console.log("this.data.date")
          // console.log(JSON.parse(this.result.data.toString()))
        }
        if(idx === 2) this.idx = 2
        if(idx === 3) {
          this.getInfo()
          this.idx = 3
        }
      })

    }

  }
  getInfo(){
    // let url = 'https://api.vvhan.com/api/weather?city=北京&type=week'
    let url = 'https://api.oioweb.cn/api/weather/weather?city_name=%E9%83%91%E5%B7%9E%E5%B8%82'
    let httpRequest=http.createHttp()
    let date = new Date()
    // console.log("snf")
    httpRequest.request(url,{
      method:http.RequestMethod.GET
    }).then((val)=>{
      console.log("sih")
      this.result = JSON.parse(val.result.toString())
      let num:Number = Number(this.result.result.forecast_list[0].high_temperature)
      console.log(num.toString())
      this.t_high.push(Number(this.result.result.forecast_list[0].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[1].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[2].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[3].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[4].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[5].high_temperature))
      this.t_high.push(Number(this.result.result.forecast_list[6].high_temperature))

      this.t_low.push(Number(this.result.result.forecast_list[0].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[1].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[2].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[3].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[4].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[5].low_temperature))
      this.t_low.push(Number(this.result.result.forecast_list[6].low_temperature))

      this.wind.push(Number(this.result.result.forecast_list[0].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[1].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[2].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[3].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[4].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[5].wind_level))
      this.wind.push(Number(this.result.result.forecast_list[6].wind_level))
    })
  }

  @Builder
  Tab(tab:Tabs){
    Stack(){
      Text(tab.name)
        .fontSize(12)
        .margin({top:45})
      Image(tab.idx===this.idx?tab.icon_s_Url:tab.iconUrl)
        .width("35%")
        .height("50%")
    }
  }
}

@Component
struct XX{
  build() {
  }
}
