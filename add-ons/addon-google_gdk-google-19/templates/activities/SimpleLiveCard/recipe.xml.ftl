<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <merge from="build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <merge from="res/values/styles.xml"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

    <copy from="res/drawable-hdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-hdpi" />

    <#if isLauncher>
    <instantiate from="res/xml/voice_trigger.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/xml/voice_trigger.xml" />
    </#if>

    <instantiate from="src/app_package/Service.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${serviceClass}.java" />

    <#if directRendering>
        <instantiate from="src/app_package/LiveCardRenderer.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/LiveCardRenderer.java" />
    <#else>
        <instantiate from="res/layout/livecard_layout.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
        <merge from="res/values/dimens.xml"
                 to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    </#if>

    <instantiate from="res/menu/main.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/menu/${menuName}.xml" />

    <instantiate from="src/app_package/MenuActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/LiveCardMenuActivity.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${serviceClass}.java" />
</recipe>
