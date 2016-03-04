<#-- 将ftl中的对象转换成json，只转换hash 和 数组 类型数据-->
<#-- created by chalecao (ch19900606@gmail.com)-->
<#function objectToJsonFunction object>
    <#if object?is_enumerable>
        <#local json = "[">
        <#list object as item>
            <#if item?is_number >
                <#local json = json + '${item}'>
                <#if item_has_next>
                    <#local json = json + ','>
                </#if>
            <#elseif item?is_string>
                <#local json = json + '"${item?html!""?js_string}"'>
                <#if item_has_next>
                    <#local json = json + ','>
                </#if>
            <#elseif item?is_boolean  >
                <#local json = json + '${item?string("true", "false")}'>
                <#if item_has_next>
                    <#local json = json + ','>
                </#if>
            <#elseif item?is_enumerable>
                <#local json = json + objectToJsonFunction(object[key])>
                <#if item_has_next>
                    <#local json = json + ','>
                </#if>
            <#elseif item?is_hash>
                <#local json = json + objectToJsonFunction(object[key])>
                <#if item_has_next>
                    <#local json = json + ','>
                </#if>
            </#if>
        </#list>
        <#return json + "]">
    <#elseif object?is_hash || object?is_hash_ex>
        <#local json = "{">
        <#assign keys = object?keys>
        <#list keys as key>
            <#if object[key]?is_number>
                <#local json = json + '"${key}": ${object[key]}'>
                <#if key_has_next>
                    <#local json = json +',' >
                </#if>
            <#elseif object[key]?is_string>
                <#local json = json + '"${key}": "${object[key]?html!""?js_string}"'>
                <#if key_has_next>
                    <#local json = json +',' >
                </#if>
            <#elseif object[key]?is_boolean >
                <#local json = json + '"${key}": ${object[key]?string("true", "false")}'>
                <#if key_has_next>
                    <#local json = json +',' >
                </#if>
            <#elseif object[key]?is_enumerable>
                <#local json = json + '"${key}":'+ objectToJsonFunction(object[key])>
                <#if key_has_next>
                    <#local json = json +',' >
                </#if>
            </#if>
        </#list>
        <#return json +"}">
    </#if>
</#function>
