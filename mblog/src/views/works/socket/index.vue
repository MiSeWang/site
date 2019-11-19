<template>
  <div class="hello">
    <span @click="$refs.dateTime.openDialog = true">{{startDateTime}}  {{endDateTime}}</span>
    <v-dateTime ref="dateTime" :startDateTime="startDateTime" :endDateTime="endDateTime" :callback="callback"></v-dateTime>
  </div>
</template>

<script>
    export default {
        name: 'HelloWorld',
        data() {
            return {
                msg: 'W测试页面',
                startDateTime: new Date(),
                // endDateTime: this.$moment().add(2, 'hours')._d,
                endDateTime: new Date(),

                /** webSocket*/
                webSocket: null,   //webSocket
                lockReconnect: null, //锁，防止重复连接
                timeoutObj: null,
                reconnectData: null,
                timeout: 60000,  //60s一次心跳检测
                timeoutObj: null,
                serverTimeoutObj: null,

                isOpenWebSocket: false,
            }
        },
        /** 局部自定义指令 */
        watch: {
        },

        created() {
            this.initWebSocket();//socket初始化
        },
        destroyed(){
            if (this.isOpenWebSocket) { //如果走网页socket，销毁的时候需要销毁
                this.lockReconnect = true;
                this.webSocket.close()                 //离开路由之后断开websocket连接
                clearTimeout(this.reconnectData);      //离开清除 timeout
                clearTimeout(this.timeoutObj);         //离开清除 timeout
                clearTimeout(this.serverTimeoutObj);   //离开清除 timeout
            } else {
                this.$bus.$off("refreshMessageNum")    //如果走原生socket，销毁的时候需要销毁原声特有的方法
            }
            this.$bus.$off("sendInfo")                //离开清除共有的发送监听
            this.$bus.$off("alreadyRead")             //清除已读监听
        },
        methods: {
            /** 点击确认后的回调方法 **/
            callback(start, end){
                this.startDateTime = start;
                this.endDateTime = end;
                return true;
            },


            /**--------------------------- 初始化webSocket ---------------------------*/
            //初始化webSocket 同时进行方法绑定
            initWebSocket() {
                // let wsUri = "ws://iacloud.ceway.com.cn/webSocket?id=" + this.$cookie.getCookie("access-name");//正式环境
                 let wsUri = "ws://172.16.5.32:9220/webSocket/" + "CW6477"; //测试环境
                this.webSocket = new WebSocket(wsUri);
                this.webSocket.onopen = this.webSocketOnOpen;        //连接成功
                this.webSocket.onmessage = this.webSocketOnMessage;  //广播成功
                this.webSocket.onerror = this.webSocketOnError;      //连接断开，失败
                this.webSocket.onclose = this.webSocketClose;        //连接关闭
            },
            //连接建立之后执行send方法发送数据
            webSocketOnOpen() {
                // console.log("webSocketOnOpen, 建立连接成功");
                this.heatBeat() //开启心跳检测
            },
            //连接建立失败重连
            webSocketOnError() {
                // console.log("webSocketOnError 连接建立失败")
                this.reconnect()
            },
            //关闭连接,各种问题导致的 连接关闭
            webSocketClose() {
                // console.log("webSocketClose 断开连接")
                this.reconnect()
            },
            //数据接收处理
            webSocketOnMessage(evt) {
                this.heatBeat(); //收到消息会刷新心跳检测，如果一直收到消息，就推迟心跳发送
                let result = JSON.parse(evt.data);
                if (result.code == 2000) {  //如果是通知消息
                    //收到通知消息，但如果页面是在当前事件消息页面，则通知其刷新页面并且不添加到未阅读消息中
                    if (this.$route.path == "/event-message" && this.$route.query.eventId == result.eventId) {
                        // this.$bus.$emit("refreshEventMessage", result.eventId) //广播刷新eventMessage页面
                    } else {
                        // console.log(this.$route.path, this.$route.query.id)
                        // 如果收到消息,正处于该事件的详情页面,则刷新滚动信息
                        // if (this.$route.path == "/todo-detail" && this.$route.query.id == result.eventId) {
                        //     this.$bus.$emit("refreshEventDetail", result.eventId) //广播刷新eventDetail页面
                        // }
                        // this.messageList.num += 1;
                        // if (this.messageList.data[result.eventId] != null) {
                        //     this.messageList.data[result.eventId] += 1; //收到通知，放入数据中
                        // } else {
                        //     this.messageList.data[result.eventId] = 1;
                        // }
                        // if (this.messageList.open) { //如果正在打开查看页面的话，直接更新
                        //     this.getEventMessageNum()
                        // }
                    }
                }
                if (result.code == 2002) {
                    // this.$root.$emit("EventMessagerefresh") //eventMessage消息刷新
                }
                if (result.code == 2004) {
                    // this.$bus.$emit("refreshEventTask") //刷新事件任务
                }
            },
            //数据发送
            webSocketSend(data) {
                this.webSocket.send(JSON.stringify({
                    code: 2000,
                    data: data,
                    loginName: this.$cookie.getCookie("access-name")
                }));
                // console.log("数据发送");
            },
            //断线重连, 避免重复连接，因为onerror之后会立即触发 onclose
            reconnect() {
                if (this.lockReconnect) {       //这里很关键，因为连接失败之后之后会相继触发 连接关闭，不然会连接上两个 WebSocket
                    return
                }
                this.lockReconnect = true;
                this.reconnectData && clearTimeout(this.reconnectData);
                this.reconnectData = setTimeout(() => { //断线重连，每5秒连一次
                    this.initWebSocket();
                    this.lockReconnect = false;
                    // console.log("断线重连reconnect ： " + this.lockReconnect)
                }, 5000)
            },
            //心跳检测
            heatBeat() {
                this.timeoutObj && clearTimeout(this.timeoutObj);
                this.serverTimeoutObj && clearTimeout(this.serverTimeoutObj);
                this.timeoutObj = setTimeout(() => {
                    if (this.webSocket.readyState == 1) {  //如果可发送则发送，不可发送，则重连
                        this.webSocket.send(JSON.stringify({
                            code: 6000,
                            loginName: this.$cookie.getCookie("access-name")
                        })) //连接成功，发送一个工号到服务端
                    }
                    this.serverTimeoutObj = setTimeout(() => {
                        this.webSocket.close();       //如果  5秒之后我们没有收到 后台返回的心跳检测数据 断开socket，断开后会启动重连机制
                    }, 5000);
                }, this.timeout)
            },
            /**---------------------------------------------------------------------*/
        },
        components: {
            'v-dateTime': () =>
                import("@/components/MdateTime/index.vue"),
        },
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  h1, h2 {
    font-weight: normal;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }
</style>
