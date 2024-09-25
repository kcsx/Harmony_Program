import { http } from '@kit.NetworkKit'
class Result{
  data:DataFrame[] = []
  has_more:string = ''
  message:string = ''
}
class DataFrame{
  Abstract:string = ''
  comment_count:number = 0
  image_list:ImgList[] = []
}
class ImgList{
  url:string = ''
  url_list:UrlList[] = []
}
class UrlList{
  url:string = ''
}
//
@Component
export struct News{
  @State proxy:string = ''
  @State channelId:string = ''
  @State idx:number = 0
  @Provide info:Result = new Result()
  scroller: Scroller = new Scroller()
  getNews(){
    // let url= 'https://www.toutiao.com/api/pc/list/feed?channel_id=0&min_behot_time=1727077365&offset=0&refresh_count=3&category=pc_profile_recommend&aid=24&app_name=toutiao_web&msToken=6zSsGY1agIh50-ikI8qybB8XZyTd7zlD1rtCJxLBlJx8ypr7qtTyFukGiLwlsB5tfrbxh80zmnUyoISaDHsryGry7VyNDwZ4NWFljcvJ-JM4-FTMidiogJoE9oQmBiE%3D&a_bogus=Yf8qBDwDmEfiDd6p54oLfY3qVvr3YgCz0t9bMDhqidvfD639HMOB9exExYXvnfujNT%2FdIbfjy4hJYpHMicc9A3v6HSRKl2xp-g00t-P2so0j5ZhjCfuDnzfF-vzWt-Bd-Jd3i57My7ICKmw0AIee-wHvnwVxapSE'
    // let url='https://www.toutiao.com/api/pc/list/feed?channel_id=0&min_behot_time=1727078746&offset=0&refresh_count=2&category=pc_profile_recommend&aid=24&app_name=toutiao_web&msToken=2KKZvRJmDDIgDUGhMeDbUa2GdpOJGAg7o23kVM5B6wVLZcxzfGvVV2t0IfLaoABUzSOGMzhQ_nUFeeoH9kYzGRILXK98qv6E9__uxla5ty29taaAG-w88g%3D%3D&a_bogus=OX80BQ0gDkVsDfSV54oLfY3qVVB3YgC40t9bMDhqqxvfKL39HMOT9exExPhvWxfjNT%2FdIbfjy4hJO3rMicc9A3v6HSRKl2xp-g00t-P2so0j5ZhjCfuDnzfF-vzWt-Bd-Jd3xOJ8y7ItFRs0AIee-wHvnwVxapSs'
    // let url = 'https://www.toutiao.com/api/pc/list/feed?channel_id=3189398999&min_behot_time=1727079198&offset=0&refresh_count=2&category=pc_profile_channel&client_extra_params=%7B%22short_video_item%22%3A%22filter%22%7D&aid=24&app_name=toutiao_web&msToken=PjytoZxNjynvRy8TsMYB8b-A3HdcmqaK_oJX9kfarWnl-_kx7-B2UPOnI1SGhnkle_Zypd2RlCs1CDJWg6KBHTlxdSJ-x1emIbxSQ6o8UBgJaKQ0xRIHTuGNwDK85kg%3D&a_bogus=Oj8ZMVugdDVpDf6254oLfY3qVUp3YgCD0t9bMDhqFxvfi639HMTJ9exExOiv3AyjNT%2FdIeEjy4hJO3rMicc9A3v6HSRKl2xp-g00t-Pg5o0j5HvruyR0rtRF4ki-FeeM5iQ3xOssy7CrFSRdl99HmhK4bfebY7Y6i6tr6E%3D%3D'
    // let url = 'https://www.toutiao.com/api/pc/list/feed?channel_id=3189398999'
    // let url= 'https://www.toutiao.com/api/pc/list/feed?offset=0&channel_id=94349549395&max_behot_time=0&category=pc_profile_channel&disable_raw_data=true&aid=24&app_name=toutiao_web&msToken=aL-ddGCSCsfJ-XabenMRYWhsoI3GF3hn_A0UiNxaMX6z-OaiZ7SdmDwYl9s-tBz6lg1IWFio5QYfLZTmihuF27lOXe9HwkIrb48y0Z-6SdnNsrKahA2QI1XQrpxfnHo%3D&a_bogus=mJm0%2FmgXDEIsvDSd54oLfY3qVWa3YgC80t9bMDhq4Vvf-g39HMT49exExOvvT0fjNT%2FdIeEjy4hJOpaMicc9A3v6HSRKl2xp-g00t-Ph5o0j5qvruyR0rtRF4ki-FeeM5iQ3xOssy7CtzSRdloKrmhK4bfebY7Y6i6triE%3D%3D'
    let url = 'https://www.toutiao.com/api/pc/list/feed?channel_id=3189398999&min_behot_time=0&offset=0&refresh_count=1&category=pc_profile_channel&client_extra_params=%7B%22short_video_item%22%3A%22filter%22%7D&aid=24&app_name=toutiao_web&msToken=aL-ddGCSCsfJ-XabenMRYWhsoI3GF3hn_A0UiNxaMX6z-OaiZ7SdmDwYl9s-tBz6lg1IWFio5QYfLZTmihuF27lOXe9HwkIrb48y0Z-6SdnNsrKahA2QI1XQrpxfnHo%3D&a_bogus=dfmwQD0hDEDkXfyZ54oLfY3qVX13YgC80t9bMDhqfdvf-g39HMTA9exExOvvT0SjNT%2FdIeEjy4hJOpaMicc9A3v6HSRKl2xp-g00t-Ph5o0j5qvruyR0rtRF4ki-FeeM5iQ3xOssy7CtzSRdloKrmhK4bfebY7Y6i6tr0D%3D%3D'
    let httpRequest = http.createHttp()

    // console.log('gtjrj')
    httpRequest.request(url,{
      method:http.RequestMethod.GET,
      header:{
        cookie:'__ac_signature=_02B4Z6wo00f015thy7wAAIDCRDo48OX3OiObQc8AAIAx68; tt_webid=7417727346286167552; gfkadpd=24,6457; ttcid=1be8ee1b350e41db8dbfa71e954c3d2237; x-web-secsdk-uid=79e2ab50-618f-4392-ba3f-e03f216d593d; s_v_web_id=verify_m1enf5be_II4sF7u3_m9ah_4jTC_8Lnu_Uyv1BBMYJQ9P; local_city_cache=%E9%95%BF%E6%B2%99; csrftoken=d076a8454bb987d7bc69beb02a82110c; _ga=GA1.1.48546437.1727074258; ttwid=1%7CE3izJ5mUCAfkjeqRhMjK43uIzHRAC2O8p3sMgEpFPIA%7C1727077363%7C70043996b41ffe59047258a76364d192e617ee2357b764721ddd315245b558d8; _ga_QEHZPBE5HH=GS1.1.1727077359.2.1.1727077361.0.0.0; tt_scid=fEAe0HoU4-Vezh92WVJC5NIy05bMoiu48qCag94T5szPOsIqq5-dBrwnffjwGmnIdcb8',
        'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'
      }
    }).then((val)=>{
      console.log('feifh')
      this.info = JSON.parse(val.result.toString())
      console.log(this.info.data[0]?.Abstract)
      console.log(this.info.data[0]?.image_list[0]?.url_list[0]?.url)
      console.log(this.info.data[0]?.comment_count.toString())
    })
  }
  build() {
    Scroll(this.scroller) {
      Column({space:10}) {
        Row() {
          Image('/pages/news.svg')
            .width(35)
            .height(35)
            .margin({ top:10,left:5,right:10,bottom:10 })
          Search({ placeholder: '欢迎搜索每日新闻' })
            .width(250)
          // .height()
          Image('/pages/ear.svg')
            .width(30)
            .height(30)
            .margin(10)
        }

        Column() {
          Tabs() {
            TabContent() {
              Column(){
                ForEach(this.info.data,(item:DataFrame,idx)=>{
                  card({data:item,idx:idx})
                })

              }
              // .backgroundColor('#f4f6f5')
            }.tabBar('要闻')
            .backgroundColor('#f4f6f5')

            TabContent() {
              Column() {
                ForEach(this.info.data, (item: DataFrame, idx) => {
                  card({ data: item, idx: idx })
                })
              }
            }.tabBar('国内')
            .backgroundColor('#f4f6f5')

            TabContent() {
              Column() {
                ForEach(this.info.data, (item: DataFrame, idx) => {
                  card({ data: item, idx: idx })
                })
              }
            }.tabBar('国际')
            .backgroundColor('#f4f6f5')
            TabContent() {
              Column() {
                ForEach(this.info.data, (item: DataFrame, idx) => {
                  card({ data: item, idx: idx })
                })
              }
            }.tabBar('娱乐')
            .backgroundColor('#f4f6f5')
            TabContent() {
              Column() {
                ForEach(this.info.data, (item: DataFrame, idx) => {
                  card({ data: item, idx: idx })
                })
              }
            }.tabBar('体育')
            .backgroundColor('#f4f6f5')
            TabContent() {
              Column() {
                ForEach(this.info.data, (item: DataFrame, idx) => {
                  card({ data: item, idx: idx })
                })
              }
            }.tabBar('军事')
            .backgroundColor('#f4f6f5')
          }
          .onChange((idx)=>{
            if(idx===0)
            {
              this.idx=0
              this.getNews()
            }
            if(idx===1){
              this.idx=1
              this.getNews()
            }
            if(idx===2) {
              this.idx=2
              this.getNews()
            }
            if(idx===3) {
              this.idx=3
              this.getNews()
            }
            if(idx===4) {
              this.idx=4
              this.getNews()
            }
            if(idx===5){
              this.idx=5
              this.getNews()
            }
          })
        }
      }
      //
    }
    // .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
}

@Component
struct card{
  @State title:string = ''
  @State content:string = ''
  @State author:string = ''
  @State url:string[] = []
  @Consume info:Result
  data:DataFrame = new DataFrame()
  idx:number = 0
  build() {
    Column() {
      Column() {
        Text(this.data.Abstract.toString())
          .textOverflow({ overflow: TextOverflow.None })
          .maxLines(1)
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .margin({
            top: 20,
            left: 20,
            right: 20,
            bottom: 10
          })
        Row() {
          Image(this.data.image_list[0]?.url_list[0]?.url)
            .width(80)
            .height(70)
            .margin({ right: 10, left: 10 })
          Image(this.data.image_list[1]?.url_list[0]?.url)
            .width(80)
            .height(70)
            .margin({ right: 10, left: 10 })
          Image(this.data.image_list[2]?.url_list[0]?.url)
            .width(80)
            .height(70)
            .margin({ right: 10, left: 10 })
        }.justifyContent(FlexAlign.Start)

        Text(this.data.comment_count.toString() + ' 评论')
          .fontSize(10)
          .fontColor('#baaf83')
          .margin({ top: 10, right: 150 })
      }
      .margin({ top: 10, bottom: 10 })
      .width("100%")
      .height(160)
      .backgroundColor(Color.White)
      .borderRadius(10)
    }
  }
}
//