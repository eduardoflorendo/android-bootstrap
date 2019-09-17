<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <application>

        <service
            android:name=".${serviceClass}"
            android:label="@string/title_${activityToLayout(serviceClass)}"
            android:icon="@drawable/ic_glass_logo">
            <#if isLauncher>
            <intent-filter>
                <action android:name="com.google.android.glass.action.VOICE_TRIGGER" />
            </intent-filter>
            <meta-data
                android:name="com.google.android.glass.VoiceTrigger"
                android:resource="@xml/voice_trigger" />
            </#if>
        </service>

        <activity android:name=".LiveCardMenuActivity" android:theme="@style/MenuTheme" />

    </application>

</manifest>
