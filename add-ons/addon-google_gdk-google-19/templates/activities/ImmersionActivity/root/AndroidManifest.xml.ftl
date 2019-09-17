<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <application>

        <activity
            android:name=".${activityClass}"
            android:label="@string/title_${activityToLayout(activityClass)}"
            android:icon="@drawable/ic_glass_logo">
            <#if isLauncher>
            <intent-filter>
                <action android:name="com.google.android.glass.action.VOICE_TRIGGER" />
            </intent-filter>
            <meta-data
                android:name="com.google.android.glass.VoiceTrigger"
                android:resource="@xml/voice_trigger" />
            </#if>
        </activity>

    </application>

</manifest>
