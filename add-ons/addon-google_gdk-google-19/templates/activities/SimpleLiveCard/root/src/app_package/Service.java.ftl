package ${packageName};

import com.google.android.glass.timeline.LiveCard;
import com.google.android.glass.timeline.LiveCard.PublishMode;

import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
<#if !directRendering>
import android.widget.RemoteViews;
</#if>

/**
 * A {@link Service} that publishes a {@link LiveCard} in the timeline.
 */
public class ${serviceClass} extends Service {

    private static final String LIVE_CARD_TAG = "${serviceClass}";

    private LiveCard mLiveCard;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (mLiveCard == null) {
            mLiveCard = new LiveCard(this, LIVE_CARD_TAG);

            <#if directRendering>
            LiveCardRenderer renderer = new LiveCardRenderer(this);
            mLiveCard.setDirectRenderingEnabled(true).getSurfaceHolder().addCallback(renderer);
            <#else>
            RemoteViews remoteViews = new RemoteViews(getPackageName(), R.layout.${layoutName});
            mLiveCard.setViews(remoteViews);
            </#if>

            // Display the options menu when the live card is tapped.
            Intent menuIntent = new Intent(this, LiveCardMenuActivity.class);
            mLiveCard.setAction(PendingIntent.getActivity(this, 0, menuIntent, 0));
            <#if directRendering>
            mLiveCard.attach(this);
            </#if>
            mLiveCard.publish(PublishMode.REVEAL);
        } else {
            mLiveCard.navigate();
        }
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        if (mLiveCard != null && mLiveCard.isPublished()) {
            mLiveCard.unpublish();
            mLiveCard = null;
        }
        super.onDestroy();
    }
}
