####不开启服务端默认测试登陆用户名为
#####用户名:test
#####密码:123456
## 组件

登陆流程调用：<br>
点击登陆 -> 调用store中的user.js的LoginByUsername方法 获取后台token 存储到cookie和store<br>
  点击登陆后跳转页面会被beforeEach拦截，校验是否有角色，如果没有则发送请求GetUserInfo获取用户详细信息<br>
  接下来判断所接收的用户信息，存储到store中。然后用用户信息中的权限数据生成路由，然后把路由存储到store中。

```
- Login / Logout
- Permission authentication
- Multi-environment build
- Dynamic sidebar (supports multi-level routing)
- Dynamic breadcrumb
- I18n
- Customizable theme
- Tags-view(Tab page Support right-click operation)
- Rich text editor
- Markdown editor
- JSON editor
- Screenfull
- Drag and drop list
- Svg Sprite
- Dashboard
- Mock data
- Echarts
- Clipboard
- 401/404 error page
- Error log
- Export excel
- Export zip
- Front-end visualization excel
- Tree Table
- Table example
- Dynamictable example
- Drag and drop table example
- Inline edit table example
- Form example
- Two-step login
- SplitPane
- Drag Dialog
- Dropzone
- Sticky
- CountTo
- Markdown to html
```
