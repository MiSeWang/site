<template>
  <div id="my_dialog" class="my_dialog" v-if="openDialog" v-model="openDialog" prevent-close
            @show="gearDateInit">
      <div class="dialog_container"  style="border-radius: 10px!important;">
          <div class="dialog_body">
            <div class="dialog-title">请选择起始时间</div>
            <div id="gearStartDate" class="gearDatetime">
              <div class="date_ctrl slideInUp">
                <div class="date_roll_mask row">
                  <div class="col-2 date-time-hint">开始时间</div>
                  <div class="datetime_roll col-10">
                    <div>
                      <div class="gear date_yy" data-datetype="date_yy" ></div>
                      <div class="date_grid">
                        <!--                  <div>年</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear date_mm" data-datetype="date_mm"></div>
                      <div class="date_grid">
                        <!--                  <div>月</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear date_dd" data-datetype="date_dd"></div>
                      <div class="date_grid">
                        <!--                  <div>日</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear time_hh" data-datetype="time_hh"></div>
                      <div class="date_grid">
                        <div>:</div>
                      </div>
                    </div>
                    <div>
                      <div class="gear time_mm" data-datetype="time_mm"></div>
                      <div class="date_grid">
                        <!--                  <div>分</div>-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="gearEndDate" style="margin-top: 8px" class="gearDatetime">
              <div class="date_ctrl slideInUp">
                <div class="date_roll_mask row">
                  <div class="col-2 date-time-hint">结束时间</div>
                  <div class="datetime_roll col-10">
                    <div>
                      <div class="gear date_yy" data-datetype="date_yy" ></div>
                      <div class="date_grid">
                        <!--<div>年</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear date_mm" data-datetype="date_mm"></div>
                      <div class="date_grid">
                        <!-- <div>月</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear date_dd" data-datetype="date_dd"></div>
                      <div class="date_grid">
                        <!--<div>日</div>-->
                      </div>
                    </div>
                    <div>
                      <div class="gear time_hh" data-datetype="time_hh"></div>
                      <div class="date_grid">
                        <div>:</div>
                      </div>
                    </div>
                    <div>
                      <div class="gear time_mm" data-datetype="time_mm"></div>
                      <div class="date_grid">
                        <!--<div>分</div>-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <template slot="buttons"  slot-scope="props">
            <q-btn flat label="取消" @click="onCancel()"/>
            <q-btn flat label="确定" @click="onOK()"/>
          </template>
      </div>
  </div>
