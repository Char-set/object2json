# object2json
freemarker 中将 数据对象 转换为 json 对象, 具体细节原理
参考我的博客：[皓眸网](http://www.haomou.net)
# 使用方法
```
<#include "function.ftl">
<script type="text/javascript">
    window.webUser = ${objectToJsonFunction(webUser)};
</script>
```
# 说明
本方法主要用于将freemarker 中的对象转换为JSON 对象，目前仅仅可以转换 hash对象、数组对象和常用的string，number，boolean 等数据类型，其他的有待补充，目前是忽略

# 常见的坑坑
1. 注意有个坑就是 string?is_hash 也是 true
2. item.class.simpleName == 'Boolean' 相当于 item?is_boolean 