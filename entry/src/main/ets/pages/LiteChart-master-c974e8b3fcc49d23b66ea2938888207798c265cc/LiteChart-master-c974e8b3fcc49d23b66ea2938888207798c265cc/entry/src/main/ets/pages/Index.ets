// import * from "@ohos"
import MeasureText from '@ohos.measure';
import { LiteChart } from 'lite_chart'


@Entry
@Component
struct Index {
  @State linesDatas: number[] = [20, 73, 4, 51];

  // @State linesDatas: number[] = [10,20,30,60];

  build() {
    Column() {

      List({ space: 12 }) {

        // 折线图
        ListItem() {
          Row() {
            Text("折线图")
            LiteChart({
              values: $linesDatas,
              axisStyle: "#999999",
              linesStyle: "#000000",
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)
          }
        }

        // 曲线图
        ListItem() {
          Row() {
            Text("曲线图")
            LiteChart({
              // 曲线图
              values: $linesDatas,
              axisStyle: "#999",
              graphStyle: "#f00",
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)
          }
        }

        // 条形图
        ListItem() {
          Row() {
            Text("条形图")
            LiteChart({
              values: $linesDatas,
              axisStyle: "#999",
              barChartStyle: "#00f",
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)


          }
        }


        // 柱状图
        ListItem() {
          Row() {
            Text("柱状图")
            LiteChart({
              values: $linesDatas,
              axisStyle: "#999",
              histogramStyle: "#0ff",
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)
          }
        }

        // 饼图
        ListItem() {
          Row() {
            Text("饼图   ")
            LiteChart({
              values: $linesDatas,
              pieChartStyle: ["#f00", "#0f0", "#00f", "#ff0"]
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)
          }
        }
        // 环形图
        ListItem() {
          Row() {
            Text("环形图")
            LiteChart({
              values: $linesDatas,
              ringWidth:8,
              ringChartStyle: ["#f00", "#0f0", "#00f", "#ff0"]
            })
              .backgroundColor("#4999")
              .width(200)
              .height(80)
          }
        }
      }
      .flexGrow(1)
      .alignListItem(ListItemAlign.Center)
      .padding(12)
    }
  }
}