{ config, pkgs, ... }: {
  config = {
    programs.chromium.extraOpts = {
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SystemUse24HourClock" = true;
      "BrowserSignin" = 0;
      "BlockThirdPartyCookies" = true;
      "BrowserLabsEnabled" = false;
      "DnsOverHttpsMode" = "secure";
      "DownloadBubbleEnabled" = false;
      "SafeBrowsingDeepScanningEnabled" = false;
      "SafeBrowsingExtendedReportingEnabled" = false;
      "SafeBrowsingProtectionLevel" = 0;
      "SafeBrowsingSurverysEnabled" = false;
      "PrivacySandboxSiteEnabledAdsEnabled" = false;
      "PrivacySandboxPromptEnabled" = false;
      "PrivacySandboxAdTopicsEnabled" = false;
      "PrivacySandboxAdMeasurementEnabled" = false;
      "BackgroundModeEnabled" = false;
      "AdsSettingForIntrusiveAdsSites" = 2;
      "SpellcheckLanguage" = [
           "de"
           "en-US"
         ];
      };
  };
}