</template>
<script>
    // import "./LCalendar"

    export default {
        data() {
            return {
                openDialog: false,
                gearStartDate: '',  //开始时间节点
                gearEndDate: '',    //结束时间节点
                startTime: this.dateTimeTurnStr(this.startDateTime), //设置默认值
                endTime: this.dateTimeTurnStr(this.endDateTime),   //设置默认值
                type: 'datetime',
                minY: 1900,
                minM: 1,
                minD: 1,
                maxY: 2099,
                maxM: 12,
                maxD: 31,
                isDown: false,  //按下
                checkDom: '',   //选中的节点
            }
        },
        props:{
            callback: {       //点击确认的回调
                type: Function,
                // required: true, //必给
                default: (data) => {
                }
            },
            startDateTime: { //传递默认的初始时间
                type: Date,
                default: new Date()
            },
            endDateTime: {   //传递默认的结束时间
                type: Date,
                default: new Date()
            },
        },
        watch:{
            openDialog(){

            },
            startDateTime(val){
                this.startTime = this.dateTimeTurnStr(val)
            },
            endDateTime(val){
                this.endTime = this.dateTimeTurnStr(val)
            }
        },
        created() {
        },
        methods: {
            gearDateInit(){
                let that = this
                this.$nextTick(()=>{
                    that.gearStartDate = document.getElementById("gearStartDate");  //获取开始时间节点
                    that.gearEndDate = document.getElementById("gearEndDate");      //获取结束时间节点
                    /** dom 节点生成后执行 初始化， 时间组件初始化 */
                    that.dateTimeCtrlInit(that.gearStartDate, that.startTime);
                    that.dateTimeCtrlInit(that.gearEndDate, that.endTime);
                })
            },
            //初始化年月日时分插件默认值  dateDom传入的时间区节点
            dateTimeCtrlInit(dateDom, defaultDateTime) {
                let date = new Date();  //初始化一个最新时间
                let dateArr = {         //获取最新时间的年月日分秒
                    yy: date.getFullYear(),
                    mm: date.getMonth(),
                    dd: date.getDate() - 1,
                    hh: date.getHours(),
                    mi: date.getMinutes()
                };
                if (/^\d{4}-\d{1,2}-\d{1,2}\s\d{2}:\d{2}$/.test(defaultDateTime)) {  //通过正则表达式判断是否是正确的类型
                    let rs = defaultDateTime.match(/(^|-|\s|:)\d{1,4}/g);
                    dateArr.yy = rs[0] - this.minY;
                    dateArr.mm = rs[1].replace(/-/g, "") - 1;
                    dateArr.dd = rs[2].replace(/-/g, "") - 1;
                    dateArr.hh = parseInt(rs[3].replace(/\s0?/g, ""));
                    dateArr.mi = parseInt(rs[4].replace(/:0?/g, ""));
                } else {
                    dateArr.yy = dateArr.yy - this.minY;
                }
                //查询到他们的val设置其值
                dateDom.querySelector(".date_yy").setAttribute("val", dateArr.yy);
                dateDom.querySelector(".date_mm").setAttribute("val", dateArr.mm);
                dateDom.querySelector(".date_dd").setAttribute("val", dateArr.dd);
                this.setDateGearTooth(dateDom); //重置日期节点个数
                dateDom.querySelector(".time_hh").setAttribute("val", dateArr.hh);
                dateDom.querySelector(".time_mm").setAttribute("val", dateArr.mi);
                this.setTimeGearTooth(dateDom); //重置时间节点个数

                /** 为其下加了特定类的节点添加监听 */
                let date_yy = dateDom.querySelector(".date_yy");
                let date_mm = dateDom.querySelector(".date_mm");
                let date_dd = dateDom.querySelector(".date_dd");
                let time_hh = dateDom.querySelector(".time_hh");
                let time_mm = dateDom.querySelector(".time_mm");
                /** 移动端 **/
                date_yy.addEventListener('touchstart', this.gearTouchStart);
                date_mm.addEventListener('touchstart', this.gearTouchStart);
                date_dd.addEventListener('touchstart', this.gearTouchStart);
                time_hh.addEventListener('touchstart', this.gearTouchStart);
                time_mm.addEventListener('touchstart', this.gearTouchStart);
                date_yy.addEventListener('touchmove', this.gearTouchMove);
                date_mm.addEventListener('touchmove', this.gearTouchMove);
                date_dd.addEventListener('touchmove', this.gearTouchMove);
                time_hh.addEventListener('touchmove', this.gearTouchMove);
                time_mm.addEventListener('touchmove', this.gearTouchMove);
                date_yy.addEventListener('touchend', this.gearTouchEnd);
                date_mm.addEventListener('touchend', this.gearTouchEnd);
                date_dd.addEventListener('touchend', this.gearTouchEnd);
                time_hh.addEventListener('touchend', this.gearTouchEnd);
                time_mm.addEventListener('touchend', this.gearTouchEnd);
                /** pc端 **/
                date_yy.addEventListener('mousedown', this.gearMouseDown);
                date_mm.addEventListener('mousedown', this.gearMouseDown);
                date_dd.addEventListener('mousedown', this.gearMouseDown);
                time_hh.addEventListener('mousedown', this.gearMouseDown);
                time_mm.addEventListener('mousedown', this.gearMouseDown);
                //获取整个组件节点
                let my_dialog = document.getElementById("my_dialog");
                my_dialog.addEventListener('mousemove', this.gearMouseMove);
                my_dialog.addEventListener('mouseup', this.gearMouseUp);
            },
            //重置日期节点个数
            setDateGearTooth(dateDom) {
                let newY = new Date().getFullYear();
                let passY = this.maxY - this.minY + 1;
                let date_yy = dateDom.querySelector(".date_yy");
                let itemStr = "";
                let yyVal;  //定义年份
                let mmVal;  //定义月份
                if (date_yy && date_yy.getAttribute("val")) {
                    //得到年份的值
                    yyVal = parseInt(date_yy.getAttribute("val"));
                    //p 当前节点前后需要展示的节点个数
                    for (let p = 0; p <= passY - 1; p++) {
                        itemStr += "<div class='tooth'>" + (this.minY + p) + "</div>";
                    }
                    date_yy.innerHTML = itemStr;
                    let top = Math.floor(parseFloat(date_yy.getAttribute('top')));
                    if (!isNaN(top)) {
                        top % 2 == 0 ? (top = top) : (top = top + 1);
                        top > 8 && (top = 8);
                        let minTop = 8 - (passY - 1) * 2;
                        top < minTop && (top = minTop);
                        date_yy.style["-webkit-transform"] = 'translate3d(0,' + top + 'em,0)';
                        date_yy.setAttribute('top', top + 'em');
                        yyVal = Math.abs(top - 8) / 2;
                        date_yy.setAttribute("val", yyVal.toString());
                    } else {
                        let minTop = 8 - (passY - 1) * 2;
                        let gearVal = Math.abs(minTop - 8) / 2;
                        if (this.maxY < newY) {
                            yyVal > gearVal && (yyVal = gearVal);
                        } else if (this.minY > newY) {
                            yyVal < gearVal && (yyVal = gearVal);
                        }
                        date_yy.style["-webkit-transform"] = 'translate3d(0,' + (8 - yyVal * 2) + 'em,0)';
                        date_yy.setAttribute('top', 8 - yyVal * 2 + 'em');
                    }
                } else {
                    return;
                }
                let date_mm = dateDom.querySelector(".date_mm");
                if (date_mm && date_mm.getAttribute("val")) {
                    itemStr = "";
                    //得到月份的值
                    mmVal = parseInt(date_mm.getAttribute("val"));
                    let maxM = 11;
                    let minM = 0;
                    //当年份到达最大值
                    if (yyVal == passY - 1) {
                        maxM = this.maxM - 1;
                    }
                    //当年份到达最小值
                    if (yyVal == 0) {
                        minM = this.minM - 1;
                    }
                    //p 当前节点前后需要展示的节点个数
                    for (let p = 0; p < maxM - minM + 1; p++) {
                        itemStr += "<div class='tooth'>" + (minM + p + 1) + "</div>";
                    }
                    date_mm.innerHTML = itemStr;
                    let top = Math.floor(parseFloat(date_mm.getAttribute('top')));
                    if (!isNaN(top)) {
                        if (mmVal > maxM) {
                            mmVal = maxM;
                        } else if (mmVal < minM) {
                            mmVal = maxM;
                        }
                    } else {
                        if (mmVal > maxM || (this.maxY < newY && !this.trigger.value)) {
                            mmVal = maxM;
                        } else if (mmVal < minM || (this.minY > newY && !this.trigger.value)) {
                            mmVal = maxM;
                        }
                    }
                    date_mm.setAttribute("val", mmVal.toString());
                    date_mm.style["-webkit-transform"] = 'translate3d(0,' + (8 - (mmVal - minM) * 2) + 'em,0)';
                    date_mm.setAttribute('top', 8 - (mmVal - minM) * 2 + 'em');
                } else {
                    return;
                }
                let date_dd = dateDom.querySelector(".date_dd");
                if (date_dd && date_dd.getAttribute("val")) {
                    itemStr = "";
                    //得到日期的值
                    let ddVal = parseInt(date_dd.getAttribute("val"));
                    //返回月份的天数
                    let maxMonthDays = this.calcDays(yyVal, mmVal);
                    //p 当前节点前后需要展示的节点个数
                    let maxD = maxMonthDays - 1;
                    let minD = 0;
                    //当年份月份到达最大值
                    if (yyVal == passY - 1 && this.maxM == mmVal + 1) {
                        maxD = this.maxD - 1;
                    }
                    //当年、月到达最小值
                    if (yyVal == 0 && this.minM == mmVal + 1) {
                        minD = this.minD - 1;
                    }
                    for (let p = 0; p < maxD - minD + 1; p++) {
                        itemStr += "<div class='tooth'>" + (minD + p + 1) + "</div>";
                    }
                    date_dd.innerHTML = itemStr;
                    let top = Math.floor(parseFloat(date_dd.getAttribute('top')));
                    if (!isNaN(top)) {
                        if (ddVal > maxD) {
                            ddVal = maxD;
                        } else if (ddVal < minD) {
                            ddVal = minD;
                        }
                    } else {
                        if (ddVal > maxD || (this.maxY < newY && !this.trigger.value)) {
                            ddVal = maxD;
                        } else if (ddVal < minD || (this.minY > newY && !this.trigger.value)) {
                            ddVal = maxD;
                        }
                    }
                    date_dd.setAttribute("val", ddVal.toString());
                    date_dd.style["-webkit-transform"] = 'translate3d(0,' + (8 - (ddVal - minD) * 2) + 'em,0)';
                    date_dd.setAttribute('top', 8 - (ddVal - minD) * 2 + 'em');
                } else {
                    return;
                }
            },
            //重置时间节点个数
            setTimeGearTooth(dateDom) {
                let time_hh = dateDom.querySelector(".time_hh");
                if (time_hh && time_hh.getAttribute("val")) {
                    let i = "";
                    let hhVal = parseInt(time_hh.getAttribute("val"));
                    for (let g = 0; g <= 23; g++) {
                        i += "<div class='tooth'>" + g + "</div>";
                    }
                    time_hh.innerHTML = i;
                    time_hh.style["-webkit-transform"] = 'translate3d(0,' + (8 - hhVal * 2) + 'em,0)';
                    time_hh.setAttribute('top', 8 - hhVal * 2 + 'em');
                } else {
                    return
                }
                let time_mm = dateDom.querySelector(".time_mm");
                if (time_mm && time_mm.getAttribute("val")) {
                    let i = "";
                    let mmVal = parseInt(time_mm.getAttribute("val"));
                    for (let g = 0; g <= 59; g++) {
                        i += "<div class='tooth'>" + g + "</div>";
                    }
                    time_mm.innerHTML = i;
                    time_mm.style["-webkit-transform"] = 'translate3d(0,' + (8 - mmVal * 2) + 'em,0)';
                    time_mm.setAttribute('top', 8 - mmVal * 2 + 'em');
                } else {
                    return;
                }
            },
            //求月份最大天数
            calcDays(year, month) {
                //根据年月获取最大天数
                //这个语句是返回最大的天数
                return new Date(year += this.minY, month+1, 0).getDate();
            },
            /** 移动端 */
            //触摸开始
            gearTouchStart(e) {
                e.preventDefault();
                let target = e.target;
                while (true) {
                    if (!target.classList.contains("gear")) {
                        target = target.parentElement;
                    } else {
                        break;
                    }
                }
                clearInterval(target["int_" + target.id]);
                target["old_" + target.id] = e.targetTouches[0].screenY;
                target["o_t_" + target.id] = (new Date()).getTime();
                let top = target.getAttribute('top');
                if (top) {
                    target["o_d_" + target.id] = parseFloat(top.replace(/em/g, ""));
                } else {
                    target["o_d_" + target.id] = 0;
                }
                target.style.webkitTransitionDuration = target.style.transitionDuration = '0ms';
            },
            //手指移动
            gearTouchMove(e) {
                e.preventDefault();
                let target = e.target;
                while (true) {
                    if (!target.classList.contains("gear")) {
                        target = target.parentElement;
                    } else {
                        break;
                    }
                }
                target["new_" + target.id] = e.targetTouches[0].screenY;
                target["n_t_" + target.id] = (new Date()).getTime();
                let f = (target["new_" + target.id] - target["old_" + target.id]) * 30 / window.innerHeight;
                target["pos_" + target.id] = target["o_d_" + target.id] + f;
                target.style["-webkit-transform"] = 'translate3d(0,' + target["pos_" + target.id] + 'em,0)';
                target.setAttribute('top', target["pos_" + target.id] + 'em');
                if (e.targetTouches[0].screenY < 1) {
                    this.gearTouchEnd(e);
                }
            },
            //离开屏幕
            gearTouchEnd(e) {
                e.preventDefault();
                let target = e.target;
                while (true) {
                    if (!target.classList.contains("gear")) {
                        target = target.parentElement;
                    } else {
                        break;
                    }
                }
                let flag = (target["new_" + target.id] - target["old_" + target.id]) / (target["n_t_" + target.id] - target["o_t_" + target.id]);
                if (Math.abs(flag) <= 0.2) {
                    target["spd_" + target.id] = (flag < 0 ? -0.08 : 0.08);
                } else {
                    if (Math.abs(flag) <= 0.5) {
                        target["spd_" + target.id] = (flag < 0 ? -0.16 : 0.16);
                    } else {
                        target["spd_" + target.id] = flag / 2;
                    }
                }
                if (!target["pos_" + target.id]) {
                    target["pos_" + target.id] = 0;
                }
                this.rollGear(target);
            },
            /** pc端 */
            gearMouseDown(e){
                //赋予按下状态
                this.isDown = true;
                //dom赋值
                this.checkDom = e;
                e.preventDefault();
                let target = e.target;
                while (true) {
                    if (!target.classList.contains("gear")) {
                        target = target.parentElement;
                    } else {
                        break;
                    }
                }
                clearInterval(target["int_" + target.id]);
                target["old_" + target.id] = e.screenY;
                target["o_t_" + target.id] = (new Date()).getTime();
                let top = target.getAttribute('top');
                if (top) {
                    target["o_d_" + target.id] = parseFloat(top.replace(/em/g, ""));
                } else {
                    target["o_d_" + target.id] = 0;
                }
                target.style.webkitTransitionDuration = target.style.transitionDuration = '0ms';
            },
            gearMouseMove(e){
                e.preventDefault();
                // 如果鼠标正在按下状态拖动
                if (this.isDown){
                    let target = this.checkDom.target;
                    while (true) {
                        if (target.classList == null || !target.classList.contains("gear")) {
                            target = target.parentElement;
                        } else {
                            break;
                        }
                    }
                    target["new_" + target.id] = e.screenY;
                    target["n_t_" + target.id] = (new Date()).getTime();
                    let f = (target["new_" + target.id] - target["old_" + target.id]) * 15 / window.innerHeight;
                    target["pos_" + target.id] = target["o_d_" + target.id] + f;
                    target.style["-webkit-transform"] = 'translate3d(0,' + target["pos_" + target.id] + 'em,0)';
                    target.setAttribute('top', target["pos_" + target.id] + 'em');
                    if (e.screenY < 1) {
                        this.gearMouseUp(e);
                    }
                }
            },
            gearMouseUp(e){
                e.preventDefault();
                let target = this.checkDom.target;
                while (true) {
                    if (!target.classList.contains("gear")) {
                        target = target.parentElement;
                    } else {
                        break;
                    }
                }
                let flag = (target["new_" + target.id] - target["old_" + target.id]) / (target["n_t_" + target.id] - target["o_t_" + target.id]);
                if (Math.abs(flag) <= 0.2) {
                    target["spd_" + target.id] = (flag < 0 ? -0.08 : 0.08);
                } else {
                    if (Math.abs(flag) <= 0.5) {
                        target["spd_" + target.id] = (flag < 0 ? -0.16 : 0.16);
                    } else {
                        target["spd_" + target.id] = flag / 2;
                    }
                }
                if (!target["pos_" + target.id]) {
                    target["pos_" + target.id] = 0;
                }
                this.rollGear(target);
                //手动脱离
                this.isDown = false;
                this.checkDom = "";
            },

            //缓动效果
            rollGear(target) {
                let gearDate = target.parentNode.parentNode.parentNode.parentNode.parentNode;
                let that = this;
                let d = 0;
                let stopGear = false;
                function setDuration() {
                    target.style.webkitTransitionDuration = target.style.transitionDuration = '200ms';
                    stopGear = true;
                }
                let passY = this.maxY - this.minY + 1;
                clearInterval(target["int_" + target.id]);
                target["int_" + target.id] = setInterval(function () {
                    if (!gearDate) {
                        clearInterval(target["int_" + target.id]);
                        return;
                    }
                    let pos = target["pos_" + target.id];
                    let speed = target["spd_" + target.id] * Math.exp(-0.03 * d);
                    pos += speed;
                    if (Math.abs(speed) > 0.1) {
                    } else {
                        let b = Math.round(pos / 2) * 2;
                        pos = b;
                        setDuration();
                    }
                    if (pos > 8) {
                        pos = 8;
                        setDuration();
                    }
                    switch (target.dataset.datetype) {
                        case "date_yy":
                            var minTop = 8 - (passY - 1) * 2;
                            if (pos < minTop) {
                                pos = minTop;
                                setDuration();
                            }
                            if (stopGear) {
                                let gearVal = Math.abs(pos - 8) / 2;
                                that.setGear(target, gearVal);
                                clearInterval(target["int_" + target.id]);
                            }
                            break;
                        case "date_mm":
                            var date_yy = gearDate.querySelector(".date_yy");
                            //得到年份的值
                            var yyVal = parseInt(date_yy.getAttribute("val"));
                            let maxM = 11;
                            let minM = 0;
                            //当年份到达最大值
                            if (yyVal == passY - 1) {
                                maxM = this.maxM - 1;
                            }
                            //当年份到达最小值
                            if (yyVal == 0) {
                                minM = this.minM - 1;
                            }
                            var minTop = 8 - (maxM - minM) * 2;
                            if (pos < minTop) {
                                pos = minTop;
                                setDuration();
                            }
                            if (stopGear) {
                                var gearVal = Math.abs(pos - 8) / 2 + minM;
                                that.setGear(target, gearVal);
                                clearInterval(target["int_" + target.id]);
                            }
                            break;
                        case "date_dd":
                            let date_yy = gearDate.querySelector(".date_yy");
                            let date_mm = gearDate.querySelector(".date_mm");
                            //得到年份的值
                            let yyVal = parseInt(date_yy.getAttribute("val"));
                            //得到月份的值
                            let mmVal = parseInt(date_mm.getAttribute("val"));
                            //返回月份的天数
                            let maxMonthDays = that.calcDays(yyVal, mmVal);
                            let maxD = maxMonthDays - 1;
                            let minD = 0;
                            //当年份月份到达最大值
                            if (yyVal == passY - 1 && that.maxM == mmVal + 1) {
                                maxD = that.maxD - 1;
                            }
                            //当年、月到达最小值
                            if (yyVal == 0 && that.minM == mmVal + 1) {
                                minD = that.minD - 1;
                            }
                            let minTop = 8 - (maxD - minD) * 2;
                            if (pos < minTop) {
                                pos = minTop;
                                setDuration();
                            }
                            if (stopGear) {
                                var gearVal = Math.abs(pos - 8) / 2 + minD;
                                that.setGear(target, gearVal);
                                clearInterval(target["int_" + target.id]);
                            }
                            break;
                        case "time_hh":
                            if (pos < -38) {
                                pos = -38;
                                setDuration();
                            }
                            if (stopGear) {
                                var gearVal = Math.abs(pos - 8) / 2;
                                that.setGear(target, gearVal);
                                clearInterval(target["int_" + target.id]);
                            }
                            break;
                        case "time_mm":
                            if (pos < -110) {
                                pos = -110;
                                setDuration();
                            }
                            if (stopGear) {
                                var gearVal = Math.abs(pos - 8) / 2;
                                that.setGear(target, gearVal);
                                clearInterval(target["int_" + target.id]);
                            }
                            break;
                        default:
                    }
                    target["pos_" + target.id] = pos;
                    target.style["-webkit-transform"] = 'translate3d(0,' + pos + 'em,0)';
                    target.setAttribute('top', pos + 'em');
                    d++;
                }, 30);
            },
            //控制插件滚动后停留的值
            setGear(target, val) {
                let gearDate = target.parentNode.parentNode.parentNode.parentNode.parentNode;//获取到上级节点的根节点
                if (gearDate !== null && !isNaN(val)) {
                    val = Math.round(val);
                    target.setAttribute("val", val);
                    if (/date/.test(target.dataset.datetype)) {
                        this.setDateGearTooth(gearDate);
                    } else {
                        this.setTimeGearTooth(gearDate);
                    }
                }
            },
            //日期转字符串
            dateTimeTurnStr(date){
                let y = date.getFullYear();
                let m = date.getMonth()+1;
                let d = date.getDate();
                let H = date.getHours();
                let M = date.getMinutes();
                let S = date.getSeconds();
                function Covering(num){
                    return num > 10 ? num : "0" + num
                }
                return y+"-"+Covering(m)+"-"+Covering(d)+" " +Covering(H)+":"+Covering(M)
            },

            //取消
            onCancel() {
                this.openDialog = false;
            },
            //确认
            onOK(){
                let passY = this.maxY - this.minY + 1;
                /** 获取第一个时间值 */
                let date_yy = parseInt(Math.round(this.gearStartDate.querySelector(".date_yy").getAttribute("val")));
                let date_mm = parseInt(Math.round(this.gearStartDate.querySelector(".date_mm").getAttribute("val"))) + 1;
                date_mm = date_mm > 9 ? date_mm : '0' + date_mm;
                let date_dd = parseInt(Math.round(this.gearStartDate.querySelector(".date_dd").getAttribute("val"))) + 1;
                date_dd = date_dd > 9 ? date_dd : '0' + date_dd;
                let time_hh = parseInt(Math.round(this.gearStartDate.querySelector(".time_hh").getAttribute("val")));
                time_hh = time_hh > 9 ? time_hh : '0' + time_hh;
                let time_mm = parseInt(Math.round(this.gearStartDate.querySelector(".time_mm").getAttribute("val")));
                time_mm = time_mm > 9 ? time_mm : '0' + time_mm;
                let startDateTime = (date_yy % passY + this.minY) + "-" + date_mm + "-" + date_dd + " " + (time_hh.length < 2 ? "0" : "") + time_hh + (time_mm.length < 2 ? ":0" : ":") + time_mm;
                /** 获取第二个时间值 */
                let end_date_yy = parseInt(Math.round(this.gearEndDate.querySelector(".date_yy").getAttribute("val")));
                let end_date_mm = parseInt(Math.round(this.gearEndDate.querySelector(".date_mm").getAttribute("val"))) + 1;
                end_date_mm = end_date_mm > 9 ? end_date_mm : '0' + end_date_mm;
                let end_date_dd = parseInt(Math.round(this.gearEndDate.querySelector(".date_dd").getAttribute("val"))) + 1;
                end_date_dd = end_date_dd > 9 ? end_date_dd : '0' + end_date_dd;
                let end_time_hh = parseInt(Math.round(this.gearEndDate.querySelector(".time_hh").getAttribute("val")));
                end_time_hh = end_time_hh > 9 ? end_time_hh : '0' + end_time_hh;
                let end_time_mm = parseInt(Math.round(this.gearEndDate.querySelector(".time_mm").getAttribute("val")));
                end_time_mm = end_time_mm > 9 ? end_time_mm : '0' + end_time_mm;
                let endDateTime = (end_date_yy % passY + this.minY) + "-" + end_date_mm + "-" + end_date_dd + " " + (end_time_hh.length < 2 ? "0" : "") + end_time_hh + (end_time_mm.length < 2 ? ":0" : ":") + end_time_mm;
                //方法处理完成
                if (this.callback(new Date(startDateTime) ,new Date(endDateTime))){
                    //关闭弹框
                    this.openDialog = false;
                }
            },
        }
    }
