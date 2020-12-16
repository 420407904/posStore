<template>
  <div class="pos">
      <el-row>
          <el-col :span='7' class="pos-order" id="order-list">
             <el-tabs>
                 <el-tab-pane label="点餐">
                     <el-table :data="tableData" border style="width:100%" >
                         <el-table-column prop="goodsName" label="商品名称"></el-table-column> 
                         <el-table-column prop="count" label="数量" width="60"></el-table-column> 
                         <el-table-column prop="price" label="金额" width="100"></el-table-column> 
                         <el-table-column label="操作" fixed="right" width="150">
                            <template scope="scope">
                                <el-button type="text" size="small" @click="delGood(scope.row)">删除</el-button>
                                <el-button type="text" size="small" @click="addOrderList(scope.row)">增加</el-button> 
                            </template>     
                        </el-table-column> 
                     </el-table>
                     <div class="total">
                         <span style="margin-right:20px">数量：{{totalCount}}</span>
                         <span>总价：{{totalMoney}}元</span>
                     </div>
                     <div class="dbtn">
                         <el-button type="warning">挂单</el-button>
                         <el-button type="danger" @click="delall">删除</el-button>
                         <el-button type="success" @click="checkout" >结账</el-button>
                     </div>
                 </el-tab-pane>
                 <el-tab-pane label="挂单">
                     挂单
                 </el-tab-pane>
                 <el-tab-pane label="外卖">

                 </el-tab-pane>
             </el-tabs>
          </el-col>
          <el-col :span="17">
              <div class="often-goods">
                  <div class="title">常用商品</div>
                  <div class="often-goods-list">
                      <ul>
                          <li v-for=" (item,index) in offenGoods" :key="index" @click="addOrderList(item)" style="cursor:pointer;">
                              <span>{{item.goodsname}}</span>
                              <span class="o-price">¥{{item.price}}元</span>
                          </li>
                      </ul>
                  </div>
              </div>
              <div class="goods-type">
                  <el-tabs>
                      <el-tab-pane label="汉堡">
                        <div>
                            <ul class='cookList'>
                                <li v-for="(goods,index) in type0Goods" :key="index" @click="addOrderList(goods)" style="cursor:pointer;">
                                    <span class="foodImg"><img :src="goods.goodsimg" width="100%"></span>
                                    <span class="foodName">{{goods.goodsname}}</span>
                                    <span class="foodPrice">￥{{goods.price}}元</span>
                                </li>
                            </ul>
                        </div>
                      </el-tab-pane>
                      <el-tab-pane label="小食">
                       <div>
                            <ul class='cookList'>
                                <li v-for="(goods,index) in type1Goods" :key="index" @click="addOrderList(goods)" style="cursor:pointer;">
                                    <span class="foodImg"><img :src="goods.goodsimg" width="100%"></span>
                                    <span class="foodName">{{goods.goodsname}}</span>
                                    <span class="foodPrice">￥{{goods.price}}元</span>
                                </li>
                            </ul>
                        </div>
                      </el-tab-pane>
                      <el-tab-pane label="饮料">
                        <div>
                            <ul class='cookList'>
                                <li v-for="(goods,index) in type2Goods" :key="index" @click="addOrderList(goods)" style="cursor:pointer;">
                                    <span class="foodImg"><img :src="goods.goodsimg" width="100%"></span>
                                    <span class="foodName">{{goods.goodsname}}</span>
                                    <span class="foodPrice">￥{{goods.price}}元</span>
                                </li>
                            </ul>
                        </div>
                      </el-tab-pane>
                      <el-tab-pane label="套餐">
                        <div>
                            <ul class='cookList'>
                                <li v-for="(goods,index) in type3Goods" :key="index" @click="addOrderList(goods)" style="cursor:pointer;" >
                                    <span class="foodImg"><img :src="goods.goodsimg" width="100%"></span>
                                    <span class="foodName">{{goods.goodsname}}</span>
                                    <span class="foodPrice">￥{{goods.price}}元</span>
                                </li>
                            </ul>
                        </div>
                      </el-tab-pane>
                  </el-tabs>
              </div>
          </el-col>
      </el-row>
  </div>
</template>

<script>
import axios from 'axios';

