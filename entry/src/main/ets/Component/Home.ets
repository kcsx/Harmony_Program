interface ShowInterface{
  name:string
  iconUrl:string
}
interface GoodsShowInterface{
  name:string
  iconUrl:string
  price:string
}
class Show implements  ShowInterface{
  name:string=''
  iconUrl:string=''
}
class GoodsShow{
  name:string = ''
  iconUrl:string= ''
  price:string= ''
}
@Component
export struct Home{
  @Prop idx:number
  scroller: Scroller = new Scroller();
  show1:ShowInterface[] = [
    {name:'限时抢购',iconUrl:'/pages/media/menu_xsqg.png'},
    {name:'精美服装',iconUrl:'/pages/media/menu_jmfs.png'},
    {name:'护肤美妆',iconUrl:'/pages/media/menu_hfmz.png'},
    {name:'食品饮料',iconUrl:'/pages/media/menu_spyl.png'},
    {name:'高级美酒',iconUrl:'/pages/media/menu_gdmj.png'},
    {name:'母婴玩具',iconUrl:'/pages/media/menu_myqz.png'},
    {name:'生活用品',iconUrl:'/pages/media/menu_spyl.png'},
    {name:'厨房用品',iconUrl:'/pages/media/menu_wjsp.png'},
  ]
  carousel:string[]=[
    '/pages/media/banner1.jpeg',
    '/pages/media/banner2.jpeg',
    '/pages/media/banner3.jpeg',
    '/pages/media/banner4.jpeg',
    '/pages/media/banner5.jpeg',
    '/pages/media/banner6.jpeg'
  ]
  build() {
    Scroll(this.scroller) {
      Column() {
        Swiper() {
          Image("/pages/media/banner1.jpeg")
          Image("/pages/media/banner2.jpeg")
          Image("/pages/media/banner3.jpeg")
          Image("/pages/media/banner4.jpeg")
          Image("/pages/media/banner5.jpeg")
          Image("/pages/media/banner6.jpeg")
        }.width("100%")
        .height("20%")
        Flex({
          justifyContent: FlexAlign.Center,
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap
        }) {
          ForEach(this.show1, (item: ShowInterface, idx) => {
            Applet({ item: item })
          })
        }.layoutWeight(1)
        Goods()
          .layoutWeight(1)
      }
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Black) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
}
}
@Component
struct Applet{
  item:Show = new Show()
  build() {
    Stack(){
      Text(this.item.name)
        .fontWeight(FontWeight.Bold)
        .fontSize(10)
        .padding({top:100})
        .width("20%")
        .height("20%")
        .textAlign(TextAlign.Center)
      Image(this.item.iconUrl)
        .margin({ left:20,right:20 })
        .width(50)
        .height(50)
    }
  }
}
@Component
struct Goods{
  item:Show = new Show()
  show2:GoodsShowInterface[] = [
    {name:'葡萄饼干',iconUrl:'/pages/media/detail_banner1.jpg',price:'$10'},
    {name:'精品核桃',iconUrl:'/pages/media/detail_banner2.jpg',price:'$20'},
    {name:'葡萄饼',iconUrl:'/pages/media/detail_banner3.jpg',price:'$15'},
    {name:'早餐饼',iconUrl:'/pages/media/detail_banner4.jpg',price:'$24'},
    {name:'早餐葡萄饼',iconUrl:'/pages/media/detail_banner5.jpg',price:'$13'},
    {name:'坚果曲奇',iconUrl:'/pages/media/goods1.jpg',price:'$37'},
    {name:'乳酪蛋糕',iconUrl:'/pages/media/goods2.jpg',price:'$25'},
    {name:'风扇',iconUrl:'/pages/media/goods3.jpg',price:'$23'},
  ]
  build() {
      Column(){
        Grid(){
          ForEach(this.show2,(str:GoodsShow,idx)=>{
            Good({ item: str })
          })
        }
        .rowsTemplate("1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr")
        .columnsTemplate("1fr 1fr")
        .rowsGap(10)
        .columnsGap(30)
        .width(330)
        // .height(350)
.height(1400)
      }
  }
}
@Component
struct Good{
  item:GoodsShow = new GoodsShow()
  build() {
Column(){
  Stack(){
    Column(){
      Text(this.item.name)
      Row() {
        Text('价格：')
        Text(this.item.price)
          .fontColor(Color.Red)
      }
    }.padding({top:120})
    Image(this.item.iconUrl)
      .margin({ bottom:30 })
      .width(120)
      .height(90)
  }}
.backgroundColor('#e2b4ae')
.borderRadius(20)
  }
}