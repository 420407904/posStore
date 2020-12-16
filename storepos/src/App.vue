<template>
  <div id="app">
    <Aside></Aside>
    <div class="main">
      <router-view/>
    </div>
  </div>
</template>
<script>
import Aside from '@/components/common/aside'
export default {
  components:{
    Aside
  }
}
</script>
<style>
html,body{
            margin: 0;
            padding: 0;
            height: 100%;
        }
.main{
  float: left;
  width: 95%;
  background-color: #EFF2F7;
  height: 100%;
  overflow-y: scroll;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  height:100%;
}

::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}

::-webkit-scrollbar-thumb {
  background-color: #0aa1ed;
  border-radius: 3px;
}
body {
  width: 100%;
  padding: 0;
  margin: 0;
  overflow-x: hidden;
  color: #333333;
  font-family: PingFang-SC-Medium, PingFangSC, "Microsoft Yahei", Helvetica,
    Tahoma, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", STXihei, STHeiti,
    Heiti, SimSun, sans-serif !important;
  font-size: 12px;
}
[class*=" el-icon-"],
[class^="el-icon-"] {
  font-size: 20px;
}
::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
  background: rgba(0, 0, 0, 0.2);
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
input[type="number"] {
  -moz-appearance: textfield;
}
*,
p {
  padding: 0;
  margin: 0;
}
a {
  text-decoration: none;
}
li {
  list-style: none;
}
input {
  outline: none;
}
button {
  display: block;
  border: none;
  outline: 0;
  background: #fff;
}
a:link,
a:visited,
a:hover,
a:active {
  color: #0099ff;
}
.lf {
  float: left;
}
.rt {
  float: right;
}
.clear:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.clear {
  zoom: 1;
}
.textarea:focus {
  outline-color: rgba(190, 184, 149, 1);
}
i {
  display: inline-block;
  vertical-align: middle;
}
</style>