export default {
    name:'pos',
    data(){
        return{
            tableData:[
            ],
            offenGoods:[ 
            ],
            type0Goods:[
            ],
            type1Goods:[
            ],
            type2Goods:[
            ],
            type3Goods:[
            ],
            // totalMoney:0,
            // totalCount:0,
      
        }
    },
    methods:{
        addOrderList(goods){
            // this.totalMoney=0;
            // this.totalCount=0;
            //商品是否存在于订单列表中
            let isHave=false;
            for(let i=0;i<this.tableData.length;i++){
                if(this.tableData[i].goodsId==goods.goodsId){
                    isHave=true;
                }
            }
            //根据判断的值编写业务逻辑
            if(isHave){
                //改变列表中商品的数量
                let arr = this.tableData.filter(a=>a.goodsId == goods.goodsId)
                arr[0].count++;
            }else{
                let newGoods={goodsId:goods.goodsId,goodsName:goods.goodsname,price:goods.price,count:1}
                this.tableData.push(newGoods);
            }
            //计算汇总金额和数量
            // this.tableData.forEach(ele=>{
            //     this.totalCount+=ele.count;
            //     this.totalMoney=this.totalMoney+(ele.price*ele.count)
            // })
        },
        delGood(good){
            this.tableData=this.tableData.filter(a=>a.goodsId!=good.goodsId)
        },
        delall(){
            this.tableData=[];
        },
        checkout(){
            if(this.totalCount!=0){
                this.tableData=[];
                this.$message({
                    message:'结账成功，感谢你又为店里做出了贡献',
                    type:'success'
                })
            }else{
                this.$message.error('不能空结哦!')
            }
        }
    },
    computed:{
        totalCount(){
            let totalCount=0;
             this.tableData.map(item=>{totalCount+=item.count})
             return totalCount
        },
        totalMoney(){
            let totalMoney=0;
            this.tableData.map(item=>{totalMoney+=(item.price*item.count)})
             return totalMoney
        }
    },
    created:function(){
        axios({
            method:'get',
            url: 'http://127.0.0.1:3000/offenGoods',
        }).then((res)=>{
            this.offenGoods=res.data.results;
        }).catch(err=>{
            alert('网络错误,不能访问')
        })

        axios({
            method:'get',
            url: 'http://127.0.0.1:3000/type0Goods',
        }).then((res)=>{
            console.log(res)
            this.type0Goods=res.data.results;
        }).catch(err=>{
            alert('网络错误,不能访问')
        })
        axios({
            method:'get',
            url: 'http://127.0.0.1:3000/type1Goods',
        }).then((res)=>{
            console.log(res)
            this.type1Goods=res.data.results;
        }).catch(err=>{
            alert('网络错误,不能访问')
        })
        axios({
            method:'get',
            url: 'http://127.0.0.1:3000/type2Goods',
        }).then((res)=>{
            console.log(res)
            this.type2Goods=res.data.results;
        }).catch(err=>{
            alert('网络错误,不能访问')
        })
        axios({
            method:'get',
            url: 'http://127.0.0.1:3000/type3Goods',
        }).then((res)=>{
            console.log(res)
            this.type3Goods=res.data.results;
        }).catch(err=>{
            alert('网络错误,不能访问')
        })
    },
    mounted:function(){
        // var orderHeight=document.body.clientHeight;
        // document.getElementById('order-list').style.height=orderHeight+'px'
    }
}
</script>

<style scoped>
.pos-order{
    background-color: #F9Fafc;
    border-right: 1px solid #c0ccda;
    height: 750px;
}
.dbtn{
    margin-top: 20px;
}
/deep/.el-table th > .cell {
  text-align: center;
}

/deep/.el-table .cell {
  text-align: center;
}
.title{
    border-bottom: 1px solid #d3dce6;
    background-color: #f9fafc;
    padding: 10px;
    font-size: 20px;
}
.often-goods-list ul li{
    list-style: none;
    float: left;
    border:1px  solid #e5e9f2;
    padding: 10px;
    margin: 10px;
    background-color: white;

}
.o-price{
    color: #58b7ff;
    margin-left:5px ;
}
.goods-type{
    margin-top: 20px;
    clear: both;
}
.cookList li{
       list-style: none;
       width:23%;
       border:1px solid #E5E9F2;
       height: auot;
       overflow: hidden;
       background-color:#fff;
       padding: 2px;
       float:left;
       margin: 2px;

   }
   .cookList li span{
        display: block;
        float:left;
   }
   .foodImg{
      width: 100px;
      height: 100px;
   }
   .foodName{
       font-size: 18px;
       padding-left: 10px;
       color:brown;

   }
   .foodPrice{
       font-size: 16px;
       padding-left: 10px;
       padding-top:10px;
   }
.total{
    background-color: #fff;
    padding: 10px;
    border-bottom: 1px solid #d3dce6;
    font-size:25px ;
}
</style>