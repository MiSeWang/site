<template>
  <div class="index_main_center_top public_border_solid">
    <div class="index_main_picture">
      <ul>
        <li class="index_main_picture_center ">
          <img src="../../../static/img/index1.jpg" width="800" height="250">
        </li>
        <li><img src="../../../static/img/index2.jpg" width="800" height="250"></li>
        <li><img src="../../../static/img/index3.jpg" width="800" height="250"></li>
        <li><img src="../../../static/img/index4.jpg" width="800" height="250"></li>
      </ul>
      <a href="javascript:;"><span id="picture_left"></span></a>
      <a href="javascript:;"><span id="picture_right"></span></a>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'RotationComponent'
  }
</script>

<style scoped>
  .index_main_center_top {
    margin-bottom: 50px;
    /*width: 800px;*/
    height: 250px;
  }

  .index_main_picture {
    float: left;
    width: 800px;
    height: 250px;
    margin-right: 50px;
    margin-bottom: 50px;
    position: relative;
  }

  .index_main_picture ul li {
    display: none;
  }

  .index_main_picture ul .index_main_picture_center {
    display: inline;
  }

  #picture_left {
    display: block;
    width: 26px;
    height: 44px;
    position: absolute;
    z-index: 5;
    background-image: url(/static/icons/product_left.png);
    opacity: 0.5;
    left: 5px;
    top: 103px;
  }

  #picture_right {
    display: block;
    width: 26px;
    height: 44px;
    position: absolute;
    z-index: 5;
    background-image: url(/static/icons/product_right.png);
    opacity: 0.5;
    left: 769px;
    top: 103px;
  }
</style>