</script>
<style scope>
  * {
    margin: 0;
    padding: 0;
    -webkit-appearance: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    -webkit-touch-callout: none;
    box-sizing: border-box;
  }
  html,
  body {
    margin: 0 auto;
    width: 100%;
    min-height: 100%;
    overflow-x: hidden;
    -webkit-user-select: none;
  }
  body {
    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
    -webkit-text-size-adjust: 100%;
    -webkit-overflow-scrolling: touch;
    overflow-scrolling: touch;
  }
  input {
    width: 90%;
    height: 40px;
    font-size: 18px;
    border: 1px solid #b72f20;
    border-radius: 5px;
    margin: 20px 5% 0 5%;
    padding: 5px;
  }
  h1 {
    background-color: #b72f20;
    color: #fff;
    font-size: 25px;
    text-align: center;
    padding: 10px;
  }

  @import "./LCalendar.css";

  .modal-buttons{
    padding-top: 10px;
    justify-content: center;
  }
  .modal-body {
    padding: 10px 21px;
    max-height: 265px!important;
  }
  .model-content{
    border-radius: 10px;
  }

  .date-time-hint {
    word-wrap: break-word;
    align-content: center;
    margin: auto;
    padding: 0 2px;
    font-size: 12px;
  }
  .dialog-title{
    text-align: center;
    margin: 12px auto;
  }
</style>
